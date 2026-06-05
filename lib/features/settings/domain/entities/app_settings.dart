import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

/// Persisted user preferences. Stored as a single JSON blob under the key
/// `app_settings` in [KeyValueStore].
///
/// Defaults reflect the original hardcoded behaviour so that a fresh install
/// feels unchanged until the user edits something.
@freezed
abstract class AppSettings with _$AppSettings {
  const AppSettings._();

  const factory AppSettings({
    /// ISO 639-1 language code the user prefers: `'en'`, `'fr'`, or `'ar'`.
    @Default('en') String primaryLanguage,

    /// Full preferred order used by [L10n.displayWith] when falling back.
    /// Always contains exactly the three supported codes.
    @Default(['en', 'fr', 'ar']) List<String> languageFallback,

    /// `'light'` | `'dark'` | `'system'`
    @Default('light') String themeMode,

    /// Named accent-colour preset: `'blue'` (default) | `'teal'` | `'green'`
    /// | `'purple'` | `'orange'`
    @Default('blue') String accentColor,

    /// Font-family name passed to [ThemeData.fontFamily].
    /// Empty string means the Material default.
    @Default('') String fontFamily,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);
}
