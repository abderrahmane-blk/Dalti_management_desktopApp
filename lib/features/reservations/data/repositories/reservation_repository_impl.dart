import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/core/sync/sync_engine.dart';
import 'package:desktop_turn_management/features/reservations/data/datasources/reservation_local_data_source.dart';
import 'package:desktop_turn_management/features/reservations/data/datasources/reservation_remote_data_source.dart';
import 'package:desktop_turn_management/features/reservations/domain/entities/reservation.dart';
import 'package:desktop_turn_management/features/reservations/domain/repositories/reservation_repository.dart';

/// Concrete repository composing a remote and a local datasource (and the
/// inert [SyncEngine] seam). DTO↔entity mapping happens here so DTOs never
/// reach the presentation layer.
class ReservationRepositoryImpl implements ReservationRepository {
  ReservationRepositoryImpl({
    required this._remote,
    required this._local,
    required SyncEngine syncEngine,
  })  : _sync = syncEngine;

  final ReservationRemoteDataSource _remote;
  final ReservationLocalDataSource _local;
  // ignore: unused_field — wired now, exercised once a real sync engine lands.
  final SyncEngine _sync;

  @override
  Future<Result<List<Reservation>>> fetchReservations() {
    // `guard` turns a thrown ApiException into an Err; anything else rethrows.
    return guard(() async {
      final dtos = await _remote.fetchAll();
      await _local.cache(dtos);
      return dtos.map((dto) => dto.toEntity()).toList();
    });
  }

  @override
  Future<List<Reservation>> cachedReservations() async {
    final dtos = await _local.read();
    return dtos.map((dto) => dto.toEntity()).toList();
  }
}
