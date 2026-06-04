// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_board_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Remote datasource bound to the shared [ApiClient].

@ProviderFor(queueBoardRemoteDataSource)
final queueBoardRemoteDataSourceProvider =
    QueueBoardRemoteDataSourceProvider._();

/// Remote datasource bound to the shared [ApiClient].

final class QueueBoardRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          QueueBoardRemoteDataSource,
          QueueBoardRemoteDataSource,
          QueueBoardRemoteDataSource
        >
    with $Provider<QueueBoardRemoteDataSource> {
  /// Remote datasource bound to the shared [ApiClient].
  QueueBoardRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'queueBoardRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$queueBoardRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<QueueBoardRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  QueueBoardRemoteDataSource create(Ref ref) {
    return queueBoardRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QueueBoardRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QueueBoardRemoteDataSource>(value),
    );
  }
}

String _$queueBoardRemoteDataSourceHash() =>
    r'51ad1139576e31bed59f3b776fba9051baec4929';

/// The abstract [QueueBoardRepository] — the single type the feature depends on.

@ProviderFor(queueBoardRepository)
final queueBoardRepositoryProvider = QueueBoardRepositoryProvider._();

/// The abstract [QueueBoardRepository] — the single type the feature depends on.

final class QueueBoardRepositoryProvider
    extends
        $FunctionalProvider<
          QueueBoardRepository,
          QueueBoardRepository,
          QueueBoardRepository
        >
    with $Provider<QueueBoardRepository> {
  /// The abstract [QueueBoardRepository] — the single type the feature depends on.
  QueueBoardRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'queueBoardRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$queueBoardRepositoryHash();

  @$internal
  @override
  $ProviderElement<QueueBoardRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  QueueBoardRepository create(Ref ref) {
    return queueBoardRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(QueueBoardRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<QueueBoardRepository>(value),
    );
  }
}

String _$queueBoardRepositoryHash() =>
    r'6e55d318e7d2d08cea5d6a4edb47b6c27f5bbd28';

/// THE realtime seam for a queue's board: a [PollingSource] that re-fetches the
/// full "today" list every [kBoardPollInterval]. Swap to SSE/sockets by
/// overriding only this provider. One instance per queue (family).

@ProviderFor(queueBoardRealtimeSource)
final queueBoardRealtimeSourceProvider = QueueBoardRealtimeSourceFamily._();

/// THE realtime seam for a queue's board: a [PollingSource] that re-fetches the
/// full "today" list every [kBoardPollInterval]. Swap to SSE/sockets by
/// overriding only this provider. One instance per queue (family).

final class QueueBoardRealtimeSourceProvider
    extends
        $FunctionalProvider<
          RealtimeSource<List<QueueReservation>>,
          RealtimeSource<List<QueueReservation>>,
          RealtimeSource<List<QueueReservation>>
        >
    with $Provider<RealtimeSource<List<QueueReservation>>> {
  /// THE realtime seam for a queue's board: a [PollingSource] that re-fetches the
  /// full "today" list every [kBoardPollInterval]. Swap to SSE/sockets by
  /// overriding only this provider. One instance per queue (family).
  QueueBoardRealtimeSourceProvider._({
    required QueueBoardRealtimeSourceFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'queueBoardRealtimeSourceProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$queueBoardRealtimeSourceHash();

  @override
  String toString() {
    return r'queueBoardRealtimeSourceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<RealtimeSource<List<QueueReservation>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RealtimeSource<List<QueueReservation>> create(Ref ref) {
    final argument = this.argument as int;
    return queueBoardRealtimeSource(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RealtimeSource<List<QueueReservation>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride:
          $SyncValueProvider<RealtimeSource<List<QueueReservation>>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is QueueBoardRealtimeSourceProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$queueBoardRealtimeSourceHash() =>
    r'e850cb8f13b1414de5b345757b5b8e0abccc9010';

/// THE realtime seam for a queue's board: a [PollingSource] that re-fetches the
/// full "today" list every [kBoardPollInterval]. Swap to SSE/sockets by
/// overriding only this provider. One instance per queue (family).

final class QueueBoardRealtimeSourceFamily extends $Family
    with
        $FunctionalFamilyOverride<RealtimeSource<List<QueueReservation>>, int> {
  QueueBoardRealtimeSourceFamily._()
    : super(
        retry: null,
        name: r'queueBoardRealtimeSourceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// THE realtime seam for a queue's board: a [PollingSource] that re-fetches the
  /// full "today" list every [kBoardPollInterval]. Swap to SSE/sockets by
  /// overriding only this provider. One instance per queue (family).

  QueueBoardRealtimeSourceProvider call(int queueId) =>
      QueueBoardRealtimeSourceProvider._(argument: queueId, from: this);

  @override
  String toString() => r'queueBoardRealtimeSourceProvider';
}

/// Whether a queue has a next queue (drives the "send to next queue" action).
/// Static config, so fetched once per queue rather than polled.

@ProviderFor(queueHasNextQueue)
final queueHasNextQueueProvider = QueueHasNextQueueFamily._();

/// Whether a queue has a next queue (drives the "send to next queue" action).
/// Static config, so fetched once per queue rather than polled.

final class QueueHasNextQueueProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  /// Whether a queue has a next queue (drives the "send to next queue" action).
  /// Static config, so fetched once per queue rather than polled.
  QueueHasNextQueueProvider._({
    required QueueHasNextQueueFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'queueHasNextQueueProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$queueHasNextQueueHash();

  @override
  String toString() {
    return r'queueHasNextQueueProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as int;
    return queueHasNextQueue(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is QueueHasNextQueueProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$queueHasNextQueueHash() => r'7f4e659f5160e47108c53c11606b10a10de06a6b';

/// Whether a queue has a next queue (drives the "send to next queue" action).
/// Static config, so fetched once per queue rather than polled.

final class QueueHasNextQueueFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool>, int> {
  QueueHasNextQueueFamily._()
    : super(
        retry: null,
        name: r'queueHasNextQueueProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Whether a queue has a next queue (drives the "send to next queue" action).
  /// Static config, so fetched once per queue rather than polled.

  QueueHasNextQueueProvider call(int queueId) =>
      QueueHasNextQueueProvider._(argument: queueId, from: this);

  @override
  String toString() => r'queueHasNextQueueProvider';
}
