// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'walk_in_ticket_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WalkInTicketDto _$WalkInTicketDtoFromJson(Map<String, dynamic> json) =>
    _WalkInTicketDto(
      id: (json['id'] as num).toInt(),
      position: (json['position'] as num).toInt(),
      secretCode: json['secretCode'] as String,
      scheduledDate: json['scheduledDate'] as String?,
      scheduledTime: json['scheduledTime'] as String?,
    );

Map<String, dynamic> _$WalkInTicketDtoToJson(_WalkInTicketDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'position': instance.position,
      'secretCode': instance.secretCode,
      'scheduledDate': instance.scheduledDate,
      'scheduledTime': instance.scheduledTime,
    };
