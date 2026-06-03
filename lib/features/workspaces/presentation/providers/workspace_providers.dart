import 'package:desktop_turn_management/core/network/api_client.dart';
import 'package:desktop_turn_management/core/storage/memory_store.dart';
import 'package:desktop_turn_management/features/workspaces/data/datasources/workspace_local_data_source.dart';
import 'package:desktop_turn_management/features/workspaces/data/datasources/workspace_remote_data_source.dart';
import 'package:desktop_turn_management/features/workspaces/data/repositories/workspace_repository_impl.dart';
import 'package:desktop_turn_management/features/workspaces/domain/repositories/workspace_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workspace_providers.g.dart';

/// Remote datasource bound to the shared [ApiClient].
@riverpod
WorkspaceRemoteDataSource workspaceRemoteDataSource(Ref ref) =>
    WorkspaceRemoteDataSource(ref.watch(apiClientProvider));

/// Local datasource bound to the app-wide [KeyValueStore].
@riverpod
WorkspaceLocalDataSource workspaceLocalDataSource(Ref ref) =>
    WorkspaceLocalDataSource(ref.watch(keyValueStoreProvider));

/// The abstract [WorkspaceRepository] — the single type the feature depends on.
@riverpod
WorkspaceRepository workspaceRepository(Ref ref) => WorkspaceRepositoryImpl(
      remote: ref.watch(workspaceRemoteDataSourceProvider),
      local: ref.watch(workspaceLocalDataSourceProvider),
    );
