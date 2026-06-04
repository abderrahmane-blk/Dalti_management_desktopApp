import 'package:desktop_turn_management/core/network/api_client.dart';
import 'package:desktop_turn_management/core/network/api_exception.dart';
import 'package:desktop_turn_management/features/organization/data/models/queue_detail_dto.dart';

/// Talks to `/queues/{id}` and `/queues/{id}/rules` endpoints.
class QueueRemoteDataSource {
  QueueRemoteDataSource(this._client);

  final ApiClient _client;

  /// `GET /queues/{queueId}/full` — returns full queue data including the rules
  /// JSON blob and per-language translations.
  Future<QueueDetailDto> fetchQueueFull(int queueId) async {
    final data = await _client.get('/queues/$queueId/full');
    try {
      return QueueDetailDto.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      throw ApiException(
        type: ApiErrorType.deserialization,
        message: 'Could not parse the queue response.',
        cause: e,
      );
    }
  }

  /// `PATCH /queues/{queueId}` — partial update (status, translations).
  /// [body] keys: `status`, `EN`/`AR`/`FR` (each `{name, description}`).
  Future<void> updateQueueInfo(int queueId, Map<String, dynamic> body) async {
    await _client.patch('/queues/$queueId', data: body);
  }

  /// `PATCH /queues/{queueId}/rules` — merge-patch for queue rules.
  /// Only the keys present in [patch] are updated; omitted keys are unchanged.
  Future<void> updateQueueRules(
    int queueId,
    Map<String, dynamic> patch,
  ) async {
    await _client.patch('/queues/$queueId/rules', data: patch);
  }
}
