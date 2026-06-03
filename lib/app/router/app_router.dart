import 'package:desktop_turn_management/features/reservations/presentation/screens/reservations_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

/// Named route paths, referenced instead of raw strings.
abstract final class AppRoutes {
  static const String reservations = '/';
}

/// The app's [GoRouter], exposed as a provider so routes can depend on app
/// state (auth, etc.) later and so it can be overridden in tests.
@riverpod
GoRouter goRouter(Ref ref) {
  return GoRouter(
    initialLocation: AppRoutes.reservations,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.reservations,
        builder: (context, state) => const ReservationsScreen(),
      ),
      // Future feature routes register here.
    ],
  );
}
