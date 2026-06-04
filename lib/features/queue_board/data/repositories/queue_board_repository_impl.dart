import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/queue_board/data/datasources/queue_board_remote_data_source.dart';
import 'package:desktop_turn_management/features/queue_board/domain/entities/queue_reservation.dart';
import 'package:desktop_turn_management/features/queue_board/domain/repositories/queue_board_repository.dart';

/// Concrete repository over the remote datasource. DTO→entity mapping happens
/// here; every method is wrapped in [guard] so callers get a [Result].
class QueueBoardRepositoryImpl implements QueueBoardRepository {
  QueueBoardRepositoryImpl(this._remote);

  final QueueBoardRemoteDataSource _remote;

  @override
  Future<Result<List<QueueReservation>>> fetchToday(int queueId) {
    return guard(() async {
      final dtos = await _remote.fetchToday(queueId);
      return dtos.map((dto) => dto.toEntity()).toList();
    });
  }

  @override
  Future<Result<int>> nextTurn(int queueId) {
    return guard(() => _remote.fetchNextTurn(queueId));
  }

  @override
  Future<Result<void>> setNextTurn(int queueId, int turnNumber) {
    return guard(() => _remote.setNextTurn(queueId, turnNumber));
  }

  @override
  Future<Result<QueueReservation>> callNext(int queueId) {
    return guard(() async => (await _remote.callNext(queueId)).toEntity());
  }

  @override
  Future<Result<QueueReservation>> callTurn(int queueId, int turnNumber) {
    return guard(
      () async => (await _remote.callTurn(queueId, turnNumber)).toEntity(),
    );
  }

  @override
  Future<Result<void>> updateStatus(int reservationId, int statusValue) {
    return guard(() => _remote.updateStatus(reservationId, statusValue));
  }

  @override
  Future<Result<void>> passToNextQueue(int reservationId) {
    return guard(() => _remote.passToNextQueue(reservationId));
  }

  @override
  Future<Result<int?>> fetchNextQueueId(int queueId) {
    return guard(() => _remote.fetchNextQueueId(queueId));
  }
}
