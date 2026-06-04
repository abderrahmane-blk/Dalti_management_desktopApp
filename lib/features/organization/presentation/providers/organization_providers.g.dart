// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Member-management datasource bound to the shared [ApiClient].

@ProviderFor(orgMembersRemoteDataSource)
final orgMembersRemoteDataSourceProvider =
    OrgMembersRemoteDataSourceProvider._();

/// Member-management datasource bound to the shared [ApiClient].

final class OrgMembersRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          OrgMembersRemoteDataSource,
          OrgMembersRemoteDataSource,
          OrgMembersRemoteDataSource
        >
    with $Provider<OrgMembersRemoteDataSource> {
  /// Member-management datasource bound to the shared [ApiClient].
  OrgMembersRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orgMembersRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orgMembersRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<OrgMembersRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OrgMembersRemoteDataSource create(Ref ref) {
    return orgMembersRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OrgMembersRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OrgMembersRemoteDataSource>(value),
    );
  }
}

String _$orgMembersRemoteDataSourceHash() =>
    r'2ac67114befd0014e581dce0b7991ae2c1385354';

/// Organization datasource bound to the shared [ApiClient].

@ProviderFor(orgRemoteDataSource)
final orgRemoteDataSourceProvider = OrgRemoteDataSourceProvider._();

/// Organization datasource bound to the shared [ApiClient].

final class OrgRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          OrgRemoteDataSource,
          OrgRemoteDataSource,
          OrgRemoteDataSource
        >
    with $Provider<OrgRemoteDataSource> {
  /// Organization datasource bound to the shared [ApiClient].
  OrgRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orgRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orgRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<OrgRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OrgRemoteDataSource create(Ref ref) {
    return orgRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OrgRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OrgRemoteDataSource>(value),
    );
  }
}

String _$orgRemoteDataSourceHash() =>
    r'4c1fe04ea8e527f42907c222848fe8c5461f9c90';

/// Queue datasource bound to the shared [ApiClient].

@ProviderFor(queueRemoteDataSource)
final queueRemoteDataSourceProvider = QueueRemoteDataSourceProvider._();

/// Queue datasource bound to the shared [ApiClient].

final class QueueRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          QueueRemoteDataSource,
          QueueRemoteDataSource,
          QueueRemoteDataSource
        >
    with $Provider<QueueRemoteDataSource> {
  /// Queue datasource bound to the shared [ApiClient].
  QueueRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'queueRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$queueRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<QueueRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  QueueRemoteDataSource create(Ref ref) {
    return queueRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QueueRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QueueRemoteDataSource>(value),
    );
  }
}

String _$queueRemoteDataSourceHash() =>
    r'e1d75a8dc5fd02df7374f14ec07ab3c9c0b67d4a';

/// Catalog datasource bound to the shared [ApiClient].

@ProviderFor(catalogRemoteDataSource)
final catalogRemoteDataSourceProvider = CatalogRemoteDataSourceProvider._();

/// Catalog datasource bound to the shared [ApiClient].

final class CatalogRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          CatalogRemoteDataSource,
          CatalogRemoteDataSource,
          CatalogRemoteDataSource
        >
    with $Provider<CatalogRemoteDataSource> {
  /// Catalog datasource bound to the shared [ApiClient].
  CatalogRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'catalogRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$catalogRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<CatalogRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CatalogRemoteDataSource create(Ref ref) {
    return catalogRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CatalogRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CatalogRemoteDataSource>(value),
    );
  }
}

String _$catalogRemoteDataSourceHash() =>
    r'158fb09262c4bff4254c368e373ad2f9bd67d7c1';

/// The abstract [OrganizationRepository] — the single type the feature depends
/// on.

@ProviderFor(organizationRepository)
final organizationRepositoryProvider = OrganizationRepositoryProvider._();

/// The abstract [OrganizationRepository] — the single type the feature depends
/// on.

final class OrganizationRepositoryProvider
    extends
        $FunctionalProvider<
          OrganizationRepository,
          OrganizationRepository,
          OrganizationRepository
        >
    with $Provider<OrganizationRepository> {
  /// The abstract [OrganizationRepository] — the single type the feature depends
  /// on.
  OrganizationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'organizationRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$organizationRepositoryHash();

  @$internal
  @override
  $ProviderElement<OrganizationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OrganizationRepository create(Ref ref) {
    return organizationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OrganizationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OrganizationRepository>(value),
    );
  }
}

String _$organizationRepositoryHash() =>
    r'60a83821a13792e1f38bab4f341e3d6042a9a1e5';
