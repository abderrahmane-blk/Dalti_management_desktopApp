import 'package:desktop_turn_management/core/network/api_client.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/org_create_draft.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/org_edit_draft.dart';

/// Talks to the organization endpoints under `/orgs/{orgId}`.
class OrgRemoteDataSource {
  OrgRemoteDataSource(this._client);

  final ApiClient _client;

  /// `POST /orgs` — creates an org owned by the caller and returns its new id.
  Future<int> createOrg(OrgCreateDraft draft) async {
    final body = <String, dynamic>{
      'sector': draft.sector,
      'subtypeId': (draft.subtypeId != null && draft.subtypeId! > 0)
          ? draft.subtypeId
          : null,
      'latitude': draft.latitude,
      'longitude': draft.longitude,
      'AR': {'name': draft.ar.name, 'address': draft.ar.address},
      'EN': {'name': draft.en.name, 'address': draft.en.address},
      'FR': {'name': draft.fr.name, 'address': draft.fr.address},
    };
    final data = await _client.post('/orgs', data: body);
    return (data as Map<String, dynamic>)['id'] as int;
  }

  /// `PUT /orgs/{orgId}` — sends sector, optional subtypeId, and all three
  /// language translations.
  Future<void> updateOrg(int orgId, OrgEditDraft draft) async {
    final body = <String, dynamic>{
      'sector': draft.sector,
      'AR': {'name': draft.ar.name, 'address': draft.ar.address},
      'EN': {'name': draft.en.name, 'address': draft.en.address},
      'FR': {'name': draft.fr.name, 'address': draft.fr.address},
    };
    if (draft.subtypeId != null) {
      body['subtypeId'] = draft.subtypeId;
    }
    await _client.put('/orgs/$orgId', data: body);
  }
}
