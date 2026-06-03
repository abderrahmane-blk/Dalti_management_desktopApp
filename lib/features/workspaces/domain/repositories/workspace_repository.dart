import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/workspaces/domain/entities/workspace.dart';

/// Domain-facing contract for the user's manageable workspaces.
///
/// Presentation/providers depend only on this interface. The implementation
/// composes a remote (`GET /me/workspaces`) and a local cache datasource.
abstract interface class WorkspaceRepository {
  /// Fetches the workspaces from the backend and refreshes the local cache.
  /// Returns an [Err] (never throws) on transport/parse failure.
  Future<Result<Workspace>> fetchWorkspaces();

  /// Returns the locally-cached workspaces, or `null` if nothing is cached.
  Future<Workspace?> cachedWorkspace();
}
