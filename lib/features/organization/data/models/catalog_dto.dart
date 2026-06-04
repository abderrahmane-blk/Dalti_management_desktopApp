import 'package:desktop_turn_management/features/organization/domain/entities/catalog_items.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_dto.freezed.dart';
part 'catalog_dto.g.dart';

@freezed
abstract class SpecialtyTranslationDto with _$SpecialtyTranslationDto {
  const factory SpecialtyTranslationDto({
    required String lang,
    required String name,
  }) = _SpecialtyTranslationDto;

  factory SpecialtyTranslationDto.fromJson(Map<String, dynamic> json) =>
      _$SpecialtyTranslationDtoFromJson(json);
}

@freezed
abstract class SpecialtyDto with _$SpecialtyDto {
  const SpecialtyDto._();

  const factory SpecialtyDto({
    required int id,
    required String slug,
    int? category,
    String? iconUrl,
    @Default([]) List<SpecialtyTranslationDto> translations,
  }) = _SpecialtyDto;

  factory SpecialtyDto.fromJson(Map<String, dynamic> json) =>
      _$SpecialtyDtoFromJson(json);

  SpecialtyItem toEntity() {
    String nameAr = '', nameEn = '', nameFr = '';
    for (final t in translations) {
      switch (t.lang.toUpperCase()) {
        case 'AR':
          nameAr = t.name;
        case 'EN':
          nameEn = t.name;
        case 'FR':
          nameFr = t.name;
      }
    }
    return SpecialtyItem(
      id: id,
      slug: slug,
      category: category,
      iconUrl: iconUrl,
      nameAr: nameAr,
      nameEn: nameEn,
      nameFr: nameFr,
    );
  }
}

@freezed
abstract class OrgSubtypeTranslationDto with _$OrgSubtypeTranslationDto {
  const factory OrgSubtypeTranslationDto({
    required String lang,
    required String name,
  }) = _OrgSubtypeTranslationDto;

  factory OrgSubtypeTranslationDto.fromJson(Map<String, dynamic> json) =>
      _$OrgSubtypeTranslationDtoFromJson(json);
}

@freezed
abstract class OrgSubtypeDto with _$OrgSubtypeDto {
  const OrgSubtypeDto._();

  const factory OrgSubtypeDto({
    required int id,
    required String slug,
    @Default([]) List<OrgSubtypeTranslationDto> translations,
  }) = _OrgSubtypeDto;

  factory OrgSubtypeDto.fromJson(Map<String, dynamic> json) =>
      _$OrgSubtypeDtoFromJson(json);

  OrgSubtypeItem toEntity() {
    String nameAr = '', nameEn = '', nameFr = '';
    for (final t in translations) {
      switch (t.lang.toUpperCase()) {
        case 'AR':
          nameAr = t.name;
        case 'EN':
          nameEn = t.name;
        case 'FR':
          nameFr = t.name;
      }
    }
    return OrgSubtypeItem(
      id: id,
      slug: slug,
      nameAr: nameAr,
      nameEn: nameEn,
      nameFr: nameFr,
    );
  }
}
