import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/reservations/domain/entities/reservation.dart';

/// Domain-facing contract for reservation data access.
///
/// Presentation/providers depend on this interface only — never on `dio`, the
/// `KeyValueStore`, or the concrete datasources. The implementation in the data
/// layer composes a remote and a local datasource (and, later, a sync engine).
abstract interface class ReservationRepository {
  /// Fetches the latest reservations from the backend and refreshes the local
  /// cache. Returns an [Err] (never throws) on transport/parse failure.
  Future<Result<List<Reservation>>> fetchReservations();

  /// Returns the locally-cached reservations without touching the network.
  /// Empty when nothing has been cached yet.
  Future<List<Reservation>> cachedReservations();
}
