import 'package:desktop_turn_management/core/network/api_client.dart';
import 'package:desktop_turn_management/core/network/api_exception.dart';
import 'package:desktop_turn_management/features/queue_board/data/models/queue_reservation_dto.dart';
import 'package:desktop_turn_management/features/queue_history/domain/history_dates.dart';

/// Talks to the history endpoints (`/queues/{queueId}/reservations/by-date` and
/// `/by-month`). Reuses [QueueReservationDto] from the queue_board slice — the
/// backend returns the same reservation shape (status as a name string).
class QueueHistoryRemoteDataSource {
  QueueHistoryRemoteDataSource(this._client);

  final ApiClient _client;

  /// `GET /queues/{queueId}/reservations/by-date/{yyyy-MM-dd}`.
  Future<List<QueueReservationDto>> fetchByDate(int queueId, DateTime date) async {
    final data = await _client.get(
      '/queues/$queueId/reservations/by-date/${isoDay(date)}',
    );
    return _parseList(data, 'history by-date');
  }

  /// `GET /queues/{queueId}/reservations/by-month/{year}/{month}`.
  Future<List<QueueReservationDto>> fetchByMonth(
    int queueId,
    int year,
    int month,
  ) async {
    final data = await _client.get(
      '/queues/$queueId/reservations/by-month/$year/$month',
    );
    return _parseList(data, 'history by-month');
  }

  /// `PATCH /reservations/{reservationId}/status` — same contract as the board.
  Future<void> updateStatus(int reservationId, int statusValue) async {
    await _client.patch(
      '/reservations/$reservationId/status',
      data: {'status': statusValue},
    );
  }

  List<QueueReservationDto> _parseList(Object? data, String what) {
    try {
      final list = (data as List<dynamic>).cast<Map<String, dynamic>>();
      return list.map(QueueReservationDto.fromJson).toList();
    } catch (e) {
      throw ApiException(
        type: ApiErrorType.deserialization,
        message: 'Could not parse the $what response.',
        cause: e,
      );
    }
  }
}
