import 'package:desktop_turn_management/core/network/api_client.dart';
import 'package:desktop_turn_management/core/network/api_exception.dart';
import 'package:desktop_turn_management/features/workspaces/data/models/workspace_dto.dart';

/// Remote datasource for the user's workspaces. Talks to the backend through
/// [ApiClient] and returns a [WorkspaceDto]; surfaces only [ApiException].
class WorkspaceRemoteDataSource {
  WorkspaceRemoteDataSource(this._client);

  final ApiClient _client;

  /// `GET /me/workspaces` → every org the signed-in user can manage.
  static const String _path = '/me/workspaces';

  Future<WorkspaceDto> fetch() async {
    final data = await _client.get(_path);
    try {
      return WorkspaceDto.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      throw ApiException(
        type: ApiErrorType.deserialization,
        message: 'Could not parse the workspaces response.',
        cause: e,
      );
    }
  }
}
