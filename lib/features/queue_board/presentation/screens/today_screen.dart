import 'package:desktop_turn_management/core/network/api_exception.dart';
import 'package:desktop_turn_management/features/queue_board/domain/entities/board_filters.dart';
import 'package:desktop_turn_management/features/queue_board/domain/entities/queue_reservation.dart';
import 'package:desktop_turn_management/features/queue_board/presentation/models/call_target.dart';
import 'package:desktop_turn_management/features/queue_board/presentation/providers/queue_board_notifier.dart';
import 'package:desktop_turn_management/features/queue_board/presentation/util/board_format.dart';
import 'package:desktop_turn_management/features/queue_board/presentation/widgets/board_filter_bar.dart';
import 'package:desktop_turn_management/features/queue_board/presentation/widgets/reservation_details_dialog.dart';
import 'package:desktop_turn_management/features/queue_board/presentation/widgets/reservation_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A queue's "Today" operator board: the date, a Call-next button, and the
/// reservations ordered by position. Auto-refreshes every 10s (see
/// [queueBoardRealtimeSourceProvider]); the Refresh button forces it sooner.
///
/// "Search by filters" runs entirely on the front-end over the board already in
/// memory (no extra request); the "Call to" dropdown is a UI-only selector for
/// now (see [CallTarget]).
class TodayScreen extends ConsumerStatefulWidget {
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
  ConsumerState<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends ConsumerState<TodayScreen> {
  BoardFilters _filters = const BoardFilters();
  bool _showFilters = false;

  /// UI-only call destination (not yet sent to the backend — see [CallTarget]).
  CallTarget _callTarget = const DontCallToServicePoint();

  static const List<CallTarget> _callTargets = [
    DontCallToServicePoint(),
    AskEachCall(),
    ...kPlaceholderServicePoints,
  ];

  @override
  Widget build(BuildContext context) {
    final board = ref.watch(queueBoardProvider(widget.queueId));
    final notifier = ref.read(queueBoardProvider(widget.queueId).notifier);
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
                    Text(widget.queueName, style: theme.textTheme.titleLarge),
                    Text(
                      formatBoardDate(DateTime.now()),
                      style: theme.textTheme.bodyMedium
                          ?.copyWith(color: theme.colorScheme.outline),
                    ),
                  ],
                ),
              ),
              OutlinedButton.icon(
                onPressed: () => setState(() => _showFilters = !_showFilters),
                icon: const Icon(Icons.filter_list),
                label: Text(_showFilters ? 'Hide filters' : 'Search by filters'),
              ),
              const SizedBox(width: 8),
              TextButton.icon(
                onPressed: notifier.refresh,
                icon: const Icon(Icons.refresh),
                label: const Text('Refresh'),
              ),
              const SizedBox(width: 8),
              OutlinedButton.icon(
                onPressed: widget.onRegisterWalkIn,
                icon: const Icon(Icons.person_add_alt),
                label: const Text('Register a walk-in'),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              FilledButton.icon(
                onPressed: () => _callNext(context, notifier),
                icon: const Icon(Icons.campaign_outlined),
                label: const Text('Call next'),
              ),
              const SizedBox(width: 16),
              _callToDropdown(),
            ],
          ),
          if (_showFilters)
            BoardFilterBar(
              filters: _filters,
              servicePointIds: _servicePointIds(board),
              onChanged: (f) => setState(() => _filters = f),
            ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          Expanded(
            child: switch (board) {
              AsyncData(:final value) => _list(context, theme, value),
              AsyncError(:final error) => _error(notifier, error),
              _ => const Center(child: Text('Loading…')),
            },
          ),
        ],
      ),
    );
  }

  Widget _callToDropdown() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Call to: '),
        DropdownButton<CallTarget>(
          value: _callTarget,
          items: [
            for (final target in _callTargets)
              DropdownMenuItem<CallTarget>(
                value: target,
                child: Text(target.label),
              ),
          ],
          onChanged: (target) {
            if (target != null) setState(() => _callTarget = target);
          },
        ),
      ],
    );
  }

  /// Distinct service-point ids present on the board, for the filter dropdown.
  List<int> _servicePointIds(AsyncValue<List<QueueReservation>> board) {
    final items = board.asData?.value ?? const <QueueReservation>[];
    final ids = items.map((r) => r.servicePointId).whereType<int>().toSet().toList()
      ..sort();
    return ids;
  }

  Widget _list(
    BuildContext context,
    ThemeData theme,
    List<QueueReservation> items,
  ) {
    final visible = _filters.isActive ? _filters.apply(items) : items;
    final sorted = [...visible]..sort(
        (a, b) => (a.position ?? 1 << 30).compareTo(b.position ?? 1 << 30),
      );

    if (items.isEmpty) {
      return const Center(child: Text('No reservations today.'));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (_filters.isActive)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              'Showing ${sorted.length} of ${items.length} reservations.',
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: theme.colorScheme.outline),
            ),
          ),
        Expanded(
          child: sorted.isEmpty
              ? const Center(child: Text('No reservations match these filters.'))
              : ListView.builder(
                  itemCount: sorted.length,
                  itemBuilder: (_, i) {
                    final reservation = sorted[i];
                    return ReservationListTile(
                      reservation: reservation,
                      onTap: () => showDialog<void>(
                        context: context,
                        builder: (_) => ReservationDetailsDialog(
                          reservation: reservation,
                          queueId: widget.queueId,
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
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
