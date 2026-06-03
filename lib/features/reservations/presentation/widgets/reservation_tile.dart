import 'package:desktop_turn_management/features/reservations/domain/entities/reservation.dart';
import 'package:flutter/material.dart';

/// Minimal text row for one [Reservation]: name, party/time, and a colored
/// status word. Deliberately plain — styling comes later.
class ReservationTile extends StatelessWidget {
  const ReservationTile({super.key, required this.reservation});

  final Reservation reservation;

  @override
  Widget build(BuildContext context) {
    final r = reservation;
    final t = r.scheduledAt.toLocal();
    String two(int n) => n.toString().padLeft(2, '0');
    final when = '${t.year}-${two(t.month)}-${two(t.day)} ${two(t.hour)}:${two(t.minute)}';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: r.customerName,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            TextSpan(text: '  ·  party ${r.partySize}  ·  $when  ·  '),
            TextSpan(
              text: r.status.name,
              style: TextStyle(
                color: _statusColor(r.status),
                fontWeight: FontWeight.w600,
              ),
            ),
            if (r.note != null) TextSpan(text: '  ·  ${r.note}'),
          ],
        ),
      ),
    );
  }

  Color _statusColor(ReservationStatus status) => switch (status) {
        ReservationStatus.pending => Colors.orange,
        ReservationStatus.confirmed => Colors.blue,
        ReservationStatus.seated => Colors.green,
        ReservationStatus.completed => Colors.grey,
        ReservationStatus.cancelled => Colors.red,
        ReservationStatus.unknown => Colors.black54,
      };
}
