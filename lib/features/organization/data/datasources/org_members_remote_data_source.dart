import 'package:desktop_turn_management/core/network/api_client.dart';
import 'package:desktop_turn_management/core/network/api_exception.dart';
import 'package:desktop_turn_management/features/organization/data/models/org_member_dto.dart';

/// Talks to the org member-management endpoints under `/orgs/{orgId}/members`.
/// Returns DTOs; surfaces only [ApiException].
class OrgMembersRemoteDataSource {
  OrgMembersRemoteDataSource(this._client);

  final ApiClient _client;

  /// `GET /orgs/{orgId}/members`.
  Future<List<OrgMemberDto>> fetchMembers(int orgId) async {
    final data = await _client.get('/orgs/$orgId/members');
    try {
      final list = (data as List<dynamic>).cast<Map<String, dynamic>>();
      return list.map(OrgMemberDto.fromJson).toList();
    } catch (e) {
      throw _parseError('members list', e);
    }
  }

  /// `POST /orgs/{orgId}/members` — body `{ email, permissions }`.
  Future<OrgMemberDto> addMember(int orgId, String email, int permissions) async {
    final data = await _client.post(
      '/orgs/$orgId/members',
      data: {'email': email, 'permissions': permissions},
    );
    return _readMember(data, 'add member');
  }

  /// `PUT /orgs/{orgId}/members/{userId}/permissions` — body `{ permissions }`.
  Future<OrgMemberDto> setPermissions(
    int orgId,
    String userId,
    int permissions,
  ) async {
    final data = await _client.put(
      '/orgs/$orgId/members/$userId/permissions',
      data: {'permissions': permissions},
    );
    return _readMember(data, 'update permissions');
  }

  /// `DELETE /orgs/{orgId}/members/{userId}`.
  Future<void> removeMember(int orgId, String userId) async {
    await _client.delete('/orgs/$orgId/members/$userId');
  }

  OrgMemberDto _readMember(Object? data, String what) {
    try {
      return OrgMemberDto.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      throw _parseError(what, e);
    }
  }

  ApiException _parseError(String what, Object cause) => ApiException(
        type: ApiErrorType.deserialization,
        message: 'Could not parse the $what response.',
        cause: cause,
      );
}
