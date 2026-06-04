import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/queue_board/data/models/queue_reservation_dto.dart';
import 'package:desktop_turn_management/features/queue_board/domain/entities/queue_reservation.dart';
import 'package:desktop_turn_management/features/queue_history/data/datasources/queue_history_local_data_source.dart';
import 'package:desktop_turn_management/features/queue_history/data/datasources/queue_history_remote_data_source.dart';
import 'package:desktop_turn_management/features/queue_history/domain/history_dates.dart';
import 'package:desktop_turn_management/features/queue_history/domain/repositories/queue_history_repository.dart';

class QueueHistoryRepositoryImpl implements QueueHistoryRepository {
  QueueHistoryRepositoryImpl({
    required this._remote,
    required this._local,
  });

  final QueueHistoryRemoteDataSource _remote;
  final QueueHistoryLocalDataSource _local;

  @override
  Future<Result<Map<String, List<QueueReservation>>>> loadMonths(
    int queueId,
    List<({int year, int month})> months,
  ) {
    return guard(() async {
      // TODO(hybrid): once the store is a persistent DB, read the cached days
      // first and only fetch the months/days we don't already have.
      final merged = <String, List<QueueReservationDto>>{};
      for (final m in months) {
        final dtos = await _remote.fetchByMonth(queueId, m.year, m.month);
        _bucketInto(merged, dtos);
      }
      await _writeBuckets(queueId, merged);
      return _toEntities(merged);
    });
  }

  @override
  Future<Result<List<QueueReservation>>> refreshDate(int queueId, DateTime date) {
    return guard(() async {
      final dtos = await _remote.fetchByDate(queueId, date);
      // Write the day's bucket explicitly so an empty result still records
      // "fetched, empty" for this date.
      await _local.writeDate(queueId, isoDay(date), dtos);
      return dtos.map((d) => d.toEntity()).toList();
    });
  }

  @override
  Future<Result<Map<String, List<QueueReservation>>>> refreshMonth(
    int queueId,
    int year,
    int month,
  ) {
    return guard(() async {
      final dtos = await _remote.fetchByMonth(queueId, year, month);
      final buckets = <String, List<QueueReservationDto>>{};
      _bucketInto(buckets, dtos);
      await _writeBuckets(queueId, buckets);
      return _toEntities(buckets);
    });
  }

  @override
  Future<Result<void>> updateStatus(int reservationId, int statusValue) {
    return guard(() => _remote.updateStatus(reservationId, statusValue));
  }

  void _bucketInto(
    Map<String, List<QueueReservationDto>> into,
    List<QueueReservationDto> dtos,
  ) {
    for (final dto in dtos) {
      final day = dto.scheduledDate;
      if (day == null || day.isEmpty) continue; // skip undatable rows
      (into[day] ??= <QueueReservationDto>[]).add(dto);
    }
  }

  Future<void> _writeBuckets(
    int queueId,
    Map<String, List<QueueReservationDto>> buckets,
  ) async {
    for (final entry in buckets.entries) {
      await _local.writeDate(queueId, entry.key, entry.value);
    }
  }

  Map<String, List<QueueReservation>> _toEntities(
    Map<String, List<QueueReservationDto>> buckets,
  ) =>
      buckets.map(
        (day, dtos) => MapEntry(day, dtos.map((d) => d.toEntity()).toList()),
      );
}
