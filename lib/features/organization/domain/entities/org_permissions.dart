/// Org-wide permission bitmask, mirroring the backend
/// `Features/Authorization/Permission.cs`. A member's `permissions` is an OR of
/// these flags; the frontend works with a few named presets rather than raw
/// bits (see [MemberPreset]).
abstract final class OrgPermission {
  static const int none = 0;
  static const int orgManage = 1;
  static const int memberManage = 2;
  static const int specialtyManage = 4;
  static const int servicePointManage = 8;
  static const int queueCreate = 16;
  static const int queueEdit = 32;
  static const int queueGrantManage = 64;
  static const int queueOperate = 128;
  static const int reservationManage = 256;

  /// Whether [permissions] includes [flag].
  static bool has(int permissions, int flag) => (permissions & flag) != 0;
}

/// The named permission sets the owner UI offers, matching the backend presets:
///   Operator = QueueOperate | ReservationManage          = 384
///   Manager  = Operator | QueueEdit | QueueGrantManage    = 480
///   Owner    = everything                                 = 511
enum MemberPreset {
  operator(384, 'Operator', 'Call next + manage reservations'),
  manager(480, 'Manager', 'Operator + edit queues + delegate'),
  owner(511, 'Owner', 'Full control of the organization'),

  /// A bitmask that does not match a known preset.
  custom(-1, 'Custom', 'A custom set of permissions');

  const MemberPreset(this.mask, this.label, this.description);

  /// The bitmask this preset sends to the backend (`-1` for [custom]).
  final int mask;
  final String label;
  final String description;

  /// The preset whose mask equals [permissions], or [custom] if none match.
  static MemberPreset fromMask(int permissions) => values.firstWhere(
        (p) => p != custom && p.mask == permissions,
        orElse: () => custom,
      );

  /// The presets a user can pick in the add/edit dialogs (not [custom]).
  static List<MemberPreset> get selectable =>
      values.where((p) => p != custom).toList();
}
