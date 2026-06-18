import 'package:desktop_turn_management/features/auth/presentation/screens/login_screen.dart';
import 'package:desktop_turn_management/features/home/presentation/screens/home_screen.dart';
import 'package:desktop_turn_management/features/reservations/presentation/screens/reservations_screen.dart';
import 'package:desktop_turn_management/features/workspaces/presentation/screens/create_organization_screen.dart';
import 'package:desktop_turn_management/features/workspaces/presentation/screens/workspace_selection_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

/// Named route paths, referenced instead of raw strings.
abstract final class AppRoutes {
  /// Dev login gate — "Continue as `<name>`".
  static const String login = '/login';

  /// Screen 2 — choose which organization to manage.
  static const String workspaceSelection = '/select';

  /// Form to create a brand-new organization (reached from selection).
  static const String createOrganization = '/select/create';

  /// The home shell (sidebar + content) for the chosen organization.
  static const String home = '/home';

  /// Reference reservations screen — the template slice, not yet wired into the
  /// main flow (a queue's "Today" will host it later).
  static const String reservations = '/reservations';
}

/// The app's [GoRouter], exposed as a provider so routes can depend on app
/// state and be overridden in tests.
///
/// The flow is imperative: the login button navigates to selection, picking an
/// organization navigates to home, and "Logout" / "Handle something else"
/// navigate back. The home screen self-guards against being reached without a
/// selected workspace.
@riverpod
GoRouter goRouter(Ref ref) {
  return GoRouter(
    initialLocation: AppRoutes.login,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: AppRoutes.workspaceSelection,
        builder: (context, state) => const WorkspaceSelectionScreen(),
      ),
      GoRoute(
        path: AppRoutes.createOrganization,
        builder: (context, state) => const CreateOrganizationScreen(),
      ),
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoutes.reservations,
        builder: (context, state) => const ReservationsScreen(),
      ),
    ],
  );
}
