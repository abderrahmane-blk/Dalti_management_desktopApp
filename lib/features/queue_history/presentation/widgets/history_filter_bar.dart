import 'package:desktop_turn_management/features/queue_board/presentation/util/board_format.dart';
import 'package:desktop_turn_management/features/queue_history/domain/entities/history_filters.dart';
import 'package:desktop_turn_management/features/queue_history/domain/history_dates.dart';
import 'package:desktop_turn_management/features/queue_history/presentation/history_status_options.dart';
import 'package:flutter/material.dart';

/// Front-end-only filter controls. The parent owns the [HistoryFilters] state
/// and rebuilds the result list; this widget just edits it via [onChanged].
class HistoryFilterBar extends StatefulWidget {
  const HistoryFilterBar({
    super.key,
    required this.filters,
    required this.servicePointIds,
    required this.rangeStart,
    required this.rangeEnd,
    required this.onChanged,
  });

  final HistoryFilters filters;
  final List<int> servicePointIds;
  final DateTime rangeStart;
  final DateTime rangeEnd;
  final ValueChanged<HistoryFilters> onChanged;

  @override
  State<HistoryFilterBar> createState() => _HistoryFilterBarState();
}

class _HistoryFilterBarState extends State<HistoryFilterBar> {
  late final TextEditingController _textController =
      TextEditingController(text: widget.filters.text);

  @override
  void didUpdateWidget(HistoryFilterBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Keep the field in sync when the parent resets filters (e.g. "Clear").
    if (widget.filters.text != _textController.text) {
      _textController.text = widget.filters.text;
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _pickDate({required bool isFrom}) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: (isFrom ? widget.filters.from : widget.filters.to) ??
          (isFrom ? widget.rangeStart : widget.rangeEnd),
      firstDate: widget.rangeStart,
      lastDate: widget.rangeEnd,
    );
    if (picked == null) return;
    final day = dayOnly(picked);
    widget.onChanged(
      isFrom ? widget.filters.copyWith(from: day) : widget.filters.copyWith(to: day),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filters = widget.filters;
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 4,
              children: [
                for (final status in kFilterableStatuses)
                  FilterChip(
                    label: Text(status.label),
                    selected: filters.statuses.contains(status),
                    onSelected: (selected) {
                      final next = {...filters.statuses};
                      if (selected) {
                        next.add(status);
                      } else {
                        next.remove(status);
                      }
                      widget.onChanged(filters.copyWith(statuses: next));
                    },
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      isDense: true,
                      prefixIcon: Icon(Icons.search, size: 18),
                      hintText: 'Name or phone',
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) =>
                        widget.onChanged(filters.copyWith(text: value)),
                  ),
                ),
                const SizedBox(width: 12),
                DropdownButton<int?>(
                  value: filters.servicePointId,
                  hint: const Text('Service point'),
                  items: [
                    const DropdownMenuItem<int?>(
                      child: Text('Any service point'),
                    ),
                    for (final id in widget.servicePointIds)
                      DropdownMenuItem<int?>(
                        value: id,
                        child: Text('Service point #$id'),
                      ),
                  ],
                  onChanged: (value) =>
                      widget.onChanged(filters.copyWith(servicePointId: value)),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                OutlinedButton.icon(
                  icon: const Icon(Icons.event, size: 16),
                  label: Text(filters.from == null
                      ? 'From: any'
                      : 'From: ${formatBoardDate(filters.from!)}'),
                  onPressed: () => _pickDate(isFrom: true),
                ),
                const SizedBox(width: 8),
                OutlinedButton.icon(
                  icon: const Icon(Icons.event, size: 16),
                  label: Text(filters.to == null
                      ? 'To: any'
                      : 'To: ${formatBoardDate(filters.to!)}'),
                  onPressed: () => _pickDate(isFrom: false),
                ),
                const Spacer(),
                TextButton.icon(
                  icon: const Icon(Icons.clear, size: 16),
                  label: const Text('Clear filters'),
                  onPressed: filters.isActive
                      ? () => widget.onChanged(const HistoryFilters())
                      : null,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
