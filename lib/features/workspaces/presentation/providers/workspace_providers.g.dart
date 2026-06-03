// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Remote datasource bound to the shared [ApiClient].

@ProviderFor(workspaceRemoteDataSource)
final workspaceRemoteDataSourceProvider = WorkspaceRemoteDataSourceProvider._();

/// Remote datasource bound to the shared [ApiClient].

final class WorkspaceRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          WorkspaceRemoteDataSource,
          WorkspaceRemoteDataSource,
          WorkspaceRemoteDataSource
        >
    with $Provider<WorkspaceRemoteDataSource> {
  /// Remote datasource bound to the shared [ApiClient].
  WorkspaceRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workspaceRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workspaceRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<WorkspaceRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WorkspaceRemoteDataSource create(Ref ref) {
    return workspaceRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WorkspaceRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WorkspaceRemoteDataSource>(value),
    );
  }
}

String _$workspaceRemoteDataSourceHash() =>
    r'370cfeee5a92a03d39240adbfca3c274824fecc3';

/// Local datasource bound to the app-wide [KeyValueStore].

@ProviderFor(workspaceLocalDataSource)
final workspaceLocalDataSourceProvider = WorkspaceLocalDataSourceProvider._();

/// Local datasource bound to the app-wide [KeyValueStore].

final class WorkspaceLocalDataSourceProvider
    extends
        $FunctionalProvider<
          WorkspaceLocalDataSource,
          WorkspaceLocalDataSource,
          WorkspaceLocalDataSource
        >
    with $Provider<WorkspaceLocalDataSource> {
  /// Local datasource bound to the app-wide [KeyValueStore].
  WorkspaceLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workspaceLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workspaceLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<WorkspaceLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WorkspaceLocalDataSource create(Ref ref) {
    return workspaceLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WorkspaceLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WorkspaceLocalDataSource>(value),
    );
  }
}

String _$workspaceLocalDataSourceHash() =>
    r'ee8ca51f842fe982d01938db8281eb11a75772ab';

/// The abstract [WorkspaceRepository] — the single type the feature depends on.

@ProviderFor(workspaceRepository)
final workspaceRepositoryProvider = WorkspaceRepositoryProvider._();

/// The abstract [WorkspaceRepository] — the single type the feature depends on.

final class WorkspaceRepositoryProvider
    extends
        $FunctionalProvider<
          WorkspaceRepository,
          WorkspaceRepository,
          WorkspaceRepository
        >
    with $Provider<WorkspaceRepository> {
  /// The abstract [WorkspaceRepository] — the single type the feature depends on.
  WorkspaceRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workspaceRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workspaceRepositoryHash();

  @$internal
  @override
  $ProviderElement<WorkspaceRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WorkspaceRepository create(Ref ref) {
    return workspaceRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WorkspaceRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WorkspaceRepository>(value),
    );
  }
}

String _$workspaceRepositoryHash() =>
    r'0047d15655f767c9d3e49b00b0c50129a80e107d';
