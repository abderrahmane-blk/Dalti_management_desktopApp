import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/queue_board/domain/entities/queue_reservation.dart';

/// Reads (and one write: status) for a queue's reservation history. Every method
/// returns a [Result] and never throws across the boundary. Reservations are
/// bucketed by their `yyyy-MM-dd` day key — the same key the backend uses.
abstract interface class QueueHistoryRepository {
  /// Fetches each month in [months] (1-based), writes every day to the store,
  /// and returns the merged reservations grouped by day (`yyyy-MM-dd`).
  Future<Result<Map<String, List<QueueReservation>>>> loadMonths(
    int queueId,
    List<({int year, int month})> months,
  );

  /// Re-fetches a single [date], overwrites its store bucket, returns its list.
  Future<Result<List<QueueReservation>>> refreshDate(int queueId, DateTime date);

  /// Re-fetches a whole month, overwrites its store buckets, returns the month
  /// grouped by day.
  Future<Result<Map<String, List<QueueReservation>>>> refreshMonth(
    int queueId,
    int year,
    int month,
  );

  /// `PATCH /reservations/{id}/status` with an integer status wire value.
  Future<Result<void>> updateStatus(int reservationId, int statusValue);
}
