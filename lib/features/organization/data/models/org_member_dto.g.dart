// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'org_member_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrgMemberDto _$OrgMemberDtoFromJson(Map<String, dynamic> json) =>
    _OrgMemberDto(
      userId: json['userId'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      role: json['role'] as String,
      permissions: (json['permissions'] as num).toInt(),
    );

Map<String, dynamic> _$OrgMemberDtoToJson(_OrgMemberDto instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'name': instance.name,
      'role': instance.role,
      'permissions': instance.permissions,
    };
