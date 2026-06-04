import 'package:desktop_turn_management/features/home/presentation/models/home_destination.dart';
import 'package:desktop_turn_management/features/workspaces/domain/entities/workspace.dart';
import 'package:flutter/material.dart';

/// The home shell's left navigation. It never disappears — it just narrows to
/// an icon rail and expands back to full labels + nested items.
///
/// Sections:
///  * Queues — one expandable entry per queue → Today / History /
///    Register a walk-in / Accept future reservations.
///  * Organization → Edit organization / Statistics.
///  * Pinned at the bottom: Logout, Settings, Handle something else.
///
/// The actual destination screens are not built yet; selecting a leaf reports
/// its label via [onSelect] and the home screen shows a placeholder.
class HomeSidebar extends StatelessWidget {
  const HomeSidebar({
    super.key,
    required this.organization,
    required this.expanded,
    required this.onToggle,
    required this.onSelect,
    required this.onSettings,
    required this.onLogout,
    required this.onHandleSomethingElse,
  });

  final ManagedOrganization organization;
  final bool expanded;
  final VoidCallback onToggle;

  /// Called with the chosen destination (the Today board, or a placeholder).
  final ValueChanged<HomeDestination> onSelect;
  final VoidCallback onSettings;
  final VoidCallback onLogout;
  final VoidCallback onHandleSomethingElse;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
      width: expanded ? 280 : 72,
      decoration: BoxDecoration(
        border: Border(
          right: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: expanded ? _expandedBody(context) : _narrowBody(context),
    );
  }

  Widget _expandedBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          leading: IconButton(
            icon: const Icon(Icons.menu_open),
            tooltip: 'Collapse',
            onPressed: onToggle,
          ),
          title: Text(
            organization.name.display,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const Divider(height: 1),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const _SectionHeader('Queues'),
              if (organization.queues.isEmpty)
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 8),
                  child: Text('No queues.'),
                ),
              for (final queue in organization.queues)
                ExpansionTile(
                  leading: const Icon(Icons.people_outline),
                  title: Text(
                    queue.name.display,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  childrenPadding: const EdgeInsets.only(left: 16),
                  children: [
                    ListTile(
                      dense: true,
                      title: const Text('Today'),
                      onTap: () => onSelect(QueueTodayDestination(queue)),
                    ),
                    ListTile(
                      dense: true,
                      title: const Text('History'),
                      onTap: () => onSelect(QueueHistoryDestination(queue)),
                    ),
                    ListTile(
                      dense: true,
                      title: const Text('Register a walk-in'),
                      onTap: () => onSelect(QueueWalkInDestination(queue)),
                    ),
                    ListTile(
                      dense: true,
                      title: const Text('Accept future reservations'),
                      onTap: () => onSelect(QueueFutureDestination(queue)),
                    ),
                  ],
                ),
              const Divider(height: 1),
              const _SectionHeader('Organization'),
              ExpansionTile(
                leading: const Icon(Icons.business_outlined),
                title: Text(
                  organization.name.display,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                childrenPadding: const EdgeInsets.only(left: 16),
                children: [
                  ListTile(
                    dense: true,
                    title: const Text('Edit organization'),
                    onTap: () => onSelect(const OrgEditDestination()),
                  ),
                  ListTile(
                    dense: true,
                    title: const Text('Statistics'),
                    onTap: () => onSelect(const OrgStatisticsDestination()),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: onLogout,
        ),
        ListTile(
          leading: const Icon(Icons.settings_outlined),
          title: const Text('Settings'),
          onTap: onSettings,
        ),
        ListTile(
          leading: const Icon(Icons.swap_horiz),
          title: const Text('Handle something else'),
          onTap: onHandleSomethingElse,
        ),
      ],
    );
  }

  Widget _narrowBody(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Expand',
          onPressed: onToggle,
        ),
        const Divider(height: 1),
        IconButton(
          icon: const Icon(Icons.people_outline),
          tooltip: 'Queues',
          onPressed: onToggle,
        ),
        IconButton(
          icon: const Icon(Icons.business_outlined),
          tooltip: 'Organization',
          onPressed: onToggle,
        ),
        const Spacer(),
        const Divider(height: 1),
        IconButton(
          icon: const Icon(Icons.logout),
          tooltip: 'Logout',
          onPressed: onLogout,
        ),
        IconButton(
          icon: const Icon(Icons.settings_outlined),
          tooltip: 'Settings',
          onPressed: onSettings,
        ),
        IconButton(
          icon: const Icon(Icons.swap_horiz),
          tooltip: 'Handle something else',
          onPressed: onHandleSomethingElse,
        ),
      ],
    );
  }

}

/// A permanent, prominent section label (e.g. "Queues", "Organization"). It is
/// not collapsible — it always stays open and groups the expandable entries
/// below it, so a section reads clearly as a section rather than as one of its
/// entries.
class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 6),
      child: Text(
        label,
        style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: theme.colorScheme.primary,
            ),
      ),
    );
  }
}
