// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => _AppSettings(
  primaryLanguage: json['primaryLanguage'] as String? ?? 'en',
  languageFallback:
      (json['languageFallback'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const ['en', 'fr', 'ar'],
  themeMode: json['themeMode'] as String? ?? 'light',
  accentColor: json['accentColor'] as String? ?? 'blue',
  fontFamily: json['fontFamily'] as String? ?? '',
);

Map<String, dynamic> _$AppSettingsToJson(_AppSettings instance) =>
    <String, dynamic>{
      'primaryLanguage': instance.primaryLanguage,
      'languageFallback': instance.languageFallback,
      'themeMode': instance.themeMode,
      'accentColor': instance.accentColor,
      'fontFamily': instance.fontFamily,
    };
