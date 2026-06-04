import 'package:freezed_annotation/freezed_annotation.dart';

part 'workspace.freezed.dart';

/// The caller's role within an organization. The backend sends a string
/// (`Owner` / `Manager` / `Staff`); unknown values fall back to [unknown]
/// rather than throwing.
enum OrgRole { owner, manager, staff, unknown }

/// A trilingual string (Arabic / English / French) as the backend returns it
/// for names, addresses and descriptions. [display] picks a sensible non-empty
/// value for the (currently English-leaning) UI.
@freezed
abstract class L10n with _$L10n {
  const L10n._();

  const factory L10n({
    required String ar,
    required String en,
    required String fr,
  }) = _L10n;

  /// First non-empty of en → fr → ar, or empty when all are blank.
  String get display => en.isNotEmpty
      ? en
      : fr.isNotEmpty
          ? fr
          : ar;
}

/// A queue the user can see/operate within a [ManagedOrganization].
@freezed
abstract class ManagedQueue with _$ManagedQueue {
  const factory ManagedQueue({
    required int id,
    required String mode,
    required String status,
    required int effectivePermissions,
    required int grantPermissions,
    required bool canOperate,
    required L10n name,
    required L10n description,
  }) = _ManagedQueue;
}

/// An organization the user can manage, with the user's role/permissions in it
/// and its queues. This is the unit the user selects on the workspace screen.
@freezed
abstract class ManagedOrganization with _$ManagedOrganization {
  const factory ManagedOrganization({
    required int id,
    required String sector,
    int? subtypeId,
    required double latitude,
    required double longitude,
    required OrgRole role,
    required int orgPermissions,
    required L10n name,
    required L10n address,
    required List<ManagedQueue> queues,
  }) = _ManagedOrganization;
}

/// The full `/me/workspaces` payload: every organization the signed-in user can
/// manage (as owner, manager, or staff).
@freezed
abstract class Workspace with _$Workspace {
  const factory Workspace({
    required String userId,
    required bool isPlatformAdmin,
    required List<ManagedOrganization> organizations,
  }) = _Workspace;
}
