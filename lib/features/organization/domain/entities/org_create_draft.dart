import 'package:desktop_turn_management/features/organization/domain/entities/org_edit_draft.dart';

/// The fields needed to create a new organization (`POST /orgs`). The signed-in
/// user becomes its owner. Mirrors `CreateOrgRequest` on the backend.
class OrgCreateDraft {
  const OrgCreateDraft({
    required this.sector,
    this.subtypeId,
    required this.latitude,
    required this.longitude,
    required this.ar,
    required this.en,
    required this.fr,
  });

  /// 0 = Public, 1 = Private (matches the backend `OrgSector` enum).
  final int sector;

  /// `null` = no subtype; any positive int = that subtype id.
  final int? subtypeId;

  final double latitude;
  final double longitude;

  final OrgTranslationDraft ar;
  final OrgTranslationDraft en;
  final OrgTranslationDraft fr;
}
