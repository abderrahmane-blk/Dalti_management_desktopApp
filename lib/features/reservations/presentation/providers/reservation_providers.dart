import 'package:desktop_turn_management/core/config/app_config.dart';
import 'package:desktop_turn_management/core/network/api_client.dart';
import 'package:desktop_turn_management/core/realtime/polling_source.dart';
import 'package:desktop_turn_management/core/realtime/realtime_source.dart';
import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/core/storage/memory_store.dart';
import 'package:desktop_turn_management/core/sync/sync_engine.dart';
import 'package:desktop_turn_management/features/reservations/data/datasources/reservation_local_data_source.dart';
import 'package:desktop_turn_management/features/reservations/data/datasources/reservation_remote_data_source.dart';
import 'package:desktop_turn_management/features/reservations/data/repositories/reservation_repository_impl.dart';
import 'package:desktop_turn_management/features/reservations/domain/entities/reservation.dart';
import 'package:desktop_turn_management/features/reservations/domain/repositories/reservation_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reservation_providers.g.dart';

/// Remote datasource bound to the shared [ApiClient].
@riverpod
ReservationRemoteDataSource reservationRemoteDataSource(Ref ref) =>
    ReservationRemoteDataSource(ref.watch(apiClientProvider));

/// Local datasource bound to the app-wide [KeyValueStore].
@riverpod
ReservationLocalDataSource reservationLocalDataSource(Ref ref) =>
    ReservationLocalDataSource(ref.watch(keyValueStoreProvider));

/// The abstract [ReservationRepository] — the single type the rest of the
/// feature depends on. Swapping datasources happens behind this provider.
@riverpod
ReservationRepository reservationRepository(Ref ref) => ReservationRepositoryImpl(
      remote: ref.watch(reservationRemoteDataSourceProvider),
      local: ref.watch(reservationLocalDataSourceProvider),
      syncEngine: ref.watch(syncEngineProvider),
    );

/// THE realtime seam for reservations.
///
/// Today this returns a [PollingSource] that re-fetches through the repository
/// on [AppConfig.pollInterval]. To move to SSE or WebSockets, implement a new
/// `RealtimeSource<List<Reservation>>` and override *only* this provider — no
/// repository, notifier, or widget changes. See ARCHITECTURE.md › Realtime
/// seam.
@riverpod
RealtimeSource<List<Reservation>> reservationsRealtimeSource(Ref ref) {
  final repository = ref.watch(reservationRepositoryProvider);
  final config = ref.watch(appConfigProvider);

  final source = PollingSource<List<Reservation>>(
    interval: config.pollInterval,
    fetch: () async {
      final result = await repository.fetchReservations();
      // Translate the Result back into success/throw for the source: a thrown
      // ApiException becomes a stream error the notifier maps to AsyncError.
      return switch (result) {
        Ok(:final value) => value,
        Err(:final error) => throw error,
      };
    },
  );

  ref.onDispose(source.dispose);
  return source;
}
