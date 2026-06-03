import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation.freezed.dart';

/// Lifecycle of a reservation, as understood by the domain/UI. Kept independent
/// of any wire format — the DTO maps backend strings onto these values.
enum ReservationStatus {
  pending,
  confirmed,
  seated,
  completed,
  cancelled,

  /// Fallback for a status the client does not recognise.
  unknown,
}

/// Pure domain model. No JSON, no `dio`, no persistence concerns — this is what
/// the presentation layer consumes. DTOs are mapped to this in the repository.
@freezed
abstract class Reservation with _$Reservation {
  const factory Reservation({
    required String id,
    required String customerName,
    required int partySize,
    required DateTime scheduledAt,
    required ReservationStatus status,
    String? note,
  }) = _Reservation;
}
