import 'package:desktop_turn_management/core/storage/key_value_store.dart';
import 'package:desktop_turn_management/features/queue_board/data/models/queue_reservation_dto.dart';

/// Per-day cache of history reservations through the [KeyValueStore] seam.
///
/// Each day is one key (`queue_history:{queueId}:{yyyy-MM-dd}`) holding that
/// day's reservation DTOs as JSON. It only ever sees JSON-encodable maps, so
/// when the in-memory [KeyValueStore] is swapped for a real database this class
/// is untouched. The per-day keys are also the seam the future "hybrid" mode
/// hangs off: "fetch only the days we don't already have" becomes a small change.
class QueueHistoryLocalDataSource {
  QueueHistoryLocalDataSource(this._store);

  final KeyValueStore _store;

  String _key(int queueId, String day) => 'queue_history:$queueId:$day';

  /// Overwrites the cached reservations for [day] (`yyyy-MM-dd`).
  Future<void> writeDate(
    int queueId,
    String day,
    List<QueueReservationDto> reservations,
  ) async {
    final encoded = reservations.map((dto) => dto.toJson()).toList();
    await _store.write(_key(queueId, day), encoded);
  }

  /// Reads the cached reservations for [day], or `[]` if none are stored.
  Future<List<QueueReservationDto>> readDate(int queueId, String day) async {
    final raw = await _store.read(_key(queueId, day));
    if (raw == null) return const <QueueReservationDto>[];
    final list = (raw as List<dynamic>).cast<Map<String, dynamic>>();
    return list.map(QueueReservationDto.fromJson).toList();
  }

  // TODO(hybrid): with a persistent store, the repository can call this to fetch
  // only the days it doesn't already have (and add a range read) instead of
  // re-fetching whole months on every open.
  Future<bool> containsDate(int queueId, String day) =>
      _store.containsKey(_key(queueId, day));
}
