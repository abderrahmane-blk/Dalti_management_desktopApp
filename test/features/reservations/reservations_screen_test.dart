import 'dart:async';

import 'package:desktop_turn_management/core/config/app_config.dart';
import 'package:desktop_turn_management/core/realtime/realtime_source.dart';
import 'package:desktop_turn_management/features/reservations/domain/entities/reservation.dart';
import 'package:desktop_turn_management/features/reservations/presentation/providers/reservation_providers.dart';
import 'package:desktop_turn_management/features/reservations/presentation/screens/reservations_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// A [RealtimeSource] that emits a fixed list once — stands in for polling/SSE
/// so the test needs no backend. Demonstrates the realtime seam: swapping the
/// transport is a single provider override.
class _FakeRealtimeSource implements RealtimeSource<List<Reservation>> {
  _FakeRealtimeSource(this.items);

  final List<Reservation> items;

  @override
  Stream<List<Reservation>> watch() => Stream<List<Reservation>>.value(items);

  @override
  Future<void> dispose() async {}
}

void main() {
  testWidgets('renders reservations from the realtime source', (tester) async {
    final sample = <Reservation>[
      Reservation(
        id: '1',
        customerName: 'Ada Lovelace',
        partySize: 2,
        scheduledAt: DateTime(2026, 6, 3, 19, 30),
        status: ReservationStatus.confirmed,
      ),
    ];

    // Pump the screen directly (not the whole app/router): the app now starts
    // at the login gate, so the reservations slice is exercised in isolation.
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appConfigProvider.overrideWithValue(AppConfig.dev),
          reservationsRealtimeSourceProvider
              .overrideWith((ref) => _FakeRealtimeSource(sample)),
        ],
        child: const MaterialApp(home: ReservationsScreen()),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Reservations'), findsOneWidget);
    // The tile is a Text.rich, so search rich text for the customer name.
    expect(
      find.textContaining('Ada Lovelace', findRichText: true),
      findsOneWidget,
    );
  });
}
