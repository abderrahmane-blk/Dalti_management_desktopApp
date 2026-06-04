// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'walk_in_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Remote datasource bound to the shared [ApiClient].

@ProviderFor(walkInRemoteDataSource)
final walkInRemoteDataSourceProvider = WalkInRemoteDataSourceProvider._();

/// Remote datasource bound to the shared [ApiClient].

final class WalkInRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          WalkInRemoteDataSource,
          WalkInRemoteDataSource,
          WalkInRemoteDataSource
        >
    with $Provider<WalkInRemoteDataSource> {
  /// Remote datasource bound to the shared [ApiClient].
  WalkInRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'walkInRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$walkInRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<WalkInRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WalkInRemoteDataSource create(Ref ref) {
    return walkInRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WalkInRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WalkInRemoteDataSource>(value),
    );
  }
}

String _$walkInRemoteDataSourceHash() =>
    r'b9e194365f6652e8acc27ca25aa03b687c9af53b';

/// The abstract [WalkInRepository] — the single type the feature depends on.

@ProviderFor(walkInRepository)
final walkInRepositoryProvider = WalkInRepositoryProvider._();

/// The abstract [WalkInRepository] — the single type the feature depends on.

final class WalkInRepositoryProvider
    extends
        $FunctionalProvider<
          WalkInRepository,
          WalkInRepository,
          WalkInRepository
        >
    with $Provider<WalkInRepository> {
  /// The abstract [WalkInRepository] — the single type the feature depends on.
  WalkInRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'walkInRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$walkInRepositoryHash();

  @$internal
  @override
  $ProviderElement<WalkInRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WalkInRepository create(Ref ref) {
    return walkInRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WalkInRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WalkInRepository>(value),
    );
  }
}

String _$walkInRepositoryHash() => r'62a70e63792c9995804a1a9566c86f0d8d501462';
