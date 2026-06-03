// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memory_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The app-wide [KeyValueStore] binding.
///
/// Defaults to [MemoryStore]; override in `main.dart`/tests to swap in a
/// disk-backed implementation. Marked `keepAlive` so cached data is not
/// disposed when no widget is listening.

@ProviderFor(keyValueStore)
final keyValueStoreProvider = KeyValueStoreProvider._();

/// The app-wide [KeyValueStore] binding.
///
/// Defaults to [MemoryStore]; override in `main.dart`/tests to swap in a
/// disk-backed implementation. Marked `keepAlive` so cached data is not
/// disposed when no widget is listening.

final class KeyValueStoreProvider
    extends $FunctionalProvider<KeyValueStore, KeyValueStore, KeyValueStore>
    with $Provider<KeyValueStore> {
  /// The app-wide [KeyValueStore] binding.
  ///
  /// Defaults to [MemoryStore]; override in `main.dart`/tests to swap in a
  /// disk-backed implementation. Marked `keepAlive` so cached data is not
  /// disposed when no widget is listening.
  KeyValueStoreProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'keyValueStoreProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$keyValueStoreHash();

  @$internal
  @override
  $ProviderElement<KeyValueStore> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  KeyValueStore create(Ref ref) {
    return keyValueStore(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(KeyValueStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<KeyValueStore>(value),
    );
  }
}

String _$keyValueStoreHash() => r'ff795c171cb6101f293fceac8dfbcda6dae61b6c';
