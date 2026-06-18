// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The app's [GoRouter], exposed as a provider so routes can depend on app
/// state and be overridden in tests.
///
/// The flow is imperative: the login button navigates to selection, picking an
/// organization navigates to home, and "Logout" / "Handle something else"
/// navigate back. The home screen self-guards against being reached without a
/// selected workspace.

@ProviderFor(goRouter)
final goRouterProvider = GoRouterProvider._();

/// The app's [GoRouter], exposed as a provider so routes can depend on app
/// state and be overridden in tests.
///
/// The flow is imperative: the login button navigates to selection, picking an
/// organization navigates to home, and "Logout" / "Handle something else"
/// navigate back. The home screen self-guards against being reached without a
/// selected workspace.

final class GoRouterProvider
    extends $FunctionalProvider<GoRouter, GoRouter, GoRouter>
    with $Provider<GoRouter> {
  /// The app's [GoRouter], exposed as a provider so routes can depend on app
  /// state and be overridden in tests.
  ///
  /// The flow is imperative: the login button navigates to selection, picking an
  /// organization navigates to home, and "Logout" / "Handle something else"
  /// navigate back. The home screen self-guards against being reached without a
  /// selected workspace.
  GoRouterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'goRouterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$goRouterHash();

  @$internal
  @override
  $ProviderElement<GoRouter> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GoRouter create(Ref ref) {
    return goRouter(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GoRouter value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GoRouter>(value),
    );
  }
}

String _$goRouterHash() => r'd9b85a70e969b42318214f5e6fbc89eed9b3ada2';
