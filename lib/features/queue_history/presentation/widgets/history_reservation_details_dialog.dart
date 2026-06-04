import 'package:desktop_turn_management/core/network/api_exception.dart';
import 'package:desktop_turn_management/features/queue_board/domain/entities/queue_reservation.dart';
import 'package:desktop_turn_management/features/queue_board/presentation/util/board_format.dart';
import 'package:desktop_turn_management/features/queue_history/presentation/history_status_options.dart';
import 'package:flutter/material.dart';

/// Read-only details for a past reservation plus a restricted status editor.
/// The status options are [kHistoryEditableStatuses] (Called/Rejected/
/// PassedToNextQueue are intentionally not settable here). [onChangeStatus]
/// performs the update and returns the error (or null on success).
class HistoryReservationDetailsDialog extends StatefulWidget {
  const HistoryReservationDetailsDialog({
    super.key,
    required this.reservation,
    required this.onChangeStatus,
  });

  final QueueReservation reservation;
  final Future<ApiException?> Function(ReservationStatus status) onChangeStatus;

  @override
  State<HistoryReservationDetailsDialog> createState() =>
      _HistoryReservationDetailsDialogState();
}

class _HistoryReservationDetailsDialogState
    extends State<HistoryReservationDetailsDialog> {
  late ReservationStatus _status = widget.reservation.status;
  bool _saving = false;
  String? _error;

  /// Editable statuses, with the current one prepended if it isn't settable
  /// (so the dropdown can still display it).
  List<ReservationStatus> get _options => [
        if (!kHistoryEditableStatuses.contains(widget.reservation.status))
          widget.reservation.status,
        ...kHistoryEditableStatuses,
      ];

  Future<void> _save() async {
    setState(() {
      _saving = true;
      _error = null;
    });
    final error = await widget.onChangeStatus(_status);
    if (!mounted) return;
    if (error != null) {
      setState(() {
        _saving = false;
        _error = error.message;
      });
      return;
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final r = widget.reservation;
    final changed = _status != r.status;
    return AlertDialog(
      title: Text(r.displayName),
      content: SizedBox(
        width: 360,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _row('Reservation', '#${r.id}'),
            if (r.phone != null && r.phone!.isNotEmpty) _row('Phone', r.phone!),
            _row('Position', r.position?.toString() ?? '—'),
            if (r.scheduledDate != null)
              _row(
                'Scheduled',
                '${r.scheduledDate}${r.scheduledTime != null ? ' ${r.scheduledTime}' : ''}',
              ),
            if (r.createdAt != null) _row('Created', formatDateTime(r.createdAt!)),
            if (r.servicePointId != null)
              _row('Service point', '#${r.servicePointId}'),
            if (r.calledAt != null) _row('Called', formatDateTime(r.calledAt!)),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Status'),
                const SizedBox(width: 12),
                Expanded(
                  child: DropdownButton<ReservationStatus>(
                    isExpanded: true,
                    value: _status,
                    items: [
                      for (final s in _options)
                        DropdownMenuItem(value: s, child: Text(s.label)),
                    ],
                    onChanged: _saving
                        ? null
                        : (value) {
                            if (value != null) setState(() => _status = value);
                          },
                  ),
                ),
              ],
            ),
            if (_error != null) ...[
              const SizedBox(height: 8),
              Text(
                _error!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _saving ? null : () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
        FilledButton(
          onPressed: (!changed || _saving) ? null : _save,
          child: _saving
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Save status'),
        ),
      ],
    );
  }

  Widget _row(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 110,
              child: Text(
                label,
                style: TextStyle(color: Theme.of(context).colorScheme.outline),
              ),
            ),
            Expanded(child: Text(value)),
          ],
        ),
      );
}
