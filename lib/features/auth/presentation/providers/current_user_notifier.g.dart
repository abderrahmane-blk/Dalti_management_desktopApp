// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Loads (and exposes) the signed-in user. Used by the login gate to render the
/// "Continue as <name>" button.

@ProviderFor(CurrentUserNotifier)
final currentUserProvider = CurrentUserNotifierProvider._();

/// Loads (and exposes) the signed-in user. Used by the login gate to render the
/// "Continue as <name>" button.
final class CurrentUserNotifierProvider
    extends $AsyncNotifierProvider<CurrentUserNotifier, CurrentUser> {
  /// Loads (and exposes) the signed-in user. Used by the login gate to render the
  /// "Continue as <name>" button.
  CurrentUserNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentUserProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentUserNotifierHash();

  @$internal
  @override
  CurrentUserNotifier create() => CurrentUserNotifier();
}

String _$currentUserNotifierHash() =>
    r'7d08be8256c4975bfbed8f31840289602c42caaa';

/// Loads (and exposes) the signed-in user. Used by the login gate to render the
/// "Continue as <name>" button.

abstract class _$CurrentUserNotifier extends $AsyncNotifier<CurrentUser> {
  FutureOr<CurrentUser> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<CurrentUser>, CurrentUser>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<CurrentUser>, CurrentUser>,
              AsyncValue<CurrentUser>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
