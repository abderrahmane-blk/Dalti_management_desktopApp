import 'package:desktop_turn_management/features/queue_board/domain/entities/queue_reservation.dart';

/// Statuses an operator may *set* on a past reservation from the history view.
///
/// Excludes [ReservationStatus.called] and [ReservationStatus.rejected] (live /
/// decisional actions that don't make sense to apply retroactively) and
/// [ReservationStatus.passedToNextQueue] — that one is NOT a plain status
/// change: it has its own endpoint that creates a linked reservation in the
/// next queue, so setting it here would desync data.
const List<ReservationStatus> kHistoryEditableStatuses = <ReservationStatus>[
  ReservationStatus.pending,
  ReservationStatus.accepted,
  ReservationStatus.seen,
  ReservationStatus.noShow,
  ReservationStatus.deferred,
  ReservationStatus.cancelled,
  ReservationStatus.pendingReschedule,
];

/// Statuses offered as filter chips — every real status that can appear in
/// history (excludes only the `unknown` fallback).
const List<ReservationStatus> kFilterableStatuses = <ReservationStatus>[
  ReservationStatus.pending,
  ReservationStatus.accepted,
  ReservationStatus.called,
  ReservationStatus.seen,
  ReservationStatus.noShow,
  ReservationStatus.deferred,
  ReservationStatus.cancelled,
  ReservationStatus.pendingReschedule,
  ReservationStatus.rejected,
  ReservationStatus.passedToNextQueue,
];
