import 'package:desktop_turn_management/app/router/app_router.dart';
import 'package:desktop_turn_management/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Root widget. `ProviderScope` is installed in `main.dart`, above this.
class ReservationsManagerApp extends ConsumerWidget {
  const ReservationsManagerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      title: 'Reservations Manager',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      themeMode: ThemeMode.light,
      routerConfig: router,
    );
  }
}
