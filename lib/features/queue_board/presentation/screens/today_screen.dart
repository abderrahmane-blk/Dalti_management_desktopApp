import 'package:desktop_turn_management/core/network/api_exception.dart';
import 'package:desktop_turn_management/features/queue_board/domain/entities/queue_reservation.dart';
import 'package:desktop_turn_management/features/queue_board/presentation/providers/queue_board_notifier.dart';
import 'package:desktop_turn_management/features/queue_board/presentation/util/board_format.dart';
import 'package:desktop_turn_management/features/queue_board/presentation/widgets/reservation_details_dialog.dart';
import 'package:desktop_turn_management/features/queue_board/presentation/widgets/reservation_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A queue's "Today" operator board: the date, a Call-next button, and the
/// reservations ordered by position. Auto-refreshes every 10s (see
/// [queueBoardRealtimeSourceProvider]); the Refresh button forces it sooner.
class TodayScreen extends ConsumerWidget {
  const TodayScreen({
    super.key,
    required this.queueId,
    required this.queueName,
    required this.onRegisterWalkIn,
  });

  final int queueId;
  final String queueName;

  /// Navigates to this queue's walk-in page (duplicate of the sidebar entry).
  final VoidCallback onRegisterWalkIn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final board = ref.watch(queueBoardProvider(queueId));
    final notifier = ref.read(queueBoardProvider(queueId).notifier);
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(queueName, style: theme.textTheme.titleLarge),
                    Text(
                      formatBoardDate(DateTime.now()),
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: theme.colorScheme.outline),
                    ),
                  ],
                ),
              ),
              TextButton.icon(
                onPressed: notifier.refresh,
                icon: const Icon(Icons.refresh),
                label: const Text('Refresh'),
              ),
              const SizedBox(width: 8),
              OutlinedButton.icon(
                onPressed: onRegisterWalkIn,
                icon: const Icon(Icons.person_add_alt),
                label: const Text('Register a walk-in'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
            child: FilledButton.icon(
              onPressed: () => _callNext(context, notifier),
              icon: const Icon(Icons.campaign_outlined),
              label: const Text('Call next'),
            ),
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          Expanded(
            child: switch (board) {
              AsyncData(:final value) => _list(context, value),
              AsyncError(:final error) => _error(notifier, error),
              _ => const Center(child: Text('Loading…')),
            },
          ),
        ],
      ),
    );
  }

  Widget _list(BuildContext context, List<QueueReservation> items) {
    if (items.isEmpty) {
      return const Center(child: Text('No reservations today.'));
    }
    final sorted = [...items]..sort(
        (a, b) =>
            (a.position ?? 1 << 30).compareTo(b.position ?? 1 << 30),
      );
    return ListView.builder(
      itemCount: sorted.length,
      itemBuilder: (_, i) {
        final reservation = sorted[i];
        return ReservationListTile(
          reservation: reservation,
          onTap: () => showDialog<void>(
            context: context,
            builder: (_) => ReservationDetailsDialog(
              reservation: reservation,
              queueId: queueId,
            ),
          ),
        );
      },
    );
  }

  Widget _error(QueueBoard notifier, Object error) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(error is ApiException ? error.message : 'Something went wrong.'),
          const SizedBox(height: 8),
          TextButton(onPressed: notifier.refresh, child: const Text('Retry')),
        ],
      ),
    );
  }

  Future<void> _callNext(BuildContext context, QueueBoard notifier) async {
    final messenger = ScaffoldMessenger.of(context);
    final outcome = await notifier.smartCallNext();
    final message = switch (outcome) {
      CalledReservation(:final reservation) =>
        'Called ${reservation.displayName}.',
      NoCallable() => 'No one left to call.',
      CallNextError(:final error) => error.message,
    };
    messenger.showSnackBar(SnackBar(content: Text(message)));
  }
}
