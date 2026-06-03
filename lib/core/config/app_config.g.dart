// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Exposes [AppConfig] to the provider graph.
///
/// This intentionally throws if not overridden: `main.dart` (and tests) must
/// inject a concrete config via `appConfigProvider.overrideWithValue(...)`,
/// which keeps environment selection explicit and out of library code.

@ProviderFor(appConfig)
final appConfigProvider = AppConfigProvider._();

/// Exposes [AppConfig] to the provider graph.
///
/// This intentionally throws if not overridden: `main.dart` (and tests) must
/// inject a concrete config via `appConfigProvider.overrideWithValue(...)`,
/// which keeps environment selection explicit and out of library code.

final class AppConfigProvider
    extends $FunctionalProvider<AppConfig, AppConfig, AppConfig>
    with $Provider<AppConfig> {
  /// Exposes [AppConfig] to the provider graph.
  ///
  /// This intentionally throws if not overridden: `main.dart` (and tests) must
  /// inject a concrete config via `appConfigProvider.overrideWithValue(...)`,
  /// which keeps environment selection explicit and out of library code.
  AppConfigProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appConfigProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appConfigHash();

  @$internal
  @override
  $ProviderElement<AppConfig> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppConfig create(Ref ref) {
    return appConfig(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppConfig value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppConfig>(value),
    );
  }
}

String _$appConfigHash() => r'7fd8cd4b8fc2c68546802f20e40f4d76904c14a0';
