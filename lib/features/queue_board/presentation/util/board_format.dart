// Tiny date/time formatters for the board, so we avoid pulling in `intl` for
// the bare UI. Replace with a localized formatter during the UI pass.

const List<String> _weekdays = [
  'Mon',
  'Tue',
  'Wed',
  'Thu',
  'Fri',
  'Sat',
  'Sun',
];

const List<String> _months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];

const List<String> _monthsFull = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

String _two(int n) => n.toString().padLeft(2, '0');

/// e.g. "Thu 4 Jun 2026".
String formatBoardDate(DateTime d) =>
    '${_weekdays[d.weekday - 1]} ${d.day} ${_months[d.month - 1]} ${d.year}';

/// e.g. "June 2026" (1-based [month]).
String formatMonthYear(int year, int month) => '${_monthsFull[month - 1]} $year';

/// e.g. "2026-06-04 14:05".
String formatDateTime(DateTime d) {
  final local = d.toLocal();
  return '${local.year}-${_two(local.month)}-${_two(local.day)} '
      '${_two(local.hour)}:${_two(local.minute)}';
}
