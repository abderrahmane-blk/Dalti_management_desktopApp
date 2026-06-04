import 'package:desktop_turn_management/core/network/api_exception.dart';
import 'package:desktop_turn_management/features/queue_board/domain/entities/queue_reservation.dart';
import 'package:desktop_turn_management/features/queue_board/presentation/util/board_format.dart';
import 'package:desktop_turn_management/features/queue_board/presentation/widgets/reservation_list_tile.dart';
import 'package:desktop_turn_management/features/queue_history/domain/entities/history_filters.dart';
import 'package:desktop_turn_management/features/queue_history/domain/entities/history_view.dart';
import 'package:desktop_turn_management/features/queue_history/domain/history_dates.dart';
import 'package:desktop_turn_management/features/queue_history/presentation/providers/queue_history_notifier.dart';
import 'package:desktop_turn_management/features/queue_history/presentation/widgets/history_date_navigator.dart';
import 'package:desktop_turn_management/features/queue_history/presentation/widgets/history_filter_bar.dart';
import 'package:desktop_turn_management/features/queue_history/presentation/widgets/history_reservation_details_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Browse a queue's past reservations by day, refresh a single date or a whole
/// month, and run front-end-only filters over what's already loaded. Mirrors
/// the Today board's shape but never polls.
class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({
    super.key,
    required this.queueId,
    required this.queueName,
  });

  final int queueId;
  final String queueName;

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  /// Browsed day; null until first set, then falls back to the most recent day.
  DateTime? _selectedDate;
  HistoryFilters _filters = const HistoryFilters();
  bool _showFilters = false;

  @override
  Widget build(BuildContext context) {
    final history = ref.watch(queueHistoryProvider(widget.queueId));
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: switch (history) {
        AsyncData(:final value) => _loaded(context, theme, value),
        AsyncError(:final error) => _error(error),
        _ => const Center(child: Text('Loading…')),
      },
    );
  }

  Widget _loaded(BuildContext context, ThemeData theme, HistoryView view) {
    final notifier = ref.read(queueHistoryProvider(widget.queueId).notifier);

    // Effective browsed day, clamped to the loaded window.
    var selected = _selectedDate ?? view.rangeEnd;
    if (selected.isBefore(view.rangeStart)) selected = view.rangeStart;
    if (selected.isAfter(view.rangeEnd)) selected = view.rangeEnd;
    final selectedKey = isoDay(selected);
    final refreshingThisDay = view.refreshingDays.contains(selectedKey);

    final servicePointIds = (view.all
            .map((r) => r.servicePointId)
            .whereType<int>()
            .toSet()
            .toList())
      ..sort();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                '${widget.queueName} — History',
                style: theme.textTheme.titleLarge,
              ),
            ),
            OutlinedButton.icon(
              onPressed: () => setState(() => _showFilters = !_showFilters),
              icon: const Icon(Icons.filter_list),
              label: Text(_showFilters ? 'Hide filters' : 'Search by filters'),
            ),
            const SizedBox(width: 8),
            _monthRefreshMenu(notifier),
          ],
        ),
        const SizedBox(height: 12),
        if (!_filters.isActive)
          Row(
            children: [
              HistoryDateNavigator(
                selectedDate: selected,
                rangeStart: view.rangeStart,
                rangeEnd: view.rangeEnd,
                onDateChanged: (date) => setState(() => _selectedDate = date),
              ),
              const Spacer(),
              if (refreshingThisDay)
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                )
              else
                TextButton.icon(
                  onPressed: () => _refreshDate(notifier, selected),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Refresh this date'),
                ),
            ],
          ),
        const SizedBox(height: 8),
        if (_showFilters)
          HistoryFilterBar(
            filters: _filters,
            servicePointIds: servicePointIds,
            rangeStart: view.rangeStart,
            rangeEnd: view.rangeEnd,
            onChanged: (f) => setState(() => _filters = f),
          ),
        const Divider(height: 1),
        Expanded(
          child: _filters.isActive
              ? _filteredList(context, theme, notifier, view)
              : _dayList(context, notifier, view, selectedKey),
        ),
      ],
    );
  }

  Widget _monthRefreshMenu(QueueHistory notifier) {
    final today = dayOnly(DateTime.now());
    final currentMonth = firstOfMonth(today);
    final prevMonth = firstOfPreviousMonth(today);
    final months = <DateTime>[currentMonth, prevMonth];

    return PopupMenuButton<DateTime>(
      icon: const Icon(Icons.more_vert),
      tooltip: 'More',
      onSelected: (m) => _refreshMonth(notifier, m.year, m.month),
      itemBuilder: (_) => [
        for (final m in months)
          PopupMenuItem<DateTime>(
            value: m,
            child: Text('Refresh ${formatMonthYear(m.year, m.month)}'),
          ),
      ],
    );
  }

  Widget _dayList(
    BuildContext context,
    QueueHistory notifier,
    HistoryView view,
    String dayKey,
  ) {
    final items = [...(view.byDay[dayKey] ?? const <QueueReservation>[])]
      ..sort((a, b) =>
          (a.position ?? 1 << 30).compareTo(b.position ?? 1 << 30));
    if (items.isEmpty) {
      return const Center(child: Text('No reservations on this day.'));
    }
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (_, i) => _tile(context, notifier, items[i]),
    );
  }

  Widget _filteredList(
    BuildContext context,
    ThemeData theme,
    QueueHistory notifier,
    HistoryView view,
  ) {
    // TODO(filters-range): filters must only ever search the range actually
    // fetched from the backend — never silently apply to dates not yet loaded.
    // Keep showing the user the active loaded range (the coverage note below)
    // so the scope is always explicit. Good as is for now.
    final all = view.all;
    final matches = _filters.apply(all)
      ..sort((a, b) {
        final byDate =
            (a.scheduledDate ?? '').compareTo(b.scheduledDate ?? '');
        if (byDate != 0) return byDate;
        return (a.position ?? 1 << 30).compareTo(b.position ?? 1 << 30);
      });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Showing ${matches.length} of ${all.length} loaded reservations · '
            '${formatBoardDate(view.rangeStart)} – ${formatBoardDate(view.rangeEnd)}',
            style: theme.textTheme.bodySmall
                ?.copyWith(color: theme.colorScheme.outline),
          ),
        ),
        Expanded(
          child: matches.isEmpty
              ? const Center(child: Text('No reservations match these filters.'))
              : ListView.builder(
                  itemCount: matches.length,
                  itemBuilder: (_, i) => _tile(context, notifier, matches[i]),
                ),
        ),
      ],
    );
  }

  Widget _tile(
    BuildContext context,
    QueueHistory notifier,
    QueueReservation reservation,
  ) {
    return ReservationListTile(
      reservation: reservation,
      onTap: () => showDialog<void>(
        context: context,
        builder: (_) => HistoryReservationDetailsDialog(
          reservation: reservation,
          onChangeStatus: (status) =>
              notifier.changeStatus(reservation.id, status),
        ),
      ),
    );
  }

  Widget _error(Object error) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(error is ApiException ? error.message : 'Something went wrong.'),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () => ref.invalidate(queueHistoryProvider(widget.queueId)),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Future<void> _refreshDate(QueueHistory notifier, DateTime date) async {
    final error = await notifier.refreshDate(date);
    if (error != null) _snack(error.message);
  }

  Future<void> _refreshMonth(QueueHistory notifier, int year, int month) async {
    final error = await notifier.refreshMonth(year, month);
    _snack(error?.message ?? 'Refreshed ${formatMonthYear(year, month)}.');
  }

  void _snack(String message) {
    if (!mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
