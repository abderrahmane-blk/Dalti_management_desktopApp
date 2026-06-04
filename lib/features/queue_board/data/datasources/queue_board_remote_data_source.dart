import 'package:desktop_turn_management/core/network/api_client.dart';
import 'package:desktop_turn_management/core/network/api_exception.dart';
import 'package:desktop_turn_management/features/queue_board/data/models/queue_reservation_dto.dart';

/// Remote datasource for the queue operator board. Talks to the backend through
/// [ApiClient] and returns DTOs; surfaces only [ApiException].
class QueueBoardRemoteDataSource {
  QueueBoardRemoteDataSource(this._client);

  final ApiClient _client;

  /// `GET /queue-server/{queueId}/today`.
  Future<List<QueueReservationDto>> fetchToday(int queueId) async {
    final data = await _client.get('/queue-server/$queueId/today');
    try {
      return QueueBoardDto.fromJson(data as Map<String, dynamic>).reservations;
    } catch (e) {
      throw _parseError('today board', e);
    }
  }

  /// `GET /queue-server/{queueId}/next-turn` → the current turn pointer.
  Future<int> fetchNextTurn(int queueId) async {
    final data = await _client.get('/queue-server/$queueId/next-turn');
    try {
      return ((data as Map<String, dynamic>)['nextTurn'] as num).toInt();
    } catch (e) {
      throw _parseError('next-turn', e);
    }
  }

  /// `POST /queue-server/{queueId}/set-next-turn/{turnNumber}`.
  Future<void> setNextTurn(int queueId, int turnNumber) async {
    await _client.post('/queue-server/$queueId/set-next-turn/$turnNumber');
  }

  /// `POST /queue-server/{queueId}/call-next`.
  Future<QueueReservationDto> callNext(int queueId) async {
    final data = await _client.post('/queue-server/$queueId/call-next');
    return _readReservation(data, 'call-next');
  }

  /// `POST /queue-server/{queueId}/call/{turnNumber}`.
  Future<QueueReservationDto> callTurn(int queueId, int turnNumber) async {
    final data = await _client.post('/queue-server/$queueId/call/$turnNumber');
    return _readReservation(data, 'call');
  }

  /// `PATCH /reservations/{reservationId}/status`.
  Future<void> updateStatus(int reservationId, int statusValue) async {
    await _client.patch(
      '/reservations/$reservationId/status',
      data: {'status': statusValue},
    );
  }

  /// `POST /reservations/{reservationId}/pass-to-next-queue`.
  Future<void> passToNextQueue(int reservationId) async {
    await _client.post('/reservations/$reservationId/pass-to-next-queue');
  }

  /// `GET /queues/{queueId}` → its `nextQueueId` (nullable).
  Future<int?> fetchNextQueueId(int queueId) async {
    final data = await _client.get('/queues/$queueId');
    try {
      return (data as Map<String, dynamic>)['nextQueueId'] as int?;
    } catch (e) {
      throw _parseError('queue', e);
    }
  }

  QueueReservationDto _readReservation(Object? data, String what) {
    try {
      return CallResultDto.fromJson(data as Map<String, dynamic>).reservation;
    } catch (e) {
      throw _parseError(what, e);
    }
  }

  ApiException _parseError(String what, Object cause) => ApiException(
        type: ApiErrorType.deserialization,
        message: 'Could not parse the $what response.',
        cause: cause,
      );
}
