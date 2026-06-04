/// Pure date helpers for history bucketing.
///
/// A "day" is identified by its `yyyy-MM-dd` string — the same key the backend
/// uses for `scheduledDate` — so buckets are timezone-agnostic and line up with
/// the server exactly. The `DateTime` helpers are date-only (local midnight),
/// used only for navigation and range maths.
library;

String _two(int n) => n.toString().padLeft(2, '0');

/// `yyyy-MM-dd` for [d] (date part only).
String isoDay(DateTime d) => '${d.year}-${_two(d.month)}-${_two(d.day)}';

/// Strips the time, returning local midnight of [d].
DateTime dayOnly(DateTime d) => DateTime(d.year, d.month, d.day);

/// First day of [d]'s month.
DateTime firstOfMonth(DateTime d) => DateTime(d.year, d.month, 1);

/// First day of the month *before* [d]'s (handles year rollover).
DateTime firstOfPreviousMonth(DateTime d) => DateTime(d.year, d.month - 1, 1);

/// Parses a `yyyy-MM-dd` string to a date-only [DateTime], or `null` if absent
/// or malformed.
DateTime? parseIsoDay(String? iso) {
  if (iso == null || iso.isEmpty) return null;
  final parsed = DateTime.tryParse(iso);
  return parsed == null ? null : DateTime(parsed.year, parsed.month, parsed.day);
}
