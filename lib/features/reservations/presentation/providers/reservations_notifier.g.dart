// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservations_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Server-backed list state for reservations.
///
/// `build()` seeds the initial value (cache-first, otherwise the first realtime
/// emission) using a single stream subscription, then forwards every
/// subsequent [RealtimeSource] emission into `state`. The notifier is
/// transport-agnostic: it consumes a `RealtimeSource<List<Reservation>>` and so
/// reflects polled updates today and SSE/socket pushes later with no changes
/// here.

@ProviderFor(Reservations)
final reservationsProvider = ReservationsProvider._();

/// Server-backed list state for reservations.
///
/// `build()` seeds the initial value (cache-first, otherwise the first realtime
/// emission) using a single stream subscription, then forwards every
/// subsequent [RealtimeSource] emission into `state`. The notifier is
/// transport-agnostic: it consumes a `RealtimeSource<List<Reservation>>` and so
/// reflects polled updates today and SSE/socket pushes later with no changes
/// here.
final class ReservationsProvider
    extends $AsyncNotifierProvider<Reservations, List<Reservation>> {
  /// Server-backed list state for reservations.
  ///
  /// `build()` seeds the initial value (cache-first, otherwise the first realtime
  /// emission) using a single stream subscription, then forwards every
  /// subsequent [RealtimeSource] emission into `state`. The notifier is
  /// transport-agnostic: it consumes a `RealtimeSource<List<Reservation>>` and so
  /// reflects polled updates today and SSE/socket pushes later with no changes
  /// here.
  ReservationsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reservationsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reservationsHash();

  @$internal
  @override
  Reservations create() => Reservations();
}

String _$reservationsHash() => r'0c8da87a83c8060ac7bfec0d41587b2d1235159f';

/// Server-backed list state for reservations.
///
/// `build()` seeds the initial value (cache-first, otherwise the first realtime
/// emission) using a single stream subscription, then forwards every
/// subsequent [RealtimeSource] emission into `state`. The notifier is
/// transport-agnostic: it consumes a `RealtimeSource<List<Reservation>>` and so
/// reflects polled updates today and SSE/socket pushes later with no changes
/// here.

abstract class _$Reservations extends $AsyncNotifier<List<Reservation>> {
  FutureOr<List<Reservation>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<Reservation>>, List<Reservation>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Reservation>>, List<Reservation>>,
              AsyncValue<List<Reservation>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
