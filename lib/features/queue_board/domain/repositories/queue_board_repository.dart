import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/queue_board/domain/entities/queue_reservation.dart';

/// Domain-facing contract for a queue's live operator board ("Today").
///
/// Presentation/providers depend only on this. All methods return a [Result]
/// (never throw); transport errors arrive as [Err].
abstract interface class QueueBoardRepository {
  /// `GET /queue-server/{queueId}/today` — full reservation objects (not ids).
  Future<Result<List<QueueReservation>>> fetchToday(int queueId);

  /// `GET /queue-server/{queueId}/next-turn` — the current turn pointer (a
  /// 0-based index into the queue; `turnNumber = position - 1`).
  Future<Result<int>> nextTurn(int queueId);

  /// `POST /queue-server/{queueId}/set-next-turn/{turnNumber}` — moves the turn
  /// pointer (used by smart call-next to skip over non-callable reservations).
  Future<Result<void>> setNextTurn(int queueId, int turnNumber);

  /// `POST /queue-server/{queueId}/call-next` — calls the next customer and
  /// returns the called reservation.
  Future<Result<QueueReservation>> callNext(int queueId);

  /// `POST /queue-server/{queueId}/call/{turnNumber}` — calls/recalls a
  /// specific turn (turnNumber = position - 1).
  Future<Result<QueueReservation>> callTurn(int queueId, int turnNumber);

  /// `PATCH /reservations/{reservationId}/status` — sets an arbitrary status
  /// (integer wire value of [ReservationStatus]).
  Future<Result<void>> updateStatus(int reservationId, int statusValue);

  /// `POST /reservations/{reservationId}/pass-to-next-queue`.
  Future<Result<void>> passToNextQueue(int reservationId);

  /// `GET /queues/{queueId}` → `nextQueueId` (null when the queue has no next
  /// queue, i.e. the "send to next queue" action does not apply).
  Future<Result<int?>> fetchNextQueueId(int queueId);
}
