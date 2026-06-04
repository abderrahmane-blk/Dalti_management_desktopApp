import 'dart:async';

import 'package:desktop_turn_management/core/network/api_exception.dart';
import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/queue_board/domain/entities/queue_reservation.dart';
import 'package:desktop_turn_management/features/queue_board/presentation/providers/queue_board_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'queue_board_notifier.g.dart';

/// Live board state for one queue.
///
/// `build()` seeds from the first [RealtimeSource] emission and forwards every
/// subsequent emission (a 10s poll today) into `state`. Operator actions
/// (call-next, call/recall, status change, pass-to-next) run through the
/// repository and then force an immediate [refresh]; each returns the
/// [ApiException] on failure (or `null` on success) so the UI can report it.
@riverpod
class QueueBoard extends _$QueueBoard {
  @override
  Future<List<QueueReservation>> build(int queueId) async {
    final source = ref.watch(queueBoardRealtimeSourceProvider(queueId));

    final initial = Completer<List<QueueReservation>>();
    var seeded = false;

    final subscription = source.watch().listen(
      (data) {
        if (seeded) {
          state = AsyncData(data);
        } else {
          seeded = true;
          initial.complete(data);
        }
      },
      onError: (Object error, StackTrace stackTrace) {
        if (seeded) {
          state = AsyncError(error, stackTrace);
        } else {
          seeded = true;
          initial.completeError(error, stackTrace);
        }
      },
    );
    ref.onDispose(subscription.cancel);

    return initial.future;
  }

  /// One-shot refresh through the repository (the "refresh" button / after an
  /// action). Updates in place — no loading flash — so the visible board does
  /// not blank out. Polling continues independently.
  Future<void> refresh() async {
    final result =
        await ref.read(queueBoardRepositoryProvider).fetchToday(queueId);
    state = switch (result) {
      Ok(:final value) => AsyncData(value),
      Err(:final error) => AsyncError(error, StackTrace.current),
    };
  }

  /// Smart "Call next": finds the next callable reservation at/after the server
  /// turn pointer, jumps the pointer past any non-callable ones in between (via
  /// set-next-turn), then calls. Returns a [CallNextOutcome] for the UI.
  Future<CallNextOutcome> smartCallNext() async {
    final repository = ref.read(queueBoardRepositoryProvider);

    // Fresh board (for statuses) + the current pointer.
    final boardResult = await repository.fetchToday(queueId);
    final board = boardResult.valueOrNull;
    if (board == null) {
      return CallNextError((boardResult as Err<List<QueueReservation>>).error);
    }

    final pointerResult = await repository.nextTurn(queueId);
    final nextTurn = pointerResult.valueOrNull;
    if (nextTurn == null) {
      return CallNextError((pointerResult as Err<int>).error);
    }

    // First callable reservation at/after the pointer (turnNumber = position-1).
    final ordered = board.where((r) => r.position != null).toList()
      ..sort((a, b) => a.position!.compareTo(b.position!));
    QueueReservation? target;
    for (final reservation in ordered) {
      if (reservation.position! - 1 < nextTurn) continue;
      if (reservation.status.isCallableByCallNext) {
        target = reservation;
        break;
      }
    }
    if (target == null) return const NoCallable();

    // Advance the pointer past the skipped ones (if any), then call.
    final turn = target.position! - 1;
    if (turn != nextTurn) {
      final setResult = await repository.setNextTurn(queueId, turn);
      if (setResult case Err(:final error)) return CallNextError(error);
    }

    final callResult = await repository.callNext(queueId);
    await refresh();
    return switch (callResult) {
      Ok(:final value) => CalledReservation(value),
      Err(:final error) => CallNextError(error),
    };
  }

  Future<ApiException?> callTurn(int turnNumber) async => _finish(
        await ref.read(queueBoardRepositoryProvider).callTurn(queueId, turnNumber),
      );

  Future<ApiException?> updateStatus(int reservationId, int statusValue) async =>
      _finish(
        await ref
            .read(queueBoardRepositoryProvider)
            .updateStatus(reservationId, statusValue),
      );

  Future<ApiException?> passToNextQueue(int reservationId) async => _finish(
        await ref.read(queueBoardRepositoryProvider).passToNextQueue(reservationId),
      );

  /// Refreshes on success; returns the error (without refreshing) on failure.
  Future<ApiException?> _finish(Result<Object?> result) async {
    if (result case Err(:final error)) {
      return error;
    }
    await refresh();
    return null;
  }
}

/// Result of [QueueBoard.smartCallNext], so the UI can report what happened.
sealed class CallNextOutcome {
  const CallNextOutcome();
}

/// A reservation was successfully called.
class CalledReservation extends CallNextOutcome {
  const CalledReservation(this.reservation);
  final QueueReservation reservation;
}

/// No callable reservation remained at/after the pointer.
class NoCallable extends CallNextOutcome {
  const NoCallable();
}

/// A network/transport step failed.
class CallNextError extends CallNextOutcome {
  const CallNextError(this.error);
  final ApiException error;
}
