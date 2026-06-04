// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkspaceDto _$WorkspaceDtoFromJson(Map<String, dynamic> json) =>
    _WorkspaceDto(
      userId: json['userId'] as String,
      isPlatformAdmin: json['isPlatformAdmin'] as bool,
      organizations: (json['organizations'] as List<dynamic>)
          .map(
            (e) => ManagedOrganizationDto.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );

Map<String, dynamic> _$WorkspaceDtoToJson(_WorkspaceDto instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'isPlatformAdmin': instance.isPlatformAdmin,
      'organizations': instance.organizations,
    };

_ManagedOrganizationDto _$ManagedOrganizationDtoFromJson(
  Map<String, dynamic> json,
) => _ManagedOrganizationDto(
  id: (json['id'] as num).toInt(),
  sector: json['sector'] as String,
  subtypeId: (json['subtypeId'] as num?)?.toInt(),
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  role: json['role'] as String,
  orgPermissions: (json['orgPermissions'] as num).toInt(),
  ar: LocalizedFieldsDto.fromJson(json['ar'] as Map<String, dynamic>),
  en: LocalizedFieldsDto.fromJson(json['en'] as Map<String, dynamic>),
  fr: LocalizedFieldsDto.fromJson(json['fr'] as Map<String, dynamic>),
  queues: (json['queues'] as List<dynamic>)
      .map((e) => ManagedQueueDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ManagedOrganizationDtoToJson(
  _ManagedOrganizationDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'sector': instance.sector,
  'subtypeId': instance.subtypeId,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'role': instance.role,
  'orgPermissions': instance.orgPermissions,
  'ar': instance.ar,
  'en': instance.en,
  'fr': instance.fr,
  'queues': instance.queues,
};

_ManagedQueueDto _$ManagedQueueDtoFromJson(Map<String, dynamic> json) =>
    _ManagedQueueDto(
      id: (json['id'] as num).toInt(),
      mode: json['mode'] as String,
      status: json['status'] as String,
      effectivePermissions: (json['effectivePermissions'] as num).toInt(),
      grantPermissions: (json['grantPermissions'] as num).toInt(),
      canOperate: json['canOperate'] as bool,
      ar: LocalizedFieldsDto.fromJson(json['ar'] as Map<String, dynamic>),
      en: LocalizedFieldsDto.fromJson(json['en'] as Map<String, dynamic>),
      fr: LocalizedFieldsDto.fromJson(json['fr'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ManagedQueueDtoToJson(_ManagedQueueDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'mode': instance.mode,
      'status': instance.status,
      'effectivePermissions': instance.effectivePermissions,
      'grantPermissions': instance.grantPermissions,
      'canOperate': instance.canOperate,
      'ar': instance.ar,
      'en': instance.en,
      'fr': instance.fr,
    };

_LocalizedFieldsDto _$LocalizedFieldsDtoFromJson(Map<String, dynamic> json) =>
    _LocalizedFieldsDto(
      name: json['name'] as String,
      address: json['address'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$LocalizedFieldsDtoToJson(_LocalizedFieldsDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'address': instance.address,
      'description': instance.description,
    };
