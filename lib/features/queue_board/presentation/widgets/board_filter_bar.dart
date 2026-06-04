import 'package:desktop_turn_management/features/queue_board/domain/entities/board_filters.dart';
import 'package:desktop_turn_management/features/queue_board/domain/entities/queue_reservation.dart';
import 'package:flutter/material.dart';

/// Collapsible front-end filter panel for the Today board: status chips, a
/// name/phone search field, and a service-point dropdown built from the ids
/// present on the board. Pure UI — it just reports a new [BoardFilters].
class BoardFilterBar extends StatefulWidget {
  const BoardFilterBar({
    super.key,
    required this.filters,
    required this.servicePointIds,
    required this.onChanged,
  });

  final BoardFilters filters;
  final List<int> servicePointIds;
  final ValueChanged<BoardFilters> onChanged;

  /// Every status the user can filter by (everything the board can show).
  static final List<ReservationStatus> _statuses = ReservationStatus.values
      .where((s) => s != ReservationStatus.unknown)
      .toList();

  @override
  State<BoardFilterBar> createState() => _BoardFilterBarState();
}

class _BoardFilterBarState extends State<BoardFilterBar> {
  late final TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: widget.filters.text);
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filters = widget.filters;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              for (final status in BoardFilterBar._statuses)
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
                    labelText: 'Name or phone',
                    isDense: true,
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (v) => widget.onChanged(filters.copyWith(text: v)),
                ),
              ),
              const SizedBox(width: 12),
              if (widget.servicePointIds.isNotEmpty)
                DropdownButton<int?>(
                  value: filters.servicePointId,
                  hint: const Text('Service point'),
                  items: [
                    const DropdownMenuItem<int?>(child: Text('Any')),
                    for (final id in widget.servicePointIds)
                      DropdownMenuItem<int?>(value: id, child: Text('#$id')),
                  ],
                  onChanged: (id) =>
                      widget.onChanged(filters.copyWith(servicePointId: id)),
                ),
              const SizedBox(width: 12),
              TextButton(
                onPressed: filters.isActive
                    ? () {
                        _textController.clear();
                        widget.onChanged(const BoardFilters());
                      }
                    : null,
                child: const Text('Clear'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
