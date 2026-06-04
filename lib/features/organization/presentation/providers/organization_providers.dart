import 'package:desktop_turn_management/core/network/api_client.dart';
import 'package:desktop_turn_management/features/organization/data/datasources/catalog_remote_data_source.dart';
import 'package:desktop_turn_management/features/organization/data/datasources/org_members_remote_data_source.dart';
import 'package:desktop_turn_management/features/organization/data/datasources/org_remote_data_source.dart';
import 'package:desktop_turn_management/features/organization/data/datasources/queue_remote_data_source.dart';
import 'package:desktop_turn_management/features/organization/data/repositories/organization_repository_impl.dart';
import 'package:desktop_turn_management/features/organization/domain/repositories/organization_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'organization_providers.g.dart';

/// Member-management datasource bound to the shared [ApiClient].
@riverpod
OrgMembersRemoteDataSource orgMembersRemoteDataSource(Ref ref) =>
    OrgMembersRemoteDataSource(ref.watch(apiClientProvider));

/// Organization datasource bound to the shared [ApiClient].
@riverpod
OrgRemoteDataSource orgRemoteDataSource(Ref ref) =>
    OrgRemoteDataSource(ref.watch(apiClientProvider));

/// Queue datasource bound to the shared [ApiClient].
@riverpod
QueueRemoteDataSource queueRemoteDataSource(Ref ref) =>
    QueueRemoteDataSource(ref.watch(apiClientProvider));

/// Catalog datasource bound to the shared [ApiClient].
@riverpod
CatalogRemoteDataSource catalogRemoteDataSource(Ref ref) =>
    CatalogRemoteDataSource(ref.watch(apiClientProvider));

/// The abstract [OrganizationRepository] — the single type the feature depends
/// on.
@riverpod
OrganizationRepository organizationRepository(Ref ref) =>
    OrganizationRepositoryImpl(
      members: ref.watch(orgMembersRemoteDataSourceProvider),
      org: ref.watch(orgRemoteDataSourceProvider),
      queue: ref.watch(queueRemoteDataSourceProvider),
      catalog: ref.watch(catalogRemoteDataSourceProvider),
    );
