import 'package:desktop_turn_management/core/network/api_exception.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/org_member.dart';
import 'package:desktop_turn_management/features/organization/presentation/providers/org_members_notifier.dart';
import 'package:desktop_turn_management/features/organization/presentation/widgets/member_add_dialog.dart';
import 'package:desktop_turn_management/features/organization/presentation/widgets/member_edit_dialog.dart';
import 'package:desktop_turn_management/features/organization/presentation/widgets/member_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Full-page list of an org's members with add / edit / remove. Reached from
/// the organization page's Members section.
class OrgMembersScreen extends ConsumerWidget {
  const OrgMembersScreen({
    super.key,
    required this.orgId,
    required this.orgName,
  });

  final int orgId;
  final String orgName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final members = ref.watch(orgMembersProvider(orgId));
    final notifier = ref.read(orgMembersProvider(orgId).notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text('Members — $orgName'),
        actions: [
          TextButton.icon(
            onPressed: () => _addMember(context, notifier),
            icon: const Icon(Icons.person_add_alt_1),
            label: const Text('Add member'),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: switch (members) {
        AsyncData(:final value) => _list(context, notifier, value),
        AsyncError(:final error) => _error(ref, error),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }

  Widget _list(BuildContext context, OrgMembers notifier, List<OrgMember> value) {
    if (value.isEmpty) {
      return const Center(child: Text('No members yet.'));
    }
    return ListView.builder(
      itemCount: value.length,
      itemBuilder: (_, i) {
        final member = value[i];
        return MemberListTile(
          member: member,
          onEdit: () => _editMember(context, notifier, member),
        );
      },
    );
  }

  Widget _error(WidgetRef ref, Object error) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(error is ApiException ? error.message : 'Something went wrong.'),
          const SizedBox(height: 8),
          TextButton(
            onPressed: () => ref.invalidate(orgMembersProvider(orgId)),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  void _addMember(BuildContext context, OrgMembers notifier) {
    showDialog<void>(
      context: context,
      builder: (_) => MemberAddDialog(
        onAdd: (email, permissions) => notifier.addMember(email, permissions),
      ),
    );
  }

  void _editMember(BuildContext context, OrgMembers notifier, OrgMember member) {
    showDialog<void>(
      context: context,
      builder: (_) => MemberEditDialog(
        member: member,
        onSave: (permissions) =>
            notifier.setPermissions(member.userId, permissions),
        onDelete: () => notifier.removeMember(member.userId),
      ),
    );
  }
}
