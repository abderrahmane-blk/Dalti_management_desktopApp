/// A specialty from the global catalog (`GET /specialties`).
class SpecialtyItem {
  const SpecialtyItem({
    required this.id,
    required this.slug,
    this.category,
    this.iconUrl,
    required this.nameAr,
    required this.nameEn,
    required this.nameFr,
  });

  final int id;
  final String slug;
  final int? category;
  final String? iconUrl;
  final String nameAr;
  final String nameEn;
  final String nameFr;

  String get displayName =>
      nameEn.isNotEmpty ? nameEn : nameFr.isNotEmpty ? nameFr : nameAr;
}

/// An org subtype from the global catalog (`GET /org-subtypes`).
class OrgSubtypeItem {
  const OrgSubtypeItem({
    required this.id,
    required this.slug,
    required this.nameAr,
    required this.nameEn,
    required this.nameFr,
  });

  final int id;
  final String slug;
  final String nameAr;
  final String nameEn;
  final String nameFr;

  String get displayName =>
      nameEn.isNotEmpty ? nameEn : nameFr.isNotEmpty ? nameFr : nameAr;
}
