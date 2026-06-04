/// Domain entity for a time window entry in queue rules (e.g. "08:00"–"12:00").
class WorkTimeWindow {
  const WorkTimeWindow({required this.start, required this.end});
  final String start;
  final String end;
}

/// Parsed, typed representation of the JSON rules blob stored on a queue.
/// Every field is nullable — null means "not set / not applicable".
/// Mirrors [QueueRules] on the backend.
class QueueRulesData {
  const QueueRulesData({
    this.autoAcceptReservations,
    this.addTurnOnAccept,
    this.workTime,
    this.workDays,
    this.specialOffDays,
    this.timeDedicatedPerTurn,
    this.safeTimeToFinish,
    this.maxDaysAhead,
    this.minTurnDuration,
    this.infoNeededForReserving,
    this.maxReservationsPerDay,
  });

  final bool? autoAcceptReservations;
  final bool? addTurnOnAccept;
  final List<WorkTimeWindow>? workTime;
  final List<int>? workDays;
  final List<String>? specialOffDays;
  final int? timeDedicatedPerTurn;
  final int? safeTimeToFinish;
  final int? maxDaysAhead;
  final int? minTurnDuration;
  final List<String>? infoNeededForReserving;
  final int? maxReservationsPerDay;

  factory QueueRulesData.fromJson(Map<String, dynamic> json) {
    List<WorkTimeWindow>? workTime;
    final raw = json['work_time'];
    if (raw is List) {
      workTime = raw.map((w) {
        final m = w as Map<String, dynamic>;
        return WorkTimeWindow(
          start: m['start'] as String? ?? '',
          end: m['end'] as String? ?? '',
        );
      }).toList();
    }
    return QueueRulesData(
      autoAcceptReservations: json['auto_accept_reservations'] as bool?,
      addTurnOnAccept: json['add_turn_on_accept'] as bool?,
      workTime: workTime,
      workDays: (json['work_days'] as List?)?.cast<int>(),
      specialOffDays: (json['special_off_days'] as List?)?.cast<String>(),
      timeDedicatedPerTurn: json['time_dedicated_per_turn'] as int?,
      safeTimeToFinish: json['safe_time_to_finish'] as int?,
      maxDaysAhead: json['max_days_ahead'] as int?,
      minTurnDuration: json['min_turn_duration'] as int?,
      infoNeededForReserving:
          (json['info_needed_for_reserving'] as List?)?.cast<String>(),
      maxReservationsPerDay: json['max_reservations_per_day'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        if (autoAcceptReservations != null)
          'auto_accept_reservations': autoAcceptReservations,
        if (addTurnOnAccept != null) 'add_turn_on_accept': addTurnOnAccept,
        if (workTime != null)
          'work_time': workTime!
              .map((w) => {'start': w.start, 'end': w.end})
              .toList(),
        if (workDays != null) 'work_days': workDays,
        if (specialOffDays != null) 'special_off_days': specialOffDays,
        if (timeDedicatedPerTurn != null)
          'time_dedicated_per_turn': timeDedicatedPerTurn,
        if (safeTimeToFinish != null) 'safe_time_to_finish': safeTimeToFinish,
        if (maxDaysAhead != null) 'max_days_ahead': maxDaysAhead,
        if (minTurnDuration != null) 'min_turn_duration': minTurnDuration,
        if (infoNeededForReserving != null)
          'info_needed_for_reserving': infoNeededForReserving,
        if (maxReservationsPerDay != null)
          'max_reservations_per_day': maxReservationsPerDay,
      };
}

/// Full queue data fetched from `GET /queues/{id}/full`. Includes translations
/// for all three languages and parsed rules.
class QueueFullData {
  const QueueFullData({
    required this.id,
    required this.mode,
    required this.status,
    required this.rules,
    this.nameAr = '',
    this.nameEn = '',
    this.nameFr = '',
    this.descAr = '',
    this.descEn = '',
    this.descFr = '',
    this.nextQueueId,
  });

  final int id;
  final String mode;
  final String status;
  final QueueRulesData rules;
  final String nameAr;
  final String nameEn;
  final String nameFr;
  final String descAr;
  final String descEn;
  final String descFr;
  final int? nextQueueId;
}
