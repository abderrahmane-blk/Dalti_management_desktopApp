// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_QueueTranslationItemDto _$QueueTranslationItemDtoFromJson(
  Map<String, dynamic> json,
) => _QueueTranslationItemDto(
  name: json['name'] as String,
  description: json['description'] as String?,
);

Map<String, dynamic> _$QueueTranslationItemDtoToJson(
  _QueueTranslationItemDto instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
};

_QueueDetailDto _$QueueDetailDtoFromJson(
  Map<String, dynamic> json,
) => _QueueDetailDto(
  id: (json['id'] as num).toInt(),
  orgId: (json['orgId'] as num).toInt(),
  mode: json['mode'] as String,
  status: json['status'] as String,
  rules: json['rules'] as String,
  nextQueueId: (json['nextQueueId'] as num?)?.toInt(),
  ar: json['ar'] == null
      ? null
      : QueueTranslationItemDto.fromJson(json['ar'] as Map<String, dynamic>),
  en: json['en'] == null
      ? null
      : QueueTranslationItemDto.fromJson(json['en'] as Map<String, dynamic>),
  fr: json['fr'] == null
      ? null
      : QueueTranslationItemDto.fromJson(json['fr'] as Map<String, dynamic>),
);

Map<String, dynamic> _$QueueDetailDtoToJson(_QueueDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orgId': instance.orgId,
      'mode': instance.mode,
      'status': instance.status,
      'rules': instance.rules,
      'nextQueueId': instance.nextQueueId,
      'ar': instance.ar,
      'en': instance.en,
      'fr': instance.fr,
    };
