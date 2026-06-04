import 'package:desktop_turn_management/features/queue_board/domain/entities/queue_reservation.dart';
import 'package:desktop_turn_management/features/queue_history/domain/history_dates.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'history_filters.freezed.dart';

/// Front-end-only filters applied over reservations already loaded into the
/// store. Nothing here hits the network — see [apply].
@freezed
abstract class HistoryFilters with _$HistoryFilters {
  const HistoryFilters._();

  const factory HistoryFilters({
    @Default(<ReservationStatus>{}) Set<ReservationStatus> statuses,

    /// Case-insensitive match against name or phone.
    @Default('') String text,

    /// Inclusive sub-range within the loaded window (day-only), or null.
    DateTime? from,
    DateTime? to,

    /// Restrict to a single service point id, or null for any.
    int? servicePointId,
  }) = _HistoryFilters;

  /// True when at least one constraint is set.
  bool get isActive =>
      statuses.isNotEmpty ||
      text.trim().isNotEmpty ||
      from != null ||
      to != null ||
      servicePointId != null;

  /// Returns the subset of [reservations] matching every active constraint.
  List<QueueReservation> apply(List<QueueReservation> reservations) {
    final query = text.trim().toLowerCase();
    final fromDay = from == null ? null : dayOnly(from!);
    final toDay = to == null ? null : dayOnly(to!);

    return reservations.where((r) {
      if (statuses.isNotEmpty && !statuses.contains(r.status)) return false;
      if (servicePointId != null && r.servicePointId != servicePointId) {
        return false;
      }
      if (query.isNotEmpty) {
        final name = (r.name ?? '').toLowerCase();
        final phone = (r.phone ?? '').toLowerCase();
        if (!name.contains(query) && !phone.contains(query)) return false;
      }
      if (fromDay != null || toDay != null) {
        final day = parseIsoDay(r.scheduledDate);
        if (day == null) return false;
        if (fromDay != null && day.isBefore(fromDay)) return false;
        if (toDay != null && day.isAfter(toDay)) return false;
      }
      return true;
    }).toList();
  }
}
