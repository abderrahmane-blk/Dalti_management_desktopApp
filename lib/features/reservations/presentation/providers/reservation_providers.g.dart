// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Remote datasource bound to the shared [ApiClient].

@ProviderFor(reservationRemoteDataSource)
final reservationRemoteDataSourceProvider =
    ReservationRemoteDataSourceProvider._();

/// Remote datasource bound to the shared [ApiClient].

final class ReservationRemoteDataSourceProvider
    extends
        $FunctionalProvider<
          ReservationRemoteDataSource,
          ReservationRemoteDataSource,
          ReservationRemoteDataSource
        >
    with $Provider<ReservationRemoteDataSource> {
  /// Remote datasource bound to the shared [ApiClient].
  ReservationRemoteDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reservationRemoteDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reservationRemoteDataSourceHash();

  @$internal
  @override
  $ProviderElement<ReservationRemoteDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ReservationRemoteDataSource create(Ref ref) {
    return reservationRemoteDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReservationRemoteDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReservationRemoteDataSource>(value),
    );
  }
}

String _$reservationRemoteDataSourceHash() =>
    r'21ad234d264ce1e7828ea5343efd4d803c7e7798';

/// Local datasource bound to the app-wide [KeyValueStore].

@ProviderFor(reservationLocalDataSource)
final reservationLocalDataSourceProvider =
    ReservationLocalDataSourceProvider._();

/// Local datasource bound to the app-wide [KeyValueStore].

final class ReservationLocalDataSourceProvider
    extends
        $FunctionalProvider<
          ReservationLocalDataSource,
          ReservationLocalDataSource,
          ReservationLocalDataSource
        >
    with $Provider<ReservationLocalDataSource> {
  /// Local datasource bound to the app-wide [KeyValueStore].
  ReservationLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reservationLocalDataSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reservationLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<ReservationLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ReservationLocalDataSource create(Ref ref) {
    return reservationLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReservationLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReservationLocalDataSource>(value),
    );
  }
}

String _$reservationLocalDataSourceHash() =>
    r'479983e86b6d3a6470e59aef5715de8cfceb8954';

/// The abstract [ReservationRepository] — the single type the rest of the
/// feature depends on. Swapping datasources happens behind this provider.

@ProviderFor(reservationRepository)
final reservationRepositoryProvider = ReservationRepositoryProvider._();

/// The abstract [ReservationRepository] — the single type the rest of the
/// feature depends on. Swapping datasources happens behind this provider.

final class ReservationRepositoryProvider
    extends
        $FunctionalProvider<
          ReservationRepository,
          ReservationRepository,
          ReservationRepository
        >
    with $Provider<ReservationRepository> {
  /// The abstract [ReservationRepository] — the single type the rest of the
  /// feature depends on. Swapping datasources happens behind this provider.
  ReservationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reservationRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reservationRepositoryHash();

  @$internal
  @override
  $ProviderElement<ReservationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ReservationRepository create(Ref ref) {
    return reservationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ReservationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ReservationRepository>(value),
    );
  }
}

String _$reservationRepositoryHash() =>
    r'515100b4046a40654f0764920d3b040d49ac3796';

/// THE realtime seam for reservations.
///
/// Today this returns a [PollingSource] that re-fetches through the repository
/// on [AppConfig.pollInterval]. To move to SSE or WebSockets, implement a new
/// `RealtimeSource<List<Reservation>>` and override *only* this provider — no
/// repository, notifier, or widget changes. See ARCHITECTURE.md › Realtime
/// seam.

@ProviderFor(reservationsRealtimeSource)
final reservationsRealtimeSourceProvider =
    ReservationsRealtimeSourceProvider._();

/// THE realtime seam for reservations.
///
/// Today this returns a [PollingSource] that re-fetches through the repository
/// on [AppConfig.pollInterval]. To move to SSE or WebSockets, implement a new
/// `RealtimeSource<List<Reservation>>` and override *only* this provider — no
/// repository, notifier, or widget changes. See ARCHITECTURE.md › Realtime
/// seam.

final class ReservationsRealtimeSourceProvider
    extends
        $FunctionalProvider<
          RealtimeSource<List<Reservation>>,
          RealtimeSource<List<Reservation>>,
          RealtimeSource<List<Reservation>>
        >
    with $Provider<RealtimeSource<List<Reservation>>> {
  /// THE realtime seam for reservations.
  ///
  /// Today this returns a [PollingSource] that re-fetches through the repository
  /// on [AppConfig.pollInterval]. To move to SSE or WebSockets, implement a new
  /// `RealtimeSource<List<Reservation>>` and override *only* this provider — no
  /// repository, notifier, or widget changes. See ARCHITECTURE.md › Realtime
  /// seam.
  ReservationsRealtimeSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reservationsRealtimeSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reservationsRealtimeSourceHash();

  @$internal
  @override
  $ProviderElement<RealtimeSource<List<Reservation>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RealtimeSource<List<Reservation>> create(Ref ref) {
    return reservationsRealtimeSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RealtimeSource<List<Reservation>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RealtimeSource<List<Reservation>>>(
        value,
      ),
    );
  }
}

String _$reservationsRealtimeSourceHash() =>
    r'f1e2f39558fc80b9ba08aef2ee89675aa598cce7';
