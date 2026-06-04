import 'package:desktop_turn_management/features/walk_in/domain/entities/walk_in_ticket.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'walk_in_ticket_dto.freezed.dart';
part 'walk_in_ticket_dto.g.dart';

/// Wire shape of the `POST /queues/{queueId}/reserve` response. The endpoint
/// also returns `status`/`info`, which a walk-in ticket does not need, so they
/// are ignored here.
///
/// `position` is nullable: time-based queues return `"position": null` for a
/// scheduled reservation (the slot is the scheduled time, not a queue rank),
/// while simple queues return a numeric rank.
@freezed
abstract class WalkInTicketDto with _$WalkInTicketDto {
  const WalkInTicketDto._();

  const factory WalkInTicketDto({
    required int id,
    int? position,
    required String secretCode,
    String? scheduledDate,
    String? scheduledTime,
  }) = _WalkInTicketDto;

  factory WalkInTicketDto.fromJson(Map<String, dynamic> json) =>
      _$WalkInTicketDtoFromJson(json);

  WalkInTicket toEntity() => WalkInTicket(
        id: id,
        position: position,
        secretCode: secretCode,
        scheduledDate: scheduledDate,
        scheduledTime: scheduledTime,
      );
}
