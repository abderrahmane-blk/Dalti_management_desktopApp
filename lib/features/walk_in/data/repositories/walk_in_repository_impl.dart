import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/walk_in/data/datasources/walk_in_remote_data_source.dart';
import 'package:desktop_turn_management/features/walk_in/domain/entities/walk_in_ticket.dart';
import 'package:desktop_turn_management/features/walk_in/domain/repositories/walk_in_repository.dart';

/// Concrete repository over the remote datasource. DTO→entity mapping happens
/// here; the call is wrapped in [guard] so callers get a [Result].
class WalkInRepositoryImpl implements WalkInRepository {
  WalkInRepositoryImpl(this._remote);

  final WalkInRemoteDataSource _remote;

  @override
  Future<Result<WalkInTicket>> register(
    int queueId, {
    String? name,
    String? phone,
    String? info,
  }) {
    return guard(
      () async => (await _remote.register(
        queueId,
        name: name,
        phone: phone,
        info: info,
      ))
          .toEntity(),
    );
  }
}
