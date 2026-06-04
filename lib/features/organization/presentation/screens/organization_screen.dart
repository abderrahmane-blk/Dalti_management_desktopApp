import 'package:desktop_turn_management/core/network/api_exception.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/catalog_items.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/org_member.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/org_permissions.dart';
import 'package:desktop_turn_management/features/organization/presentation/providers/org_members_notifier.dart';
import 'package:desktop_turn_management/features/organization/presentation/providers/org_specialties_notifier.dart';
import 'package:desktop_turn_management/features/organization/presentation/screens/org_members_screen.dart';
import 'package:desktop_turn_management/features/organization/presentation/widgets/edit_org_dialog.dart';
import 'package:desktop_turn_management/features/organization/presentation/widgets/queue_edit_dialog.dart';
import 'package:desktop_turn_management/features/organization/presentation/widgets/queue_form_dialog.dart';
import 'package:desktop_turn_management/features/organization/presentation/widgets/service_point_form_dialog.dart';
import 'package:desktop_turn_management/features/workspaces/domain/entities/workspace.dart';
import 'package:desktop_turn_management/features/workspaces/presentation/providers/selected_workspace.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The organization "home": org info, owner, queues, service points, and a
/// members section. Queues & service points are UI-only for now; members and
/// edit-organization are wired to the backend.
class OrganizationScreen extends ConsumerWidget {
  const OrganizationScreen({super.key});

  /// Placeholder service points until the service-points endpoints are wired.
  // TODO(service-points): replace with `GET /orgs/{orgId}/service-points`.
  static const List<({String code, String name, bool active})>
      _placeholderServicePoints = [
    (code: 'G1', name: 'Window 1', active: true),
    (code: 'G2', name: 'Window 2', active: false),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final org = ref.watch(selectedWorkspaceProvider);
    final theme = Theme.of(context);

    if (org == null) {
      return const Center(child: Text('No organization selected.'));
    }

    final canManageMembers =
        OrgPermission.has(org.orgPermissions, OrgPermission.memberManage);
    final canEditOrg =
        OrgPermission.has(org.orgPermissions, OrgPermission.orgManage);
    final members =
        canManageMembers ? ref.watch(orgMembersProvider(org.id)) : null;
    final specialties = ref.watch(orgSpecialtiesProvider(org.id));

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(org.name.display, style: theme.textTheme.titleLarge),
              ),
              if (canEditOrg)
                OutlinedButton.icon(
                  onPressed: () => _editOrg(context, org),
                  icon: const Icon(Icons.edit_outlined),
                  label: const Text('Edit organization'),
                ),
            ],
          ),
          const SizedBox(height: 16),
          _OrgInfoSection(org: org),
          _SpecialtiesSection(specialties: specialties),
          _OwnerSection(org: org, members: members),
          _QueuesSection(org: org),
          const _ServicePointsSection(servicePoints: _placeholderServicePoints),
          _MembersSection(org: org, members: members),
        ],
      ),
    );
  }

  Future<void> _editOrg(BuildContext context, ManagedOrganization org) {
    return showDialog<void>(
      context: context,
      builder: (_) => EditOrgDialog(organization: org),
    );
  }
}

/// A titled card grouping one section's content.
class _Section extends StatelessWidget {
  const _Section({required this.title, required this.child, this.action});

  final String title;
  final Widget child;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(title, style: theme.textTheme.titleMedium),
                ),
                ?action,
              ],
            ),
            const SizedBox(height: 8),
            child,
          ],
        ),
      ),
    );
  }
}

Widget _infoRow(String label, String value) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text('$label: $value'),
    );

class _OrgInfoSection extends StatelessWidget {
  const _OrgInfoSection({required this.org});
  final ManagedOrganization org;

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Organization',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _infoRow('Name', org.name.display),
          _infoRow('Address', org.address.display.isEmpty ? '—' : org.address.display),
          _infoRow('Sector', org.sector),
          if (org.subtypeId != null && org.subtypeId! > 0)
            _infoRow('Subtype ID', '${org.subtypeId}'),
          _infoRow('Your role', _roleLabel(org.role)),
          _infoRow('Coordinates', '${org.latitude}, ${org.longitude}'),
          _infoRow('ID', '${org.id}'),
        ],
      ),
    );
  }
}

class _SpecialtiesSection extends StatelessWidget {
  const _SpecialtiesSection({required this.specialties});
  final AsyncValue<List<SpecialtyItem>> specialties;

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Specialties',
      child: switch (specialties) {
        AsyncLoading() => const Text('Loading…'),
        AsyncError(:final error) => Text(
            error is ApiException ? error.message : 'Could not load specialties.',
          ),
        AsyncData(:final value) when value.isEmpty => const Text('No specialties linked.'),
        AsyncData(:final value) => Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              for (final s in value)
                Chip(label: Text(s.displayName)),
            ],
          ),
      },
    );
  }
}

class _OwnerSection extends StatelessWidget {
  const _OwnerSection({required this.org, required this.members});
  final ManagedOrganization org;
  final AsyncValue<List<OrgMember>>? members;

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Owner',
      child: switch (members) {
        null => Text(
            org.role == OrgRole.owner
                ? 'You own this organization.'
                : 'Owner details require member-management permission.',
          ),
        AsyncData(:final value) => _ownerBody(_findOwner(value)),
        AsyncError() => const Text('Could not load the owner.'),
        _ => const Text('Loading…'),
      },
    );
  }

  Widget _ownerBody(OrgMember? owner) {
    if (owner == null) return const Text('No owner found.');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _infoRow('Name', owner.displayName),
        _infoRow('Email', owner.email),
      ],
    );
  }

  OrgMember? _findOwner(List<OrgMember> members) {
    for (final m in members) {
      if (m.isOwner) return m;
    }
    return null;
  }
}

class _QueuesSection extends StatelessWidget {
  const _QueuesSection({required this.org});
  final ManagedOrganization org;

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Queues',
      action: TextButton.icon(
        onPressed: () => _openForm(context, null),
        icon: const Icon(Icons.add),
        label: const Text('Add a new queue'),
      ),
      child: org.queues.isEmpty
          ? const Text('No queues.')
          : Column(
              children: [
                for (final queue in org.queues)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.people_outline),
                    title: Text(queue.name.display),
                    subtitle: Text('${queue.mode} · ${queue.status}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.edit_outlined),
                      tooltip: 'Edit queue',
                      onPressed: () => _openForm(context, queue),
                    ),
                  ),
              ],
            ),
    );
  }

  Future<void> _openForm(BuildContext context, ManagedQueue? queue) async {
    if (queue != null) {
      // Edit existing queue — opens the full-featured edit dialog.
      await showDialog<void>(
        context: context,
        builder: (_) => QueueEditDialog(queue: queue),
      );
    } else {
      // Add new queue — UI-only placeholder for now.
      // TODO(queues): wire Save to `POST /orgs/{orgId}/queues`.
      final messenger = ScaffoldMessenger.of(context);
      final saved = await showDialog<bool>(
        context: context,
        builder: (_) => QueueFormDialog(queue: null),
      );
      if (saved ?? false) {
        messenger.showSnackBar(
          const SnackBar(
            content: Text('Creating queues is not wired to the backend yet.'),
          ),
        );
      }
    }
  }
}

class _ServicePointsSection extends StatelessWidget {
  const _ServicePointsSection({required this.servicePoints});
  final List<({String code, String name, bool active})> servicePoints;

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Service points',
      action: TextButton.icon(
        onPressed: () => _openForm(context, null),
        icon: const Icon(Icons.add),
        label: const Text('Add a service point'),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Placeholder data — not wired to the backend yet.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
          ),
          for (final sp in servicePoints)
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.meeting_room_outlined),
              title: Text('${sp.code} — ${sp.name}'),
              subtitle: Text(sp.active ? 'Active' : 'Inactive'),
              trailing: IconButton(
                icon: const Icon(Icons.edit_outlined),
                tooltip: 'Edit service point',
                onPressed: () => _openForm(context, sp),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _openForm(
    BuildContext context,
    ({String code, String name, bool active})? sp,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    final saved = await showDialog<bool>(
      context: context,
      builder: (_) => ServicePointFormDialog(
        initialCode: sp?.code,
        initialName: sp?.name,
        initialActive: sp?.active ?? true,
      ),
    );
    if (saved ?? false) {
      messenger.showSnackBar(
        const SnackBar(
          content: Text('Service points are not wired to the backend yet.'),
        ),
      );
    }
  }
}

class _MembersSection extends StatelessWidget {
  const _MembersSection({required this.org, required this.members});
  final ManagedOrganization org;
  final AsyncValue<List<OrgMember>>? members;

  @override
  Widget build(BuildContext context) {
    return _Section(
      title: 'Members',
      child: switch (members) {
        null => const Text('You don\'t have permission to manage members.'),
        AsyncData(:final value) => Row(
            children: [
              Expanded(
                child: Text(
                  '${value.length} member${value.length == 1 ? '' : 's'}.',
                ),
              ),
              FilledButton.icon(
                onPressed: () => _openMembers(context),
                icon: const Icon(Icons.group_outlined),
                label: const Text('View members'),
              ),
            ],
          ),
        AsyncError(:final error) => Text(
            error is ApiException ? error.message : 'Could not load members.',
          ),
        _ => const Text('Loading…'),
      },
    );
  }

  void _openMembers(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) =>
            OrgMembersScreen(orgId: org.id, orgName: org.name.display),
      ),
    );
  }
}

String _roleLabel(OrgRole role) => switch (role) {
      OrgRole.owner => 'Owner',
      OrgRole.manager => 'Manager',
      OrgRole.staff => 'Staff',
      OrgRole.unknown => 'Unknown',
    };
