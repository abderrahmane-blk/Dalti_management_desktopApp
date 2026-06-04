import 'package:desktop_turn_management/features/queue_board/domain/entities/queue_reservation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'queue_reservation_dto.freezed.dart';
part 'queue_reservation_dto.g.dart';

/// Wire shape of a board reservation. `status` arrives as a name string; `info`
/// is free-form (JSON text or null), so it is read loosely and stringified.
@freezed
abstract class QueueReservationDto with _$QueueReservationDto {
  const QueueReservationDto._();

  const factory QueueReservationDto({
    required int id,
    required int queueId,
    required String status,
    String? name,
    String? phone,
    String? userId,
    int? position,
    String? secretCode,
    DateTime? createdAt,
    String? scheduledDate,
    String? scheduledTime,
    Object? info,
    int? servicePointId,
    String? calledByUserId,
    DateTime? calledAt,
  }) = _QueueReservationDto;

  factory QueueReservationDto.fromJson(Map<String, dynamic> json) =>
      _$QueueReservationDtoFromJson(json);

  QueueReservation toEntity() => QueueReservation(
        id: id,
        queueId: queueId,
        status: ReservationStatus.fromWireName(status),
        name: name,
        phone: phone,
        userId: userId,
        position: position,
        secretCode: secretCode,
        createdAt: createdAt,
        scheduledDate: scheduledDate,
        scheduledTime: scheduledTime,
        info: info?.toString(),
        servicePointId: servicePointId,
        calledByUserId: calledByUserId,
        calledAt: calledAt,
      );
}

/// Envelope of `GET /queue-server/{queueId}/today` (`{ "reservations": [...] }`).
@freezed
abstract class QueueBoardDto with _$QueueBoardDto {
  const QueueBoardDto._();

  const factory QueueBoardDto({
    @Default(<QueueReservationDto>[]) List<QueueReservationDto> reservations,
  }) = _QueueBoardDto;

  factory QueueBoardDto.fromJson(Map<String, dynamic> json) =>
      _$QueueBoardDtoFromJson(json);

  List<QueueReservation> toEntities() =>
      reservations.map((r) => r.toEntity()).toList();
}

/// Envelope of the call endpoints (`{ "turnNumber": n, "reservation": {...} }`).
@freezed
abstract class CallResultDto with _$CallResultDto {
  const CallResultDto._();

  const factory CallResultDto({
    required QueueReservationDto reservation,
  }) = _CallResultDto;

  factory CallResultDto.fromJson(Map<String, dynamic> json) =>
      _$CallResultDtoFromJson(json);
}
