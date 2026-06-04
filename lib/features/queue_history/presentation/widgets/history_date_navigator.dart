import 'package:desktop_turn_management/features/queue_board/presentation/util/board_format.dart';
import 'package:desktop_turn_management/features/queue_history/domain/history_dates.dart';
import 'package:flutter/material.dart';

/// Prev/next-day arrows + a tappable date label (opens a calendar picker),
/// clamped to the loaded `[rangeStart, rangeEnd]` window. Emits a date-only
/// [DateTime] through [onDateChanged].
class HistoryDateNavigator extends StatelessWidget {
  const HistoryDateNavigator({
    super.key,
    required this.selectedDate,
    required this.rangeStart,
    required this.rangeEnd,
    required this.onDateChanged,
  });

  final DateTime selectedDate;
  final DateTime rangeStart;
  final DateTime rangeEnd;
  final ValueChanged<DateTime> onDateChanged;

  @override
  Widget build(BuildContext context) {
    final canPrev = selectedDate.isAfter(rangeStart);
    final canNext = selectedDate.isBefore(rangeEnd);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.chevron_left),
          tooltip: 'Previous day',
          onPressed: canPrev
              ? () => onDateChanged(
                  dayOnly(selectedDate.subtract(const Duration(days: 1))))
              : null,
        ),
        TextButton.icon(
          icon: const Icon(Icons.calendar_today, size: 16),
          label: Text(formatBoardDate(selectedDate)),
          onPressed: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: rangeStart,
              lastDate: rangeEnd,
            );
            if (picked != null) onDateChanged(dayOnly(picked));
          },
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          tooltip: 'Next day',
          onPressed: canNext
              ? () => onDateChanged(
                  dayOnly(selectedDate.add(const Duration(days: 1))))
              : null,
        ),
      ],
    );
  }
}
