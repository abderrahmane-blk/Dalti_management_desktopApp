import 'package:desktop_turn_management/app/router/app_router.dart';
import 'package:desktop_turn_management/features/home/presentation/widgets/home_sidebar.dart';
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

  /// Label of the destination currently shown in the content area, or `null`
  /// for the default landing placeholder.
  String? _activeTitle;

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
            onSelect: (title) => setState(() => _activeTitle = title),
            onSettings: () => setState(() => _activeTitle = 'Settings'),
            onLogout: () {
              ref.read(selectedWorkspaceProvider.notifier).clear();
              context.go(AppRoutes.login);
            },
            onHandleSomethingElse: () {
              ref.read(selectedWorkspaceProvider.notifier).clear();
              context.go(AppRoutes.workspaceSelection);
            },
          ),
          Expanded(
            child: _PlaceholderContent(
              title: _activeTitle,
              organizationName: organization.name.display,
              role: roleLabel(organization.role),
            ),
          ),
        ],
      ),
    );
  }
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
