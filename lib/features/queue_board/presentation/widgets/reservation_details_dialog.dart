import 'package:desktop_turn_management/core/network/api_exception.dart';
import 'package:desktop_turn_management/features/queue_board/domain/entities/queue_reservation.dart';
import 'package:desktop_turn_management/features/queue_board/presentation/providers/queue_board_notifier.dart';
import 'package:desktop_turn_management/features/queue_board/presentation/providers/queue_board_providers.dart';
import 'package:desktop_turn_management/features/queue_board/presentation/util/board_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Popup for a single reservation: its details plus the operator actions —
/// call/recall (hidden when rejected), an "Other actions" status menu, and
/// "Send to next queue" (only when the queue has a next queue *and* the status
/// still allows it — see [ReservationStatus.canPassToNextQueue]).
class ReservationDetailsDialog extends ConsumerWidget {
  const ReservationDetailsDialog({
    super.key,
    required this.reservation,
    required this.queueId,
  });

  final QueueReservation reservation;
  final int queueId;

  /// Statuses offered in the "Other actions" menu. Calling and passing to the
  /// next queue have dedicated buttons, so they are not repeated here.
  static const List<ReservationStatus> _otherActions = [
    ReservationStatus.accepted,
    ReservationStatus.seen,
    ReservationStatus.noShow,
    ReservationStatus.deferred,
    ReservationStatus.cancelled,
    ReservationStatus.pendingReschedule,
    ReservationStatus.rejected,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(queueBoardProvider(queueId).notifier);
    final hasNextQueue =
        ref.watch(queueHasNextQueueProvider(queueId)).asData?.value ?? false;
    final turn = reservation.turnNumber;
    final schedule = [reservation.scheduledDate, reservation.scheduledTime]
        .whereType<String>()
        .join(' ');

    return AlertDialog(
      title: Text(reservation.displayName),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _row('ID', '${reservation.id}'),
            _row('Position', reservation.position?.toString() ?? '—'),
            _row('Status', reservation.status.label),
            if (reservation.phone != null) _row('Phone', reservation.phone!),
            if (reservation.secretCode != null)
              _row('Secret code', reservation.secretCode!),
            if (schedule.isNotEmpty) _row('Scheduled', schedule),
            if (reservation.info != null && reservation.info!.isNotEmpty)
              _row('Info', reservation.info!),
            if (reservation.servicePointId != null)
              _row('Service point', '${reservation.servicePointId}'),
            if (reservation.createdAt != null)
              _row('Created', formatDateTime(reservation.createdAt!)),
            if (reservation.calledAt != null)
              _row('Called', formatDateTime(reservation.calledAt!)),
          ],
        ),
      ),
      actions: [
        if (!reservation.isRejected)
          FilledButton(
            onPressed: turn == null
                ? null
                : () => _run(
                      context,
                      () => notifier.callTurn(turn),
                      reservation.isCalled
                          ? 'Recalled ${reservation.displayName}'
                          : 'Called ${reservation.displayName}',
                    ),
            child: Text(reservation.isCalled ? 'Recall' : 'Call'),
          ),
        PopupMenuButton<ReservationStatus>(
          tooltip: 'Other actions',
          onSelected: (status) => _run(
            context,
            () => notifier.updateStatus(reservation.id, status.wireValue),
            'Status set to ${status.label}',
          ),
          itemBuilder: (_) => [
            for (final status in _otherActions)
              PopupMenuItem<ReservationStatus>(
                value: status,
                child: Text(status.label),
              ),
          ],
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.outline),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [Text('Other actions'), Icon(Icons.arrow_drop_down)],
            ),
          ),
        ),
        if (hasNextQueue && reservation.status.canPassToNextQueue)
          OutlinedButton(
            onPressed: () => _run(
              context,
              () => notifier.passToNextQueue(reservation.id),
              'Sent to next queue',
            ),
            child: const Text('Send to next queue'),
          ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Close'),
        ),
      ],
    );
  }

  Widget _row(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Text('$label: $value'),
      );

  /// Runs an operator action, closes the dialog, and reports the outcome via a
  /// snackbar. The board refresh is handled by the notifier on success.
  Future<void> _run(
    BuildContext context,
    Future<ApiException?> Function() action,
    String okMessage,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final error = await action();
    navigator.pop();
    messenger.showSnackBar(
      SnackBar(content: Text(error?.message ?? okMessage)),
    );
  }
}
