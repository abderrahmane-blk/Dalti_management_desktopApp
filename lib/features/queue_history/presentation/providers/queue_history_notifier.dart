import 'package:desktop_turn_management/core/network/api_exception.dart';
import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/queue_board/domain/entities/queue_reservation.dart';
import 'package:desktop_turn_management/features/queue_history/domain/entities/history_view.dart';
import 'package:desktop_turn_management/features/queue_history/domain/history_dates.dart';
import 'package:desktop_turn_management/features/queue_history/presentation/providers/queue_history_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'queue_history_notifier.g.dart';

/// Loads and holds a queue's reservation history.
///
/// Unlike the live board, this does **not** poll. `build()` loads the previous
/// month + the current month (up to yesterday) once; afterwards the state only
/// changes when the user refreshes a date/month or edits a status. Reservations
/// live in the store (KeyValueStore) behind the repository.
@riverpod
class QueueHistory extends _$QueueHistory {
  @override
  Future<HistoryView> build(int queueId) async {
    // TODO(tz): "today" is taken from the local clock; the backend buckets
    // ScheduledDate in UTC and has no per-org timezone yet.
    final today = dayOnly(DateTime.now());
    final rangeEnd = today.subtract(const Duration(days: 1)); // yesterday
    final currentMonth = firstOfMonth(today);
    final prevMonth = firstOfPreviousMonth(today);

    final result = await ref.read(queueHistoryRepositoryProvider).loadMonths(
      queueId,
      [
        (year: prevMonth.year, month: prevMonth.month),
        (year: currentMonth.year, month: currentMonth.month),
      ],
    );

    return switch (result) {
      Ok(:final value) => HistoryView(
          byDay: value,
          rangeStart: prevMonth,
          rangeEnd: rangeEnd,
        ),
      Err(:final error) => throw error,
    };
  }

  /// The current loaded view, or null while loading / in error.
  HistoryView? get _view => switch (state) {
        AsyncData(:final value) => value,
        _ => null,
      };

  /// Re-fetches a single [date] and replaces its bucket in the store + state.
  /// Returns the [ApiException] on failure (or null on success) for the UI.
  Future<ApiException?> refreshDate(DateTime date) async {
    final view = _view;
    if (view == null) return null;
    final day = isoDay(date);

    state = AsyncData(view.copyWith(
      refreshingDays: {...view.refreshingDays, day},
    ));

    final result =
        await ref.read(queueHistoryRepositoryProvider).refreshDate(queueId, date);

    final current = _view ?? view;
    final nextRefreshing = {...current.refreshingDays}..remove(day);

    switch (result) {
      case Ok(:final value):
        state = AsyncData(current.copyWith(
          byDay: {...current.byDay, day: value},
          refreshingDays: nextRefreshing,
        ));
        return null;
      case Err(:final error):
        state = AsyncData(current.copyWith(refreshingDays: nextRefreshing));
        return error;
    }
  }

  /// Re-fetches a whole month, replacing all of that month's day buckets.
  Future<ApiException?> refreshMonth(int year, int month) async {
    final view = _view;
    if (view == null) return null;

    final result = await ref
        .read(queueHistoryRepositoryProvider)
        .refreshMonth(queueId, year, month);

    switch (result) {
      case Ok(:final value):
        final prefix = '$year-${month.toString().padLeft(2, '0')}-';
        final nextByDay = <String, List<QueueReservation>>{
          for (final e in view.byDay.entries)
            if (!e.key.startsWith(prefix)) e.key: e.value,
          ...value,
        };
        state = AsyncData(view.copyWith(byDay: nextByDay));
        return null;
      case Err(:final error):
        return error;
    }
  }

  /// Updates a reservation's status (the UI restricts the allowed set), then
  /// patches it in place in state. Returns the error on failure.
  Future<ApiException?> changeStatus(
    int reservationId,
    ReservationStatus status,
  ) async {
    final view = _view;
    if (view == null) return null;

    final result = await ref
        .read(queueHistoryRepositoryProvider)
        .updateStatus(reservationId, status.wireValue);

    if (result case Err(:final error)) return error;

    // TODO(hybrid): also persist this change to the store (needs a
    // QueueReservationDto.fromEntity) once the store is durable; for now the
    // store bucket re-syncs on the next date/month refresh.
    final nextByDay = <String, List<QueueReservation>>{};
    view.byDay.forEach((day, list) {
      nextByDay[day] = list
          .map((r) => r.id == reservationId ? r.copyWith(status: status) : r)
          .toList();
    });
    state = AsyncData(view.copyWith(byDay: nextByDay));
    return null;
  }
}
