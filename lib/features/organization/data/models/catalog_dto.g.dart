// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SpecialtyTranslationDto _$SpecialtyTranslationDtoFromJson(
  Map<String, dynamic> json,
) => _SpecialtyTranslationDto(
  lang: json['lang'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$SpecialtyTranslationDtoToJson(
  _SpecialtyTranslationDto instance,
) => <String, dynamic>{'lang': instance.lang, 'name': instance.name};

_SpecialtyDto _$SpecialtyDtoFromJson(Map<String, dynamic> json) =>
    _SpecialtyDto(
      id: (json['id'] as num).toInt(),
      slug: json['slug'] as String,
      category: (json['category'] as num?)?.toInt(),
      iconUrl: json['iconUrl'] as String?,
      translations:
          (json['translations'] as List<dynamic>?)
              ?.map(
                (e) =>
                    SpecialtyTranslationDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SpecialtyDtoToJson(_SpecialtyDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'category': instance.category,
      'iconUrl': instance.iconUrl,
      'translations': instance.translations,
    };

_OrgSubtypeTranslationDto _$OrgSubtypeTranslationDtoFromJson(
  Map<String, dynamic> json,
) => _OrgSubtypeTranslationDto(
  lang: json['lang'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$OrgSubtypeTranslationDtoToJson(
  _OrgSubtypeTranslationDto instance,
) => <String, dynamic>{'lang': instance.lang, 'name': instance.name};

_OrgSubtypeDto _$OrgSubtypeDtoFromJson(Map<String, dynamic> json) =>
    _OrgSubtypeDto(
      id: (json['id'] as num).toInt(),
      slug: json['slug'] as String,
      translations:
          (json['translations'] as List<dynamic>?)
              ?.map(
                (e) => OrgSubtypeTranslationDto.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$OrgSubtypeDtoToJson(_OrgSubtypeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'translations': instance.translations,
    };
