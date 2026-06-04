import 'package:desktop_turn_management/features/queue_board/domain/entities/board_filters.dart';
import 'package:desktop_turn_management/features/queue_board/domain/entities/queue_reservation.dart';
import 'package:flutter_test/flutter_test.dart';

QueueReservation _res({
  required int id,
  ReservationStatus status = ReservationStatus.accepted,
  String? name,
  String? phone,
  int? servicePointId,
}) =>
    QueueReservation(
      id: id,
      queueId: 1,
      status: status,
      name: name,
      phone: phone,
      servicePointId: servicePointId,
    );

void main() {
  group('BoardFilters.apply', () {
    final reservations = [
      _res(id: 1, status: ReservationStatus.accepted, name: 'Alice', phone: '0550111', servicePointId: 3),
      _res(id: 2, status: ReservationStatus.called, name: 'Bob', phone: '0660222', servicePointId: 4),
      _res(id: 3, status: ReservationStatus.seen, name: 'Carol', phone: '0770333', servicePointId: 3),
    ];

    test('no constraints returns everything and isActive is false', () {
      const filters = BoardFilters();
      expect(filters.isActive, isFalse);
      expect(filters.apply(reservations), hasLength(3));
    });

    test('filters by status set', () {
      const filters = BoardFilters(statuses: {ReservationStatus.called});
      expect(filters.apply(reservations).map((r) => r.id), [2]);
    });

    test('text matches name or phone, case-insensitively', () {
      expect(const BoardFilters(text: 'CAR').apply(reservations).map((r) => r.id), [3]);
      expect(const BoardFilters(text: '0550').apply(reservations).map((r) => r.id), [1]);
    });

    test('service point narrows results', () {
      expect(
        const BoardFilters(servicePointId: 3).apply(reservations).map((r) => r.id),
        [1, 3],
      );
    });

    test('constraints combine (AND)', () {
      const filters = BoardFilters(
        statuses: {ReservationStatus.accepted, ReservationStatus.seen},
        servicePointId: 3,
      );
      expect(filters.apply(reservations).map((r) => r.id), [1, 3]);
    });
  });
}
