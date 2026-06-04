import 'package:desktop_turn_management/app/router/app_router.dart';
import 'package:desktop_turn_management/features/home/presentation/models/home_destination.dart';
import 'package:desktop_turn_management/features/home/presentation/widgets/home_sidebar.dart';
import 'package:desktop_turn_management/features/queue_board/presentation/screens/today_screen.dart';
import 'package:desktop_turn_management/features/walk_in/presentation/screens/walk_in_screen.dart';
import 'package:desktop_turn_management/features/workspaces/domain/entities/workspace.dart';
import 'package:desktop_turn_management/features/workspaces/presentation/providers/selected_workspace.dart';
import 'package:desktop_turn_management/features/workspaces/presentation/screens/workspace_selection_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// The home shell: the expandable [HomeSidebar] plus a content area that, for
/// now, shows a placeholder naming the selected destination. The per-button
/// screens are intentionally not implemented yet.
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _expanded = true;

  /// The destination currently shown in the content area, or `null` for the
  /// default landing placeholder.
  HomeDestination? _destination;

  @override
  Widget build(BuildContext context) {
    final organization = ref.watch(selectedWorkspaceProvider);

    // Guard: reached without a chosen workspace (e.g. deep link / hot reload).
    if (organization == null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('No workspace selected.'),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => context.go(AppRoutes.workspaceSelection),
                child: const Text('Choose what to manage'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Row(
        children: [
          HomeSidebar(
            organization: organization,
            expanded: _expanded,
            onToggle: () => setState(() => _expanded = !_expanded),
            onSelect: (destination) =>
                setState(() => _destination = destination),
            onSettings: () =>
                setState(() => _destination = const SettingsDestination()),
            onLogout: () {
              ref.read(selectedWorkspaceProvider.notifier).clear();
              context.go(AppRoutes.login);
            },
            onHandleSomethingElse: () {
              ref.read(selectedWorkspaceProvider.notifier).clear();
              context.go(AppRoutes.workspaceSelection);
            },
          ),
          Expanded(child: _content(organization)),
        ],
      ),
    );
  }

  /// Maps the selected destination to its screen. Only the Today board is real;
  /// the rest render a placeholder naming the screen.
  Widget _content(ManagedOrganization organization) {
    final destination = _destination;
    return switch (destination) {
      null => _PlaceholderContent(
          title: null,
          organizationName: organization.name.display,
          role: roleLabel(organization.role),
        ),
      QueueTodayDestination(:final queue) => TodayScreen(
          queueId: queue.id,
          queueName: queue.name.display,
          onRegisterWalkIn: () =>
              setState(() => _destination = QueueWalkInDestination(queue)),
        ),
      QueueWalkInDestination(:final queue) => WalkInScreen(
          queueId: queue.id,
          queueName: queue.name.display,
          queueMode: queue.mode,
          onDone: () =>
              setState(() => _destination = QueueTodayDestination(queue)),
        ),
      _ => _PlaceholderContent(
          title: _titleFor(destination),
          organizationName: organization.name.display,
          role: roleLabel(organization.role),
        ),
    };
  }

  String _titleFor(HomeDestination destination) => switch (destination) {
        QueueTodayDestination(:final queue) => '${queue.name.display} — Today',
        QueueHistoryDestination(:final queue) =>
          '${queue.name.display} — History',
        QueueWalkInDestination(:final queue) =>
          '${queue.name.display} — Register a walk-in',
        QueueFutureDestination(:final queue) =>
          '${queue.name.display} — Accept future reservations',
        OrgEditDestination() => 'Edit organization',
        OrgStatisticsDestination() => 'Statistics',
        SettingsDestination() => 'Settings',
      };
}

/// Centered placeholder naming the current screen — stands in until the real
/// destination screens are built.
class _PlaceholderContent extends StatelessWidget {
  const _PlaceholderContent({
    required this.title,
    required this.organizationName,
    required this.role,
  });

  final String? title;
  final String organizationName;
  final String role;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title ?? 'Managing $organizationName ($role)',
            style: theme.textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            title == null
                ? 'Pick a destination from the sidebar.'
                : 'This screen is not implemented yet.',
            style: theme.textTheme.bodyMedium
                ?.copyWith(color: theme.colorScheme.outline),
          ),
        ],
      ),
    );
  }
}
