import 'package:desktop_turn_management/features/organization/domain/entities/org_member.dart';
import 'package:flutter/material.dart';

/// One row in the members list: a placeholder initials avatar, the member's
/// name + email, their permission preset, and an Edit affordance.
// TODO(member-photos): the `/orgs/{id}/members` endpoint returns no photo URL;
// `/orgs/{id}/data` (OrgMemberDto) carries PhotoUrl/Title/Bio and could be
// merged in for a richer profile. For now we show an initials avatar.
class MemberListTile extends StatelessWidget {
  const MemberListTile({
    super.key,
    required this.member,
    required this.onEdit,
  });

  final OrgMember member;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: CircleAvatar(child: Text(member.initial)),
      title: Row(
        children: [
          Flexible(child: Text(member.displayName)),
          if (member.isOwner) ...[
            const SizedBox(width: 8),
            Chip(
              label: const Text('Owner'),
              visualDensity: VisualDensity.compact,
              backgroundColor: theme.colorScheme.primaryContainer,
            ),
          ],
        ],
      ),
      subtitle: Text('${member.email} · ${member.preset.label}'),
      trailing: IconButton(
        icon: const Icon(Icons.edit_outlined),
        tooltip: 'Edit member',
        onPressed: onEdit,
      ),
      onTap: onEdit,
    );
  }
}
