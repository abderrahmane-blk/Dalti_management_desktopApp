// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Identity datasource bound to the app-wide auth seam ([authTokenStoreProvider]).

@ProviderFor(localIdentityDataSource)
final localIdentityDataSourceProvider = LocalIdentityDataSourceProvider._();

/// Identity datasource bound to the app-wide auth seam ([authTokenStoreProvider]).

final class LocalIdentityDataSourceProvider
    extends
        $FunctionalProvider<
          LocalIdentityDataSource,
          LocalIdentityDataSource,
          LocalIdentityDataSource
        >
    with $Provider<LocalIdentityDataSource> {
  /// Identity datasource bound to the app-wide auth seam ([authTokenStoreProvider]).
  LocalIdentityDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localIdentityDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localIdentityDataSourceHash();

  @$internal
  @override
  $ProviderElement<LocalIdentityDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalIdentityDataSource create(Ref ref) {
    return localIdentityDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalIdentityDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalIdentityDataSource>(value),
    );
  }
}

String _$localIdentityDataSourceHash() =>
    r'8d4fa7a389a5e2ff5292ed6e179f69fab18a2839';

/// The abstract [UserRepository] — the single type presentation depends on.

@ProviderFor(userRepository)
final userRepositoryProvider = UserRepositoryProvider._();

/// The abstract [UserRepository] — the single type presentation depends on.

final class UserRepositoryProvider
    extends $FunctionalProvider<UserRepository, UserRepository, UserRepository>
    with $Provider<UserRepository> {
  /// The abstract [UserRepository] — the single type presentation depends on.
  UserRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserRepository create(Ref ref) {
    return userRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserRepository>(value),
    );
  }
}

String _$userRepositoryHash() => r'c2febd6f7d992fa6fbf77eff3e614af267c3c737';
