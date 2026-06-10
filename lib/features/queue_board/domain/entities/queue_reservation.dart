import 'package:freezed_annotation/freezed_annotation.dart';

part 'queue_reservation.freezed.dart';

/// Lifecycle of a reservation, mirroring the backend `ReservationStatus` enum
/// (declaration order = wire integer value). The queue-server board reports the
/// status by *name* (e.g. "Accepted"); `PATCH /reservations/{id}/status` takes
/// the *integer* — both mappings live here.
enum ReservationStatus {
  pending(0, 'Pending', 'Pending'),
  accepted(1, 'Accepted', 'Accepted'),
  called(2, 'Called', 'Called'),
  seen(3, 'Seen', 'Seen'),
  noShow(4, 'NoShow', 'No-show'),
  deferred(5, 'Deferred', 'Deferred'),
  cancelled(6, 'Cancelled', 'Cancelled'),
  pendingReschedule(7, 'PendingReschedule', 'Pending reschedule'),
  rejected(8, 'Rejected', 'Rejected'),
  passedToNextQueue(9, 'PassedToNextQueue', 'Passed to next queue'),

  /// Fallback for a status the client does not recognise.
  unknown(-1, 'Unknown', 'Unknown');

  const ReservationStatus(this.wireValue, this.wireName, this.label);

  /// Integer sent to `PATCH /reservations/{id}/status`.
  final int wireValue;

  /// Name as the queue-server board serialises it.
  final String wireName;

  /// Human-readable label for the UI.
  final String label;

  static ReservationStatus fromWireName(String name) => values.firstWhere(
        (s) => s.wireName == name,
        orElse: () => unknown,
      );

  /// Whether smart "Call next" may land on this status. The skipped (terminal /
  /// non-waiting) statuses are cancelled, deferred, rejected, pendingReschedule,
  /// seen, passedToNextQueue (and unknown); everything else (pending, accepted,
  /// called, noShow) is callable.
  bool get isCallableByCallNext => switch (this) {
        cancelled ||
        deferred ||
        rejected ||
        pendingReschedule ||
        seen ||
        passedToNextQueue ||
        unknown =>
          false,
        _ => true,
      };

  /// Whether an operator may pass a reservation in this status to the next
  /// queue. Blocked once it's deferred, cancelled, pending-reschedule, rejected
  /// or already passed — the operator must change the status first. Drives
  /// whether the "Send to next queue" action is offered.
  bool get canPassToNextQueue => switch (this) {
        deferred ||
        cancelled ||
        pendingReschedule ||
        rejected ||
        passedToNextQueue =>
          false,
        _ => true,
      };
}

/// A reservation as it appears on a queue's live board (`GET
/// /queue-server/{queueId}/today`). Pure domain model — no JSON.
@freezed
abstract class QueueReservation with _$QueueReservation {
  const QueueReservation._();

  const factory QueueReservation({
    required int id,
    required int queueId,
    required ReservationStatus status,
    String? name,
    String? phone,
    String? userId,
    int? position,
    String? secretCode,
    DateTime? createdAt,
    String? scheduledDate,
    String? scheduledTime,
    String? info,
    int? servicePointId,
    String? calledByUserId,
    DateTime? calledAt,
  }) = _QueueReservation;

  /// Name to show when the reservation carries none (anonymous walk-in).
  String get displayName =>
      (name == null || name!.isEmpty) ? 'Anonymous' : name!;

  bool get isCalled => status == ReservationStatus.called;
  bool get isRejected => status == ReservationStatus.rejected;

  /// The 0-based turn number used by `POST /queue-server/{queueId}/call/{turn}`
  /// (the board is 1-based by position). Null when the reservation has no
  /// position and therefore cannot be called by turn.
  int? get turnNumber => position == null ? null : position! - 1;
}
