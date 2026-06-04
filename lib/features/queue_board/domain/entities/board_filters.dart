import 'package:desktop_turn_management/features/queue_board/domain/entities/queue_reservation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_filters.freezed.dart';

/// Front-end-only filters applied over the reservations already on the board
/// (today is a single day, so there is no date range here). Nothing hits the
/// network — see [apply]. Mirrors the history slice's `HistoryFilters`.
@freezed
abstract class BoardFilters with _$BoardFilters {
  const BoardFilters._();

  const factory BoardFilters({
    @Default(<ReservationStatus>{}) Set<ReservationStatus> statuses,

    /// Case-insensitive match against name or phone.
    @Default('') String text,

    /// Restrict to a single service point id, or null for any.
    int? servicePointId,
  }) = _BoardFilters;

  /// True when at least one constraint is set.
  bool get isActive =>
      statuses.isNotEmpty || text.trim().isNotEmpty || servicePointId != null;

  /// Returns the subset of [reservations] matching every active constraint.
  List<QueueReservation> apply(List<QueueReservation> reservations) {
    final query = text.trim().toLowerCase();

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
      return true;
    }).toList();
  }
}
