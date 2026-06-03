import 'package:flutter/material.dart';

/// Minimal light theme. The UI is intentionally bare for now (mostly text) so
/// effort stays on functionality; styling can grow here later without touching
/// screens. Light-only by design at this stage.
abstract final class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2A6F97),
          brightness: Brightness.light,
        ),
      );
}
