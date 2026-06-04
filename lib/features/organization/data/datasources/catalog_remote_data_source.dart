import 'package:desktop_turn_management/core/network/api_client.dart';
import 'package:desktop_turn_management/features/organization/data/models/catalog_dto.dart';

/// Remote datasource for the global specialty / org-subtype catalogs and the
/// per-org specialty links.
class CatalogRemoteDataSource {
  CatalogRemoteDataSource(this._client);

  final ApiClient _client;

  Future<List<SpecialtyDto>> fetchAllSpecialties() async {
    final data = await _client.get('/specialties');
    return (data as List)
        .map((e) => SpecialtyDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<SpecialtyDto>> fetchOrgSpecialties(int orgId) async {
    final data = await _client.get('/orgs/$orgId/specialties');
    return (data as List)
        .map((e) => SpecialtyDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<OrgSubtypeDto>> fetchOrgSubtypes() async {
    final data = await _client.get('/org-subtypes');
    return (data as List)
        .map((e) => OrgSubtypeDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<void> linkSpecialty(int orgId, int specialtyId) async {
    await _client.post('/orgs/$orgId/specialties/$specialtyId');
  }

  Future<void> unlinkSpecialty(int orgId, int specialtyId) async {
    await _client.delete('/orgs/$orgId/specialties/$specialtyId');
  }
}
