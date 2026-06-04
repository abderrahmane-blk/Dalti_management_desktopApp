import 'package:desktop_turn_management/core/network/api_exception.dart';
import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/org_member.dart';
import 'package:desktop_turn_management/features/organization/presentation/providers/organization_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'org_members_notifier.g.dart';

/// Loads and mutates an organization's member list (one instance per org).
///
/// `build()` fetches once (requires MemberManage on the org). The mutation
/// methods call the backend and, on success, patch the list in place so the UI
/// updates without a reload; each returns the [ApiException] on failure (or
/// null on success) for a snackbar.
@riverpod
class OrgMembers extends _$OrgMembers {
  @override
  Future<List<OrgMember>> build(int orgId) async {
    final result = await ref.read(organizationRepositoryProvider).fetchMembers(orgId);
    return switch (result) {
      Ok(:final value) => value,
      Err(:final error) => throw error,
    };
  }

  List<OrgMember>? get _list => switch (state) {
        AsyncData(:final value) => value,
        _ => null,
      };

  Future<ApiException?> addMember(String email, int permissions) async {
    final result = await ref
        .read(organizationRepositoryProvider)
        .addMember(orgId, email, permissions);
    switch (result) {
      case Ok(:final value):
        final current = _list ?? const [];
        state = AsyncData([...current, value]);
        return null;
      case Err(:final error):
        return error;
    }
  }

  Future<ApiException?> setPermissions(String userId, int permissions) async {
    final result = await ref
        .read(organizationRepositoryProvider)
        .setMemberPermissions(orgId, userId, permissions);
    switch (result) {
      case Ok(:final value):
        final current = _list ?? const [];
        state = AsyncData([
          for (final m in current) m.userId == userId ? value : m,
        ]);
        return null;
      case Err(:final error):
        return error;
    }
  }

  Future<ApiException?> removeMember(String userId) async {
    final result = await ref
        .read(organizationRepositoryProvider)
        .removeMember(orgId, userId);
    switch (result) {
      case Ok():
        final current = _list ?? const [];
        state = AsyncData([
          for (final m in current)
            if (m.userId != userId) m,
        ]);
        return null;
      case Err(:final error):
        return error;
    }
  }
}
