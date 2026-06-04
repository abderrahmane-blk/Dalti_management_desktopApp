import 'package:desktop_turn_management/core/network/api_client.dart';
import 'package:desktop_turn_management/core/network/api_exception.dart';
import 'package:desktop_turn_management/features/walk_in/data/models/walk_in_ticket_dto.dart';

/// Remote datasource for registering walk-ins. Talks to the backend through
/// [ApiClient] and returns DTOs; surfaces only [ApiException].
class WalkInRemoteDataSource {
  WalkInRemoteDataSource(this._client);

  final ApiClient _client;

  /// Registers a walk-in via the anonymous `reserve` flow, exactly as
  /// `reservations.http` does it: `POST /queues/{queueId}/reserve` with **no**
  /// bearer token, so it is not filed under the operator's account. The
  /// `scheduledDate`/`scheduledTime` are omitted to take the soonest spot;
  /// empty fields are dropped from the body.
  //
  // TODO : change later to a 'walk-in' endpoint that works also with the
  //        queue.type=`internal`.
  Future<WalkInTicketDto> register(
    int queueId, {
    String? name,
    String? phone,
    String? info,
    String? scheduledDate,
    String? scheduledTime,
  }) async {
    final body = <String, dynamic>{
      if (name != null && name.isNotEmpty) 'name': name,
      if (phone != null && phone.isNotEmpty) 'phone': phone,
      if (info != null && info.isNotEmpty) 'info': info,
      if (scheduledDate != null && scheduledDate.isNotEmpty) 'scheduledDate': scheduledDate,
      if (scheduledTime != null && scheduledTime.isNotEmpty) 'scheduledTime': scheduledTime,
    };
    final data = await _client.post(
      '/queues/$queueId/reserve',
      data: body,
      authenticated: false,
    );
    try {
      return WalkInTicketDto.fromJson(data as Map<String, dynamic>);
    } catch (e) {
      throw ApiException(
        type: ApiErrorType.deserialization,
        message: 'Could not parse the walk-in response.',
        cause: e,
      );
    }
  }
}
