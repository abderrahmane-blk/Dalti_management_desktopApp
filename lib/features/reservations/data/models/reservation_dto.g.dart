// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReservationDto _$ReservationDtoFromJson(Map<String, dynamic> json) =>
    _ReservationDto(
      id: json['id'] as String,
      customerName: json['customerName'] as String,
      partySize: (json['partySize'] as num).toInt(),
      scheduledAt: DateTime.parse(json['scheduledAt'] as String),
      status: json['status'] as String,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$ReservationDtoToJson(_ReservationDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerName': instance.customerName,
      'partySize': instance.partySize,
      'scheduledAt': instance.scheduledAt.toIso8601String(),
      'status': instance.status,
      'note': instance.note,
    };
