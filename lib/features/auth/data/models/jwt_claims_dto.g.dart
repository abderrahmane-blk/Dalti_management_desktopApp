// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_claims_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JwtClaimsDto _$JwtClaimsDtoFromJson(Map<String, dynamic> json) =>
    _JwtClaimsDto(
      sub: json['sub'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$JwtClaimsDtoToJson(_JwtClaimsDto instance) =>
    <String, dynamic>{
      'sub': instance.sub,
      'email': instance.email,
      'name': instance.name,
    };
