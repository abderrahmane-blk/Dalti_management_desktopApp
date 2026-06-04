import 'package:desktop_turn_management/core/network/api_client.dart';
import 'package:desktop_turn_management/core/realtime/polling_source.dart';
import 'package:desktop_turn_management/core/realtime/realtime_source.dart';
import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/queue_board/data/datasources/queue_board_remote_data_source.dart';
import 'package:desktop_turn_management/features/queue_board/data/repositories/queue_board_repository_impl.dart';
import 'package:desktop_turn_management/features/queue_board/domain/entities/queue_reservation.dart';
import 'package:desktop_turn_management/features/queue_board/domain/repositories/queue_board_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'queue_board_providers.g.dart';

/// How often the operator board re-fetches. Hardcoded to 10s for now (a config
/// field / push transport can replace this later — see the realtime seam).
const Duration kBoardPollInterval = Duration(seconds: 10);

/// Remote datasource bound to the shared [ApiClient].
@riverpod
QueueBoardRemoteDataSource queueBoardRemoteDataSource(Ref ref) =>
    QueueBoardRemoteDataSource(ref.watch(apiClientProvider));

/// The abstract [QueueBoardRepository] — the single type the feature depends on.
@riverpod
QueueBoardRepository queueBoardRepository(Ref ref) =>
    QueueBoardRepositoryImpl(ref.watch(queueBoardRemoteDataSourceProvider));

/// THE realtime seam for a queue's board: a [PollingSource] that re-fetches the
/// full "today" list every [kBoardPollInterval]. Swap to SSE/sockets by
/// overriding only this provider. One instance per queue (family).
@riverpod
RealtimeSource<List<QueueReservation>> queueBoardRealtimeSource(
  Ref ref,
  int queueId,
) {
  final repository = ref.watch(queueBoardRepositoryProvider);
  final source = PollingSource<List<QueueReservation>>(
    interval: kBoardPollInterval,
    fetch: () async {
      final result = await repository.fetchToday(queueId);
      return switch (result) {
        Ok(:final value) => value,
        Err(:final error) => throw error,
      };
    },
  );
  ref.onDispose(source.dispose);
  return source;
}

/// Whether a queue has a next queue (drives the "send to next queue" action).
/// Static config, so fetched once per queue rather than polled.
@riverpod
Future<bool> queueHasNextQueue(Ref ref, int queueId) async {
  final result =
      await ref.watch(queueBoardRepositoryProvider).fetchNextQueueId(queueId);
  return switch (result) {
    Ok(:final value) => value != null,
    Err(:final error) => throw error,
  };
}
