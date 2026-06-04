import 'package:desktop_turn_management/features/queue_board/domain/entities/queue_reservation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_view.freezed.dart';

/// In-memory view of a queue's loaded history: reservations bucketed by day
/// (`yyyy-MM-dd`), the browsable date window, and which days are mid-refresh.
///
/// This mirrors what lives in the store; the UI and the front-end filters read
/// from here. There is no polling — it only changes on an explicit refresh or a
/// status edit.
@freezed
abstract class HistoryView with _$HistoryView {
  const HistoryView._();

  const factory HistoryView({
    /// Reservations keyed by their `yyyy-MM-dd` day. A day absent from the map
    /// was loaded with zero reservations.
    required Map<String, List<QueueReservation>> byDay,

    /// First browsable day (previous month's 1st).
    required DateTime rangeStart,

    /// Last browsable day (yesterday — today belongs to the live board).
    required DateTime rangeEnd,

    /// Days currently being re-fetched (drives per-date spinners).
    @Default(<String>{}) Set<String> refreshingDays,
  }) = _HistoryView;

  /// Every loaded reservation as a flat list (used by the filter view).
  List<QueueReservation> get all =>
      byDay.values.expand((list) => list).toList();
}
