import 'package:desktop_turn_management/app/router/app_router.dart';
import 'package:desktop_turn_management/core/network/api_exception.dart';
import 'package:desktop_turn_management/features/workspaces/domain/entities/workspace.dart';
import 'package:desktop_turn_management/features/workspaces/presentation/providers/selected_workspace.dart';
import 'package:desktop_turn_management/features/workspaces/presentation/providers/workspaces_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Screen 2: the user picks which organization to manage. A user may own
/// several orgs and be staff in others (`GET /me/workspaces`), so the choice is
/// explicit. Selecting one registers it and proceeds to the home shell.
class WorkspaceSelectionScreen extends ConsumerWidget {
  const WorkspaceSelectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workspaces = ref.watch(workspacesProvider);
    final notifier = ref.read(workspacesProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose what to manage'),
        actions: [
          TextButton.icon(
            onPressed: () => context.go(AppRoutes.createOrganization),
            icon: const Icon(Icons.add_business_outlined),
            label: const Text('Create organization'),
          ),
          TextButton(
            onPressed: notifier.refresh,
            child: const Text('Refresh'),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: workspaces.when(
        data: (workspace) {
          final orgs = workspace.organizations;
          if (orgs.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('You have no organizations to manage.'),
                  const SizedBox(height: 12),
                  FilledButton.icon(
                    onPressed: () =>
                        context.go(AppRoutes.createOrganization),
                    icon: const Icon(Icons.add_business_outlined),
                    label: const Text('Create an organization'),
                  ),
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: orgs.length,
            itemBuilder: (_, i) => _OrganizationTile(organization: orgs[i]),
          );
        },
        loading: () => const Center(child: Text('Loading…')),
        error: (error, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                error is ApiException ? error.message : 'Something went wrong.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: notifier.refresh,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OrganizationTile extends ConsumerWidget {
  const _OrganizationTile({required this.organization});

  final ManagedOrganization organization;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queueCount = organization.queues.length;
    return ListTile(
      title: Text(organization.name.display),
      subtitle: Text(
        '${roleLabel(organization.role)} · '
        '$queueCount queue${queueCount == 1 ? '' : 's'}',
      ),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        ref.read(selectedWorkspaceProvider.notifier).select(organization);
        context.go(AppRoutes.home);
      },
    );
  }
}

/// Human label for an [OrgRole].
String roleLabel(OrgRole role) => switch (role) {
      OrgRole.owner => 'Owner',
      OrgRole.manager => 'Manager',
      OrgRole.staff => 'Staff',
      OrgRole.unknown => 'Member',
    };
