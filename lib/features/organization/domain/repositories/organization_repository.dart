import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/catalog_items.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/org_create_draft.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/org_edit_draft.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/org_member.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/queue_full_data.dart';

/// The single type the organization feature depends on. Wraps the org + member
/// management endpoints and returns [Result]s (never raw exceptions).
abstract interface class OrganizationRepository {
  /// `GET /orgs/{orgId}/members` — requires MemberManage.
  Future<Result<List<OrgMember>>> fetchMembers(int orgId);

  /// `POST /orgs/{orgId}/members` — add an existing user by email.
  Future<Result<OrgMember>> addMember(int orgId, String email, int permissions);

  /// `PUT /orgs/{orgId}/members/{userId}/permissions`.
  Future<Result<OrgMember>> setMemberPermissions(
    int orgId,
    String userId,
    int permissions,
  );

  /// `DELETE /orgs/{orgId}/members/{userId}`.
  Future<Result<void>> removeMember(int orgId, String userId);

  /// `POST /orgs` — creates an org owned by the caller; returns its new id.
  Future<Result<int>> createOrg(OrgCreateDraft draft);

  /// `PUT /orgs/{orgId}` — partial update of the org's editable fields.
  Future<Result<void>> updateOrg(int orgId, OrgEditDraft draft);

  // ── Queue management ─────────────────────────────────────────────────────

  /// `GET /queues/{queueId}/full` — full queue data including rules JSON.
  Future<Result<QueueFullData>> fetchQueueFull(int queueId);

  /// `PATCH /queues/{queueId}` — update status and/or translations.
  /// [body] keys: `status`, `EN`/`AR`/`FR` (each `{name, description?}`).
  Future<Result<void>> updateQueueInfo(int queueId, Map<String, dynamic> body);

  /// `PATCH /queues/{queueId}/rules` — merge-patch for queue rules.
  Future<Result<void>> updateQueueRules(
    int queueId,
    Map<String, dynamic> patch,
  );

  // ── Catalog ──────────────────────────────────────────────────────────────

  /// `GET /specialties` — full global catalog of specialties.
  Future<Result<List<SpecialtyItem>>> fetchAllSpecialties();

  /// `GET /orgs/{orgId}/specialties` — specialties currently linked to the org.
  Future<Result<List<SpecialtyItem>>> fetchOrgSpecialties(int orgId);

  /// `GET /org-subtypes` — global catalog of org subtypes.
  Future<Result<List<OrgSubtypeItem>>> fetchOrgSubtypes();

  /// `POST /orgs/{orgId}/specialties/{specialtyId}` — link a specialty.
  Future<Result<void>> linkSpecialty(int orgId, int specialtyId);

  /// `DELETE /orgs/{orgId}/specialties/{specialtyId}` — unlink a specialty.
  Future<Result<void>> unlinkSpecialty(int orgId, int specialtyId);
}
