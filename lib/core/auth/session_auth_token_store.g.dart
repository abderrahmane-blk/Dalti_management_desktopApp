// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_auth_token_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The single session token store instance. Seeded with the dev token so the
/// dev path works out of the box; the Google sign-in flow overwrites it.
///
/// `main.dart` binds [authTokenStoreProvider] to this so `ApiClient` and the
/// sign-in flow share one instance.

@ProviderFor(sessionAuthTokenStore)
final sessionAuthTokenStoreProvider = SessionAuthTokenStoreProvider._();

/// The single session token store instance. Seeded with the dev token so the
/// dev path works out of the box; the Google sign-in flow overwrites it.
///
/// `main.dart` binds [authTokenStoreProvider] to this so `ApiClient` and the
/// sign-in flow share one instance.

final class SessionAuthTokenStoreProvider
    extends
        $FunctionalProvider<
          SessionAuthTokenStore,
          SessionAuthTokenStore,
          SessionAuthTokenStore
        >
    with $Provider<SessionAuthTokenStore> {
  /// The single session token store instance. Seeded with the dev token so the
  /// dev path works out of the box; the Google sign-in flow overwrites it.
  ///
  /// `main.dart` binds [authTokenStoreProvider] to this so `ApiClient` and the
  /// sign-in flow share one instance.
  SessionAuthTokenStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sessionAuthTokenStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sessionAuthTokenStoreHash();

  @$internal
  @override
  $ProviderElement<SessionAuthTokenStore> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SessionAuthTokenStore create(Ref ref) {
    return sessionAuthTokenStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SessionAuthTokenStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SessionAuthTokenStore>(value),
    );
  }
}

String _$sessionAuthTokenStoreHash() =>
    r'6f6341e9f354accb67c63980b9b59a02314210b8';
