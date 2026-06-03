import 'package:desktop_turn_management/core/storage/key_value_store.dart';
import 'package:desktop_turn_management/features/workspaces/data/models/workspace_dto.dart';

/// Local datasource: caches the workspaces DTO through the [KeyValueStore]
/// abstraction as a JSON-encodable map, so swapping in a real database only
/// changes the [KeyValueStore] binding — this class is untouched.
class WorkspaceLocalDataSource {
  WorkspaceLocalDataSource(this._store);

  final KeyValueStore _store;

  static const String _key = 'workspaces';

  /// Overwrites the cached workspaces.
  Future<void> cache(WorkspaceDto workspace) async {
    await _store.write(_key, workspace.toJson());
  }

  /// Reads the cached workspaces, or `null` if nothing is stored.
  Future<WorkspaceDto?> read() async {
    final raw = await _store.read(_key);
    if (raw == null) return null;
    return WorkspaceDto.fromJson((raw as Map).cast<String, dynamic>());
  }
}
