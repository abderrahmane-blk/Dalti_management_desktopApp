import 'package:desktop_turn_management/core/network/api_client.dart';
import 'package:desktop_turn_management/core/storage/memory_store.dart';
import 'package:desktop_turn_management/features/queue_history/data/datasources/queue_history_local_data_source.dart';
import 'package:desktop_turn_management/features/queue_history/data/datasources/queue_history_remote_data_source.dart';
import 'package:desktop_turn_management/features/queue_history/data/repositories/queue_history_repository_impl.dart';
import 'package:desktop_turn_management/features/queue_history/domain/repositories/queue_history_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'queue_history_providers.g.dart';

/// Remote datasource bound to the shared [ApiClient].
@riverpod
QueueHistoryRemoteDataSource queueHistoryRemoteDataSource(Ref ref) =>
    QueueHistoryRemoteDataSource(ref.watch(apiClientProvider));

/// Local datasource bound to the app-wide [KeyValueStore] (the store).
@riverpod
QueueHistoryLocalDataSource queueHistoryLocalDataSource(Ref ref) =>
    QueueHistoryLocalDataSource(ref.watch(keyValueStoreProvider));

/// The abstract [QueueHistoryRepository] — the single type the feature depends
/// on. Swapping datasources happens behind this provider.
@riverpod
QueueHistoryRepository queueHistoryRepository(Ref ref) =>
    QueueHistoryRepositoryImpl(
      remote: ref.watch(queueHistoryRemoteDataSourceProvider),
      local: ref.watch(queueHistoryLocalDataSourceProvider),
    );
