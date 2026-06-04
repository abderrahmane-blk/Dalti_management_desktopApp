import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/walk_in/domain/entities/walk_in_ticket.dart';

/// Registers walk-in customers onto a queue.
///
/// Presentation/providers depend only on this. The method returns a [Result]
/// (never throws); transport errors arrive as [Err].
abstract interface class WalkInRepository {
  /// Registers a walk-in on [queueId] for the soonest available spot and
  /// returns its [WalkInTicket]. Which of `name`/`phone` are required depends
  /// on the queue's configured required fields (the backend rejects a missing
  /// one with a bad-request error).
  Future<Result<WalkInTicket>> register(
    int queueId, {
    String? name,
    String? phone,
    String? info,
    String? scheduledDate,
    String? scheduledTime,
  });
}
