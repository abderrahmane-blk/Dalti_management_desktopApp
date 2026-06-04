import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/catalog_items.dart';
import 'package:desktop_turn_management/features/organization/presentation/providers/organization_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'org_specialties_notifier.g.dart';

/// Loads the specialties currently linked to [orgId].
/// Fetch-once on build; the edit dialog invalidates it after changes.
@riverpod
class OrgSpecialties extends _$OrgSpecialties {
  @override
  Future<List<SpecialtyItem>> build(int orgId) async {
    final result = await ref
        .read(organizationRepositoryProvider)
        .fetchOrgSpecialties(orgId);
    return switch (result) {
      Ok(:final value) => value,
      Err(:final error) => throw error,
    };
  }
}
