import 'package:desktop_turn_management/core/network/api_exception.dart';
import 'package:desktop_turn_management/features/reservations/presentation/providers/reservations_notifier.dart';
import 'package:desktop_turn_management/features/reservations/presentation/widgets/reservation_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Minimal reference screen: a plain text list of reservations that reflects
/// polled updates automatically via the [reservationsProvider] AsyncNotifier.
class ReservationsScreen extends ConsumerWidget {
  const ReservationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reservations = ref.watch(reservationsProvider);
    final notifier = ref.read(reservationsProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservations'),
        actions: [
          TextButton(
            onPressed: notifier.refresh,
            child: const Text('Refresh'),
          ),
        ],
      ),
      body: reservations.when(
        data: (items) => items.isEmpty
            ? const Center(child: Text('No reservations.'))
            : ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, i) => ReservationTile(reservation: items[i]),
              ),
        loading: () => const Center(child: Text('Loading…')),
        error: (error, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(error is ApiException ? error.message : 'Something went wrong.'),
              TextButton(onPressed: notifier.refresh, child: const Text('Retry')),
            ],
          ),
        ),
      ),
    );
  }
}
