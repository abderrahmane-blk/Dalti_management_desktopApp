import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/organization/data/datasources/catalog_remote_data_source.dart';
import 'package:desktop_turn_management/features/organization/data/datasources/org_members_remote_data_source.dart';
import 'package:desktop_turn_management/features/organization/data/datasources/org_remote_data_source.dart';
import 'package:desktop_turn_management/features/organization/data/datasources/queue_remote_data_source.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/catalog_items.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/org_create_draft.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/org_edit_draft.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/org_member.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/queue_full_data.dart';
import 'package:desktop_turn_management/features/organization/domain/repositories/organization_repository.dart';

class OrganizationRepositoryImpl implements OrganizationRepository {
  OrganizationRepositoryImpl({
    required this._members,
    required this._org,
    required this._queue,
    required this._catalog,
  });

  final OrgMembersRemoteDataSource _members;
  final OrgRemoteDataSource _org;
  final QueueRemoteDataSource _queue;
  final CatalogRemoteDataSource _catalog;

  @override
  Future<Result<List<OrgMember>>> fetchMembers(int orgId) {
    return guard(() async {
      final dtos = await _members.fetchMembers(orgId);
      return dtos.map((d) => d.toEntity()).toList();
    });
  }

  @override
  Future<Result<OrgMember>> addMember(
    int orgId,
    String email,
    int permissions,
  ) {
    return guard(() async {
      final dto = await _members.addMember(orgId, email, permissions);
      return dto.toEntity();
    });
  }

  @override
  Future<Result<OrgMember>> setMemberPermissions(
    int orgId,
    String userId,
    int permissions,
  ) {
    return guard(() async {
      final dto = await _members.setPermissions(orgId, userId, permissions);
      return dto.toEntity();
    });
  }

  @override
  Future<Result<void>> removeMember(int orgId, String userId) {
    return guard(() => _members.removeMember(orgId, userId));
  }

  @override
  Future<Result<int>> createOrg(OrgCreateDraft draft) {
    return guard(() => _org.createOrg(draft));
  }

  @override
  Future<Result<void>> updateOrg(int orgId, OrgEditDraft draft) {
    return guard(() => _org.updateOrg(orgId, draft));
  }

  @override
  Future<Result<QueueFullData>> fetchQueueFull(int queueId) {
    return guard(() async {
      final dto = await _queue.fetchQueueFull(queueId);
      return dto.toEntity();
    });
  }

  @override
  Future<Result<void>> updateQueueInfo(
    int queueId,
    Map<String, dynamic> body,
  ) {
    return guard(() => _queue.updateQueueInfo(queueId, body));
  }

  @override
  Future<Result<void>> updateQueueRules(
    int queueId,
    Map<String, dynamic> patch,
  ) {
    return guard(() => _queue.updateQueueRules(queueId, patch));
  }

  @override
  Future<Result<List<SpecialtyItem>>> fetchAllSpecialties() {
    return guard(() async {
      final dtos = await _catalog.fetchAllSpecialties();
      return dtos.map((d) => d.toEntity()).toList();
    });
  }

  @override
  Future<Result<List<SpecialtyItem>>> fetchOrgSpecialties(int orgId) {
    return guard(() async {
      final dtos = await _catalog.fetchOrgSpecialties(orgId);
      return dtos.map((d) => d.toEntity()).toList();
    });
  }

  @override
  Future<Result<List<OrgSubtypeItem>>> fetchOrgSubtypes() {
    return guard(() async {
      final dtos = await _catalog.fetchOrgSubtypes();
      return dtos.map((d) => d.toEntity()).toList();
    });
  }

  @override
  Future<Result<void>> linkSpecialty(int orgId, int specialtyId) {
    return guard(() => _catalog.linkSpecialty(orgId, specialtyId));
  }

  @override
  Future<Result<void>> unlinkSpecialty(int orgId, int specialtyId) {
    return guard(() => _catalog.unlinkSpecialty(orgId, specialtyId));
  }
}
