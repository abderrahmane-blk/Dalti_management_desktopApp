import 'package:desktop_turn_management/app/theme/app_theme.dart';
import 'package:desktop_turn_management/core/config/app_config.dart';
import 'package:desktop_turn_management/features/settings/domain/entities/app_settings.dart';
import 'package:desktop_turn_management/features/settings/presentation/providers/settings_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum _Section {
  language,
  appearance,
  typography,
  about;

  String get label => switch (this) {
        language => 'Language',
        appearance => 'Appearance',
        typography => 'Typography',
        about => 'About',
      };

  IconData get icon => switch (this) {
        language => Icons.language_outlined,
        appearance => Icons.palette_outlined,
        typography => Icons.text_fields_outlined,
        about => Icons.info_outline,
      };
}

/// Full-featured settings dialog — ~90 % height, ~75 % width.
/// Left sidebar picks the active section; right area shows its content.
/// Changes are applied immediately (no "Save" button needed).
class SettingsDialog extends ConsumerStatefulWidget {
  const SettingsDialog({super.key});

  @override
  ConsumerState<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends ConsumerState<SettingsDialog> {
  _Section _section = _Section.language;

  void _update(AppSettings updated) {
    ref.read(settingsProvider.notifier).save(updated);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final settings = switch (ref.watch(settingsProvider)) {
      AsyncData(:final value) => value,
      _ => const AppSettings(),
    };

    return Dialog(
      insetPadding: EdgeInsets.symmetric(
        horizontal: size.width * 0.125,
        vertical: size.height * 0.05,
      ),
      child: SizedBox(
        width: size.width * 0.75,
        height: size.height * 0.9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(context),
            const Divider(height: 1),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildSidebar(context),
                  const VerticalDivider(width: 1),
                  Expanded(
                    child: _buildContent(context, settings),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Settings',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            tooltip: 'Close',
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: 200,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          for (final section in _Section.values)
            ListTile(
              dense: true,
              leading: Icon(section.icon),
              title: Text(section.label),
              selected: _section == section,
              selectedTileColor: colorScheme.secondaryContainer.withValues(alpha: 0.5),
              selectedColor: colorScheme.onSecondaryContainer,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              onTap: () => setState(() => _section = section),
            ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, AppSettings settings) {
    return switch (_section) {
      _Section.language => _buildLanguageSection(context, settings),
      _Section.appearance => _buildAppearanceSection(context, settings),
      _Section.typography => _buildTypographySection(context, settings),
      _Section.about => _buildAboutSection(context),
    };
  }

  // ── Language ───────────────────────────────────────────────────────────────

  Widget _buildLanguageSection(BuildContext context, AppSettings settings) {
    final theme = Theme.of(context);
    final allLangs = ['en', 'fr', 'ar'];
    // Ensure the list always contains all 3 codes.
    final fallback = List<String>.from(settings.languageFallback);
    for (final l in allLangs) {
      if (!fallback.contains(l)) fallback.add(l);
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Language', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 24),

          // Primary language
          Text('Display language', style: theme.textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(
            'The language used when content is available in multiple languages.',
            style: theme.textTheme.bodySmall
                ?.copyWith(color: theme.colorScheme.outline),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            children: [
              for (final lang in allLangs)
                ChoiceChip(
                  label: Text(_langLabel(lang)),
                  selected: settings.primaryLanguage == lang,
                  onSelected: (on) {
                    if (!on) return;
                    // Rebuild fallback with the new primary first.
                    final newFallback = [
                      lang,
                      ...fallback.where((l) => l != lang),
                    ];
                    _update(settings.copyWith(
                      primaryLanguage: lang,
                      languageFallback: newFallback,
                    ));
                  },
                ),
            ],
          ),

          const SizedBox(height: 28),

          // Fallback order
          Text('Fallback order', style: theme.textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(
            'When the preferred language has no content, try these in order.',
            style: theme.textTheme.bodySmall
                ?.copyWith(color: theme.colorScheme.outline),
          ),
          const SizedBox(height: 12),
          ...List.generate(fallback.length, (i) {
            final lang = fallback[i];
            return Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Row(
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.secondaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${i + 1}',
                      style: theme.textTheme.labelMedium?.copyWith(
                        color: theme.colorScheme.onSecondaryContainer,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      _langLabel(lang),
                      style: i == 0
                          ? theme.textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w600)
                          : theme.textTheme.bodyMedium,
                    ),
                  ),
                  if (i > 0)
                    IconButton(
                      icon: const Icon(Icons.arrow_upward, size: 18),
                      tooltip: 'Move up',
                      onPressed: () {
                        final updated = List<String>.from(fallback);
                        final tmp = updated[i - 1];
                        updated[i - 1] = updated[i];
                        updated[i] = tmp;
                        _update(settings.copyWith(
                          primaryLanguage: updated.first,
                          languageFallback: updated,
                        ));
                      },
                    ),
                  if (i < fallback.length - 1)
                    IconButton(
                      icon: const Icon(Icons.arrow_downward, size: 18),
                      tooltip: 'Move down',
                      onPressed: () {
                        final updated = List<String>.from(fallback);
                        final tmp = updated[i + 1];
                        updated[i + 1] = updated[i];
                        updated[i] = tmp;
                        _update(settings.copyWith(
                          primaryLanguage: updated.first,
                          languageFallback: updated,
                        ));
                      },
                    ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  // ── Appearance ─────────────────────────────────────────────────────────────

  Widget _buildAppearanceSection(BuildContext context, AppSettings settings) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Appearance', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 24),

          // Theme mode
          Text('Theme mode', style: theme.textTheme.titleMedium),
          const SizedBox(height: 12),
          Row(
            children: [
              for (final entry in [
                ('light', Icons.light_mode_outlined, 'Light'),
                ('dark', Icons.dark_mode_outlined, 'Dark'),
                ('system', Icons.brightness_auto_outlined, 'System'),
              ])
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: _ThemeModeCard(
                    icon: entry.$2,
                    label: entry.$3,
                    selected: settings.themeMode == entry.$1,
                    onTap: () =>
                        _update(settings.copyWith(themeMode: entry.$1)),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 28),

          // Accent colour
          Text('Accent colour', style: theme.textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(
            'The primary colour used for buttons, chips, and highlights.',
            style: theme.textTheme.bodySmall
                ?.copyWith(color: theme.colorScheme.outline),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              for (final entry in kAccentColors.entries)
                _ColorDot(
                  label: _colorLabel(entry.key),
                  color: entry.value,
                  selected: settings.accentColor == entry.key,
                  onTap: () =>
                      _update(settings.copyWith(accentColor: entry.key)),
                ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Typography ─────────────────────────────────────────────────────────────

  static const List<({String key, String label, String sample})> _fonts = [
    (key: '', label: 'Default (Material)', sample: 'Aa Bb Cc 123'),
    (key: 'Roboto', label: 'Roboto', sample: 'Aa Bb Cc 123'),
    (key: 'Ubuntu', label: 'Ubuntu', sample: 'Aa Bb Cc 123'),
    (key: 'Liberation Sans', label: 'Liberation Sans', sample: 'Aa Bb Cc 123'),
    (key: 'monospace', label: 'Monospace', sample: 'Aa Bb Cc 123'),
  ];

  Widget _buildTypographySection(BuildContext context, AppSettings settings) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Typography', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(
            'Font availability depends on what is installed on your system. '
            'Unavailable fonts silently fall back to the Material default.',
            style: theme.textTheme.bodySmall
                ?.copyWith(color: theme.colorScheme.outline),
          ),
          const SizedBox(height: 24),
          Text('Font family', style: theme.textTheme.titleMedium),
          const SizedBox(height: 12),
          RadioGroup<String>(
            groupValue: settings.fontFamily,
            onChanged: (v) => _update(settings.copyWith(fontFamily: v ?? '')),
            child: Column(
              children: [
                for (final f in _fonts)
                  RadioListTile<String>(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    title: Text(f.label),
                    subtitle: Text(
                      f.sample,
                      style: TextStyle(
                        fontFamily: f.key.isEmpty ? null : f.key,
                        fontSize: 13,
                      ),
                    ),
                    value: f.key,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ── About ──────────────────────────────────────────────────────────────────

  Widget _buildAboutSection(BuildContext context) {
    final theme = Theme.of(context);
    final config = ref.watch(appConfigProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('About', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 24),
          _aboutRow(context, 'Application', 'Reservations Manager'),
          _aboutRow(context, 'Build', 'Development'),
          _aboutRow(context, 'Platform', 'Flutter Desktop'),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 16),
          Text('Developer', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          _aboutRow(context, 'Backend URL', config.baseUrl),
          _aboutRow(
            context,
            'Auth',
            'Dev token (no login screen yet)',
          ),
        ],
      ),
    );
  }

  Widget _aboutRow(BuildContext context, String label, String value) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: theme.textTheme.bodyMedium
                  ?.copyWith(color: theme.colorScheme.outline),
            ),
          ),
          Expanded(child: Text(value, style: theme.textTheme.bodyMedium)),
        ],
      ),
    );
  }
}

// ── Helpers ───────────────────────────────────────────────────────────────────

String _langLabel(String code) => switch (code) {
      'ar' => 'العربية (AR)',
      'fr' => 'Français (FR)',
      _ => 'English (EN)',
    };

String _colorLabel(String key) => switch (key) {
      'teal' => 'Teal',
      'green' => 'Green',
      'purple' => 'Purple',
      'orange' => 'Orange',
      _ => 'Blue',
    };

// ── Small helper widgets ──────────────────────────────────────────────────────

class _ThemeModeCard extends StatelessWidget {
  const _ThemeModeCard({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 100,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selected
                ? colorScheme.primary
                : colorScheme.outlineVariant,
            width: selected ? 2 : 1,
          ),
          color: selected
              ? colorScheme.primaryContainer.withValues(alpha: 0.4)
              : null,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
                color: selected ? colorScheme.primary : colorScheme.onSurface),
            const SizedBox(height: 8),
            Text(
              label,
              style: theme.textTheme.labelMedium?.copyWith(
                color:
                    selected ? colorScheme.primary : colorScheme.onSurface,
                fontWeight:
                    selected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorDot extends StatelessWidget {
  const _ColorDot({
    required this.color,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final Color color;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Tooltip(
      message: label,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected
                      ? Theme.of(context).colorScheme.onSurface
                      : Colors.transparent,
                  width: 3,
                ),
                boxShadow: selected
                    ? [
                        BoxShadow(
                          color: color.withValues(alpha: 0.5),
                          blurRadius: 8,
                          spreadRadius: 1,
                        ),
                      ]
                    : null,
              ),
              child: selected
                  ? const Icon(Icons.check, color: Colors.white, size: 20)
                  : null,
            ),
            const SizedBox(height: 4),
            Text(label, style: theme.textTheme.labelSmall),
          ],
        ),
      ),
    );
  }
}
