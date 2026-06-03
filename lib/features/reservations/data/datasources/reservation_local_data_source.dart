import 'package:desktop_turn_management/core/storage/key_value_store.dart';
import 'package:desktop_turn_management/features/reservations/data/models/reservation_dto.dart';

/// Local datasource: caches DTOs through the [KeyValueStore] abstraction.
///
/// It only ever sees JSON-encodable maps (`dto.toJson()`), so when the
/// in-memory store is swapped for a real database the only thing that changes
/// is the [KeyValueStore] binding — this class is untouched.
class ReservationLocalDataSource {
  ReservationLocalDataSource(this._store);

  final KeyValueStore _store;

  static const String _key = 'reservations';

  /// Overwrites the cached reservation set.
  Future<void> cache(List<ReservationDto> reservations) async {
    final encoded = reservations.map((dto) => dto.toJson()).toList();
    await _store.write(_key, encoded);
  }

  /// Reads cached reservations, or an empty list if none are stored.
  Future<List<ReservationDto>> read() async {
    final raw = await _store.read(_key);
    if (raw == null) return const <ReservationDto>[];
    final list = (raw as List<dynamic>).cast<Map<String, dynamic>>();
    return list.map(ReservationDto.fromJson).toList();
  }
}
