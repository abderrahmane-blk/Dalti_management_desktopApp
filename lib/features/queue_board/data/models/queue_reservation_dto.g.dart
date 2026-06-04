// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_reservation_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QueueReservationDto _$QueueReservationDtoFromJson(Map<String, dynamic> json) =>
    _QueueReservationDto(
      id: (json['id'] as num).toInt(),
      queueId: (json['queueId'] as num).toInt(),
      status: json['status'] as String,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      userId: json['userId'] as String?,
      position: (json['position'] as num?)?.toInt(),
      secretCode: json['secretCode'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      scheduledDate: json['scheduledDate'] as String?,
      scheduledTime: json['scheduledTime'] as String?,
      info: json['info'],
      servicePointId: (json['servicePointId'] as num?)?.toInt(),
      calledByUserId: json['calledByUserId'] as String?,
      calledAt: json['calledAt'] == null
          ? null
          : DateTime.parse(json['calledAt'] as String),
    );

Map<String, dynamic> _$QueueReservationDtoToJson(
  _QueueReservationDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'queueId': instance.queueId,
  'status': instance.status,
  'name': instance.name,
  'phone': instance.phone,
  'userId': instance.userId,
  'position': instance.position,
  'secretCode': instance.secretCode,
  'createdAt': instance.createdAt?.toIso8601String(),
  'scheduledDate': instance.scheduledDate,
  'scheduledTime': instance.scheduledTime,
  'info': instance.info,
  'servicePointId': instance.servicePointId,
  'calledByUserId': instance.calledByUserId,
  'calledAt': instance.calledAt?.toIso8601String(),
};

_QueueBoardDto _$QueueBoardDtoFromJson(Map<String, dynamic> json) =>
    _QueueBoardDto(
      reservations:
          (json['reservations'] as List<dynamic>?)
              ?.map(
                (e) => QueueReservationDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <QueueReservationDto>[],
    );

Map<String, dynamic> _$QueueBoardDtoToJson(_QueueBoardDto instance) =>
    <String, dynamic>{'reservations': instance.reservations};

_CallResultDto _$CallResultDtoFromJson(Map<String, dynamic> json) =>
    _CallResultDto(
      reservation: QueueReservationDto.fromJson(
        json['reservation'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$CallResultDtoToJson(_CallResultDto instance) =>
    <String, dynamic>{'reservation': instance.reservation};
