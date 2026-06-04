import 'package:desktop_turn_management/features/queue_board/domain/entities/queue_reservation.dart';
import 'package:desktop_turn_management/features/queue_history/domain/entities/history_filters.dart';
import 'package:desktop_turn_management/features/queue_history/domain/history_dates.dart';
import 'package:flutter_test/flutter_test.dart';

QueueReservation _res({
  required int id,
  ReservationStatus status = ReservationStatus.seen,
  String? name,
  String? phone,
  String? scheduledDate,
  int? servicePointId,
}) =>
    QueueReservation(
      id: id,
      queueId: 1,
      status: status,
      name: name,
      phone: phone,
      scheduledDate: scheduledDate,
      servicePointId: servicePointId,
    );

void main() {
  group('HistoryFilters.apply', () {
    final reservations = [
      _res(id: 1, status: ReservationStatus.seen, name: 'Alice', phone: '0550111', scheduledDate: '2026-05-10', servicePointId: 3),
      _res(id: 2, status: ReservationStatus.noShow, name: 'Bob', phone: '0660222', scheduledDate: '2026-05-15', servicePointId: 4),
      _res(id: 3, status: ReservationStatus.cancelled, name: 'Carol', phone: '0770333', scheduledDate: '2026-06-01', servicePointId: 3),
    ];

    test('no constraints returns everything and isActive is false', () {
      const filters = HistoryFilters();
      expect(filters.isActive, isFalse);
      expect(filters.apply(reservations), hasLength(3));
    });

    test('filters by status set', () {
      const filters = HistoryFilters(statuses: {ReservationStatus.noShow});
      final result = filters.apply(reservations);
      expect(result.map((r) => r.id), [2]);
    });

    test('text matches name or phone, case-insensitively', () {
      expect(const HistoryFilters(text: 'ali').apply(reservations).map((r) => r.id), [1]);
      expect(const HistoryFilters(text: '0660').apply(reservations).map((r) => r.id), [2]);
    });

    test('service point narrows results', () {
      final result = const HistoryFilters(servicePointId: 3).apply(reservations);
      expect(result.map((r) => r.id), [1, 3]);
    });

    test('sub-range is inclusive on both ends', () {
      final filters = HistoryFilters(
        from: DateTime(2026, 5, 15),
        to: DateTime(2026, 6, 1),
      );
      expect(filters.isActive, isTrue);
      expect(filters.apply(reservations).map((r) => r.id), [2, 3]);
    });

    test('constraints combine (AND)', () {
      const filters = HistoryFilters(
        statuses: {ReservationStatus.seen, ReservationStatus.cancelled},
        servicePointId: 3,
      );
      expect(filters.apply(reservations).map((r) => r.id), [1, 3]);
    });
  });

  group('history_dates', () {
    test('isoDay zero-pads month and day', () {
      expect(isoDay(DateTime(2026, 6, 4)), '2026-06-04');
    });

    test('firstOfPreviousMonth rolls over the year', () {
      expect(firstOfPreviousMonth(DateTime(2026, 1, 20)), DateTime(2025, 12, 1));
    });

    test('parseIsoDay round-trips and rejects junk', () {
      expect(parseIsoDay('2026-05-10'), DateTime(2026, 5, 10));
      expect(parseIsoDay(null), isNull);
      expect(parseIsoDay(''), isNull);
    });
  });
}
