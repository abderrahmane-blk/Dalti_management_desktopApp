// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_history_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Remote datasource bound to the shared [ApiClient].

@ProviderFor(queueHistoryRemoteDataSource)
final queueHistoryRemoteDataSourceProvider =
    QueueHistoryRemoteDataSourceProvider._();

/// Remote datasource bound to the shared [ApiClient].

final class QueueHistoryRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          QueueHistoryRemoteDataSource,
          QueueHistoryRemoteDataSource,
          QueueHistoryRemoteDataSource
        >
    with $Provider<QueueHistoryRemoteDataSource> {
  /// Remote datasource bound to the shared [ApiClient].
  QueueHistoryRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'queueHistoryRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$queueHistoryRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<QueueHistoryRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  QueueHistoryRemoteDataSource create(Ref ref) {
    return queueHistoryRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QueueHistoryRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QueueHistoryRemoteDataSource>(value),
    );
  }
}

String _$queueHistoryRemoteDataSourceHash() =>
    r'51760dd815cd04e4555b56c706d400bd6a5fd994';

/// Local datasource bound to the app-wide [KeyValueStore] (the store).

@ProviderFor(queueHistoryLocalDataSource)
final queueHistoryLocalDataSourceProvider =
    QueueHistoryLocalDataSourceProvider._();

/// Local datasource bound to the app-wide [KeyValueStore] (the store).

final class QueueHistoryLocalDataSourceProvider
    extends
        $FunctionalProvider<
          QueueHistoryLocalDataSource,
          QueueHistoryLocalDataSource,
          QueueHistoryLocalDataSource
        >
    with $Provider<QueueHistoryLocalDataSource> {
  /// Local datasource bound to the app-wide [KeyValueStore] (the store).
  QueueHistoryLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'queueHistoryLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$queueHistoryLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<QueueHistoryLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  QueueHistoryLocalDataSource create(Ref ref) {
    return queueHistoryLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QueueHistoryLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QueueHistoryLocalDataSource>(value),
    );
  }
}

String _$queueHistoryLocalDataSourceHash() =>
    r'ff36528690f87c46e15af63e75ace2507971f1af';

/// The abstract [QueueHistoryRepository] — the single type the feature depends
/// on. Swapping datasources happens behind this provider.

@ProviderFor(queueHistoryRepository)
final queueHistoryRepositoryProvider = QueueHistoryRepositoryProvider._();

/// The abstract [QueueHistoryRepository] — the single type the feature depends
/// on. Swapping datasources happens behind this provider.

final class QueueHistoryRepositoryProvider
    extends
        $FunctionalProvider<
          QueueHistoryRepository,
          QueueHistoryRepository,
          QueueHistoryRepository
        >
    with $Provider<QueueHistoryRepository> {
  /// The abstract [QueueHistoryRepository] — the single type the feature depends
  /// on. Swapping datasources happens behind this provider.
  QueueHistoryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'queueHistoryRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$queueHistoryRepositoryHash();

  @$internal
  @override
  $ProviderElement<QueueHistoryRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  QueueHistoryRepository create(Ref ref) {
    return queueHistoryRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QueueHistoryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QueueHistoryRepository>(value),
    );
  }
}

String _$queueHistoryRepositoryHash() =>
    r'279eeaf1d5870f73d7ece1d9a63b8d5ed6d23af2';
