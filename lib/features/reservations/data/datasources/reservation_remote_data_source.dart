import 'package:desktop_turn_management/core/network/api_client.dart';
import 'package:desktop_turn_management/core/network/api_exception.dart';
import 'package:desktop_turn_management/features/reservations/data/models/reservation_dto.dart';

/// Remote datasource: talks to the backend through [ApiClient] and returns
/// DTOs. It surfaces only [ApiException] (mapped inside [ApiClient], plus a
/// deserialization case here).
class ReservationRemoteDataSource {
  ReservationRemoteDataSource(this._client);

  final ApiClient _client;

  // TODO(backend): wire to the real Dalti API. The list lives at
  //   GET /reservations/today-and-future  (or  GET /my-reservations),
  //   and the DTO fields must be matched to the backend's Reservation shape.
  // The path below is a placeholder; the backend has no bare GET /reservations.
  static const String _path = '/reservations';

  /// `GET /reservations` → list of [ReservationDto] (placeholder endpoint).
  Future<List<ReservationDto>> fetchAll() async {
    final data = await _client.get(_path);
    try {
      final list = (data as List<dynamic>).cast<Map<String, dynamic>>();
      return list.map(ReservationDto.fromJson).toList();
    } catch (e) {
      throw ApiException(
        type: ApiErrorType.deserialization,
        message: 'Could not parse the reservations response.',
        cause: e,
      );
    }
  }
}
