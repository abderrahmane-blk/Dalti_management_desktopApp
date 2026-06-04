import 'package:desktop_turn_management/features/queue_board/domain/entities/queue_reservation.dart';
import 'package:flutter/material.dart';

/// One board row: position, registered name, status, and the reservation id.
/// Tapping opens the details/actions dialog (wired by the parent).
class ReservationListTile extends StatelessWidget {
  const ReservationListTile({
    super.key,
    required this.reservation,
    required this.onTap,
  });

  final QueueReservation reservation;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final position = reservation.position;
    return ListTile(
      leading: CircleAvatar(
        child: Text(position == null ? '—' : '$position'),
      ),
      title: Text(reservation.displayName),
      subtitle: Text('#${reservation.id}'),
      trailing: Text(
        reservation.status.label,
        style: theme.textTheme.labelLarge?.copyWith(
          color: reservation.isCalled
              ? theme.colorScheme.primary
              : theme.colorScheme.outline,
        ),
      ),
      onTap: onTap,
    );
  }
}
