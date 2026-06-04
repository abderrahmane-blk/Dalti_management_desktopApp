import 'package:desktop_turn_management/features/organization/domain/entities/org_permissions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'org_member.freezed.dart';

/// A member of an organization, with their org-wide permission bitmask. Pure
/// domain model (no JSON) — mapped from `MemberPermissionsDto` in the data
/// layer.
@freezed
abstract class OrgMember with _$OrgMember {
  const OrgMember._();

  const factory OrgMember({
    /// The user's GUID (used as the path id for permission/remove calls).
    required String userId,
    required String email,
    required String name,
    required String role,
    required int permissions,
  }) = _OrgMember;

  /// Name to show when the backend has none.
  String get displayName => name.isEmpty ? email : name;

  /// First letter for the placeholder avatar.
  String get initial =>
      displayName.isEmpty ? '?' : displayName.substring(0, 1).toUpperCase();

  /// True when this member holds the org-wide member-management capability
  /// (the "owner" of the org in practice).
  bool get isOwner =>
      role.toLowerCase() == 'owner' ||
      OrgPermission.has(permissions, OrgPermission.memberManage);

  /// The named preset matching this member's permissions, or [MemberPreset.custom].
  MemberPreset get preset => MemberPreset.fromMask(permissions);
}
