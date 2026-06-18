// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_sign_in_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Drives the Google sign-in button. Its [AsyncValue] state is `loading` while
/// the browser flow + token exchange run, and `error` (with the [ApiException])
/// when sign-in fails, so the login screen can disable the button and show the
/// message. On success it refreshes [currentUserProvider] from the new token.

@ProviderFor(GoogleSignIn)
final googleSignInProvider = GoogleSignInProvider._();

/// Drives the Google sign-in button. Its [AsyncValue] state is `loading` while
/// the browser flow + token exchange run, and `error` (with the [ApiException])
/// when sign-in fails, so the login screen can disable the button and show the
/// message. On success it refreshes [currentUserProvider] from the new token.
final class GoogleSignInProvider
    extends $AsyncNotifierProvider<GoogleSignIn, void> {
  /// Drives the Google sign-in button. Its [AsyncValue] state is `loading` while
  /// the browser flow + token exchange run, and `error` (with the [ApiException])
  /// when sign-in fails, so the login screen can disable the button and show the
  /// message. On success it refreshes [currentUserProvider] from the new token.
  GoogleSignInProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'googleSignInProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$googleSignInHash();

  @$internal
  @override
  GoogleSignIn create() => GoogleSignIn();
}

String _$googleSignInHash() => r'ddacf97da1ac2dd8b08bd3e857de957fe80b9c62';

/// Drives the Google sign-in button. Its [AsyncValue] state is `loading` while
/// the browser flow + token exchange run, and `error` (with the [ApiException])
/// when sign-in fails, so the login screen can disable the button and show the
/// message. On success it refreshes [currentUserProvider] from the new token.

abstract class _$GoogleSignIn extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
