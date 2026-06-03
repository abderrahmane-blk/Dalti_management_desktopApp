import 'package:desktop_turn_management/features/reservations/domain/entities/reservation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation_dto.freezed.dart';
part 'reservation_dto.g.dart';

/// Wire/storage representation of a reservation.
///
/// Lives entirely in the data layer: it is what `dio` deserializes and what the
/// local store persists. It never escapes a repository — repositories convert
/// to/from the [Reservation] domain entity via [toEntity]/[fromEntity].
@freezed
abstract class ReservationDto with _$ReservationDto {
  const ReservationDto._();

  const factory ReservationDto({
    required String id,
    required String customerName,
    required int partySize,
    required DateTime scheduledAt,
    required String status,
    String? note,
  }) = _ReservationDto;

  factory ReservationDto.fromJson(Map<String, dynamic> json) =>
      _$ReservationDtoFromJson(json);

  factory ReservationDto.fromEntity(Reservation entity) => ReservationDto(
        id: entity.id,
        customerName: entity.customerName,
        partySize: entity.partySize,
        scheduledAt: entity.scheduledAt,
        status: entity.status.name,
        note: entity.note,
      );

  /// Maps the wire `status` string onto the domain enum, defaulting unknown
  /// values to [ReservationStatus.unknown] rather than throwing.
  Reservation toEntity() => Reservation(
        id: id,
        customerName: customerName,
        partySize: partySize,
        scheduledAt: scheduledAt,
        status: ReservationStatus.values.firstWhere(
          (s) => s.name == status,
          orElse: () => ReservationStatus.unknown,
        ),
        note: note,
      );
}
