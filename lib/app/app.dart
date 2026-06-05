import 'package:desktop_turn_management/app/router/app_router.dart';
import 'package:desktop_turn_management/app/theme/app_theme.dart';
import 'package:desktop_turn_management/features/settings/domain/entities/app_settings.dart';
import 'package:desktop_turn_management/features/settings/presentation/providers/settings_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Root widget. `ProviderScope` is installed in `main.dart`, above this.
class ReservationsManagerApp extends ConsumerWidget {
  const ReservationsManagerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);
    final settings = switch (ref.watch(settingsProvider)) {
      AsyncData(:final value) => value,
      _ => const AppSettings(),
    };

    final lightTheme =
        AppTheme.fromSettings(settings, brightnessOverride: Brightness.light);
    final darkTheme =
        AppTheme.fromSettings(settings, brightnessOverride: Brightness.dark);

    final themeMode = switch (settings.themeMode) {
      'dark' => ThemeMode.dark,
      'system' => ThemeMode.system,
      _ => ThemeMode.light,
    };

    return MaterialApp.router(
      title: 'Reservations Manager',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}
