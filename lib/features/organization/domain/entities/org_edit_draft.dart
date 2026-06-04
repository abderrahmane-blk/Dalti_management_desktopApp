/// One language's editable organization fields.
class OrgTranslationDraft {
  const OrgTranslationDraft({required this.name, required this.address});

  final String name;
  final String address;
}

/// The fields the edit-organization form can change.
class OrgEditDraft {
  const OrgEditDraft({
    required this.sector,
    this.subtypeId,
    required this.ar,
    required this.en,
    required this.fr,
  });

  /// 0 = Public, 1 = Private (matches the backend `OrgSector` enum).
  final int sector;

  /// `null` = do not touch the current subtype.
  /// `0` = clear the subtype.
  /// Any positive int = set to that subtype id.
  final int? subtypeId;

  final OrgTranslationDraft ar;
  final OrgTranslationDraft en;
  final OrgTranslationDraft fr;
}
