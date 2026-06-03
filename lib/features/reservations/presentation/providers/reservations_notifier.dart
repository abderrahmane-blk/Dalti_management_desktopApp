import 'dart:async';

import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/reservations/domain/entities/reservation.dart';
import 'package:desktop_turn_management/features/reservations/presentation/providers/reservation_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reservations_notifier.g.dart';

/// Server-backed list state for reservations.
///
/// `build()` seeds the initial value (cache-first, otherwise the first realtime
/// emission) using a single stream subscription, then forwards every
/// subsequent [RealtimeSource] emission into `state`. The notifier is
/// transport-agnostic: it consumes a `RealtimeSource<List<Reservation>>` and so
/// reflects polled updates today and SSE/socket pushes later with no changes
/// here.
@riverpod
class Reservations extends _$Reservations {
  @override
  Future<List<Reservation>> build() async {
    final repository = ref.watch(reservationRepositoryProvider);
    final source = ref.watch(reservationsRealtimeSourceProvider);

    // One subscription drives both the initial value and live updates. Until
    // the initial value is seeded, the first event/error resolves `build()`;
    // afterwards every event is pushed straight into `state`.
    final initial = Completer<List<Reservation>>();
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

    // Offline-first: cached data resolves `build()` instantly when present;
    // later realtime emissions then flow into `state` via the listener.
    final cached = await repository.cachedReservations();
    if (cached.isNotEmpty) {
      seeded = true;
      return cached;
    }
    return initial.future;
  }

  /// Forces an immediate one-shot refresh through the repository, showing a
  /// loading state while it runs. Polling continues independently.
  Future<void> refresh() async {
    state = const AsyncLoading<List<Reservation>>();
    state = await AsyncValue.guard(() async {
      final result =
          await ref.read(reservationRepositoryProvider).fetchReservations();
      return switch (result) {
        Ok(:final value) => value,
        Err(:final error) => throw error,
      };
    });
  }
}
