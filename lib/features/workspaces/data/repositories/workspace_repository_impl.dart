import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/workspaces/data/datasources/workspace_local_data_source.dart';
import 'package:desktop_turn_management/features/workspaces/data/datasources/workspace_remote_data_source.dart';
import 'package:desktop_turn_management/features/workspaces/domain/entities/workspace.dart';
import 'package:desktop_turn_management/features/workspaces/domain/repositories/workspace_repository.dart';

/// Concrete repository composing the remote and local datasources. DTO↔entity
/// mapping happens here so DTOs never reach presentation.
class WorkspaceRepositoryImpl implements WorkspaceRepository {
  WorkspaceRepositoryImpl({
    required this._remote,
    required this._local,
  });

  final WorkspaceRemoteDataSource _remote;
  final WorkspaceLocalDataSource _local;

  @override
  Future<Result<Workspace>> fetchWorkspaces() {
    return guard(() async {
      final dto = await _remote.fetch();
      await _local.cache(dto);
      return dto.toEntity();
    });
  }

  @override
  Future<Workspace?> cachedWorkspace() async {
    final dto = await _local.read();
    return dto?.toEntity();
  }
}
