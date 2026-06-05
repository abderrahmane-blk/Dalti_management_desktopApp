import 'package:desktop_turn_management/features/settings/domain/entities/app_settings.dart';
import 'package:flutter/material.dart';

/// Named accent-colour presets. Keys match [AppSettings.accentColor].
const Map<String, Color> kAccentColors = {
  'blue': Color(0xFF2A6F97),
  'teal': Color(0xFF00796B),
  'green': Color(0xFF388E3C),
  'purple': Color(0xFF7B1FA2),
  'orange': Color(0xFFE64A19),
};

abstract final class AppTheme {
  /// Default light theme used before settings have loaded.
  static ThemeData get light =>
      _build(Brightness.light, kAccentColors['blue']!, null);

  /// Builds a [ThemeData] from [settings].
  ///
  /// Pass [brightnessOverride] to force a specific brightness (used when
  /// supplying both `theme` and `darkTheme` to [MaterialApp] so the OS
  /// can switch between them).
  static ThemeData fromSettings(
    AppSettings settings, {
    Brightness? brightnessOverride,
  }) {
    final brightness = brightnessOverride ??
        switch (settings.themeMode) {
          'dark' => Brightness.dark,
          'system' =>
            WidgetsBinding.instance.platformDispatcher.platformBrightness,
          _ => Brightness.light,
        };
    final seed = kAccentColors[settings.accentColor] ?? kAccentColors['blue']!;
    final font = settings.fontFamily.isEmpty ? null : settings.fontFamily;
    return _build(brightness, seed, font);
  }

  static ThemeData _build(Brightness brightness, Color seed, String? fontFamily) =>
      ThemeData(
        useMaterial3: true,
        brightness: brightness,
        colorScheme: ColorScheme.fromSeed(seedColor: seed, brightness: brightness),
        fontFamily: fontFamily,
      );
}
