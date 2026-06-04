import 'package:freezed_annotation/freezed_annotation.dart';

part 'walk_in_ticket.freezed.dart';

/// The outcome of registering a walk-in: the created reservation [id], the
/// assigned queue [position], and the [secretCode] the customer can use to
/// track it. Pure domain model — no JSON.
///
/// [position] is null for a scheduled (time-based) reservation, which has a
/// [scheduledTime] slot instead of a queue rank.
@freezed
abstract class WalkInTicket with _$WalkInTicket {
  const factory WalkInTicket({
    required int id,
    int? position,
    required String secretCode,
    String? scheduledDate,
    String? scheduledTime,
  }) = _WalkInTicket;
}
