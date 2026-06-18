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

/// Performs the desktop Google OAuth flow (loopback + PKCE).

@ProviderFor(googleSignInDataSource)
final googleSignInDataSourceProvider = GoogleSignInDataSourceProvider._();

/// Performs the desktop Google OAuth flow (loopback + PKCE).

final class GoogleSignInDataSourceProvider
    extends
        $FunctionalProvider<
          GoogleSignInDataSource,
          GoogleSignInDataSource,
          GoogleSignInDataSource
        >
    with $Provider<GoogleSignInDataSource> {
  /// Performs the desktop Google OAuth flow (loopback + PKCE).
  GoogleSignInDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'googleSignInDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$googleSignInDataSourceHash();

  @$internal
  @override
  $ProviderElement<GoogleSignInDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GoogleSignInDataSource create(Ref ref) {
    return googleSignInDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoogleSignInDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoogleSignInDataSource>(value),
    );
  }
}

String _$googleSignInDataSourceHash() =>
    r'5ad28ce13e35dac09c3a53d5f0d0551c49efcbb7';

/// Calls the backend's anonymous `/auth/*` endpoints.

@ProviderFor(authRemoteDataSource)
final authRemoteDataSourceProvider = AuthRemoteDataSourceProvider._();

/// Calls the backend's anonymous `/auth/*` endpoints.

final class AuthRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          AuthRemoteDataSource,
          AuthRemoteDataSource,
          AuthRemoteDataSource
        >
    with $Provider<AuthRemoteDataSource> {
  /// Calls the backend's anonymous `/auth/*` endpoints.
  AuthRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<AuthRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AuthRemoteDataSource create(Ref ref) {
    return authRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRemoteDataSource>(value),
    );
  }
}

String _$authRemoteDataSourceHash() =>
    r'c422628ad3ddd2cfd86926f22a881b68a524350a';

/// Sign-in / sign-out. Writes the obtained JWT into the shared session store.

@ProviderFor(authRepository)
final authRepositoryProvider = AuthRepositoryProvider._();

/// Sign-in / sign-out. Writes the obtained JWT into the shared session store.

final class AuthRepositoryProvider
    extends $FunctionalProvider<AuthRepository, AuthRepository, AuthRepository>
    with $Provider<AuthRepository> {
  /// Sign-in / sign-out. Writes the obtained JWT into the shared session store.
  AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepository create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepository>(value),
    );
  }
}

String _$authRepositoryHash() => r'b203aa07497a34763abfa360f38ffdd9c3d9f7c9';
