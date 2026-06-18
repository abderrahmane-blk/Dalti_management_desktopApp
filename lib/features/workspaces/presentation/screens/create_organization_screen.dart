import 'package:desktop_turn_management/app/router/app_router.dart';
import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/catalog_items.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/org_create_draft.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/org_edit_draft.dart';
import 'package:desktop_turn_management/features/organization/presentation/providers/organization_providers.dart';
import 'package:desktop_turn_management/features/workspaces/domain/entities/workspace.dart';
import 'package:desktop_turn_management/features/workspaces/presentation/providers/selected_workspace.dart';
import 'package:desktop_turn_management/features/workspaces/presentation/providers/workspaces_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/// Form to create a new organization (`POST /orgs`). The signed-in user becomes
/// the owner. On success it refreshes the workspace list, selects the new org,
/// and proceeds to the home shell.
class CreateOrganizationScreen extends ConsumerStatefulWidget {
  const CreateOrganizationScreen({super.key});

  @override
  ConsumerState<CreateOrganizationScreen> createState() =>
      _CreateOrganizationScreenState();
}

class _CreateOrganizationScreenState
    extends ConsumerState<CreateOrganizationScreen> {
  final _formKey = GlobalKey<FormState>();

  int _sector = 1; // Private by default
  int? _subtypeId;

  final _latitude = TextEditingController(text: '36.3794');
  final _longitude = TextEditingController(text: '6.4678');

  final _enName = TextEditingController();
  final _enAddr = TextEditingController();
  final _frName = TextEditingController();
  final _frAddr = TextEditingController();
  final _arName = TextEditingController();
  final _arAddr = TextEditingController();

  // Subtype catalog (loaded async).
  bool _loadingSubtypes = true;
  String? _subtypesError;
  List<OrgSubtypeItem> _subtypes = [];

  bool _saving = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _fetchSubtypes());
  }

  @override
  void dispose() {
    for (final c in [
      _latitude,
      _longitude,
      _enName,
      _enAddr,
      _frName,
      _frAddr,
      _arName,
      _arAddr,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  Future<void> _fetchSubtypes() async {
    if (!mounted) return;
    setState(() {
      _loadingSubtypes = true;
      _subtypesError = null;
    });
    final result =
        await ref.read(organizationRepositoryProvider).fetchOrgSubtypes();
    if (!mounted) return;
    setState(() {
      _loadingSubtypes = false;
      switch (result) {
        case Ok(:final value):
          _subtypes = value;
        case Err(:final error):
          _subtypesError = error.message;
      }
    });
  }

  Future<void> _save() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    final messenger = ScaffoldMessenger.of(context);

    final hasAnyName = _enName.text.trim().isNotEmpty ||
        _frName.text.trim().isNotEmpty ||
        _arName.text.trim().isNotEmpty;
    if (!hasAnyName) {
      messenger.showSnackBar(
        const SnackBar(content: Text('Enter a name in at least one language.')),
      );
      return;
    }

    setState(() => _saving = true);

    final draft = OrgCreateDraft(
      sector: _sector,
      subtypeId: _subtypeId,
      latitude: double.tryParse(_latitude.text.trim()) ?? 0,
      longitude: double.tryParse(_longitude.text.trim()) ?? 0,
      en: OrgTranslationDraft(
          name: _enName.text.trim(), address: _enAddr.text.trim()),
      fr: OrgTranslationDraft(
          name: _frName.text.trim(), address: _frAddr.text.trim()),
      ar: OrgTranslationDraft(
          name: _arName.text.trim(), address: _arAddr.text.trim()),
    );

    final result =
        await ref.read(organizationRepositoryProvider).createOrg(draft);

    if (!mounted) return;

    if (result case Err(:final error)) {
      setState(() => _saving = false);
      messenger.showSnackBar(SnackBar(content: Text(error.message)));
      return;
    }

    final newId = (result as Ok<int>).value;

    // The creator is the org's owner, so we can build the selection locally
    // from what we just submitted — no blocking refetch (which would stall:
    // `workspacesProvider` is auto-dispose and nothing is watching it here).
    // This makes it instant, exactly like picking an existing org. The
    // selection list refetches the authoritative data next time it's shown.
    final created = ManagedOrganization(
      id: newId,
      sector: _sector == 1 ? 'Private' : 'Public',
      subtypeId:
          (_subtypeId != null && _subtypeId! > 0) ? _subtypeId : null,
      latitude: double.tryParse(_latitude.text.trim()) ?? 0,
      longitude: double.tryParse(_longitude.text.trim()) ?? 0,
      role: OrgRole.owner,
      // Owner — full permission mask (see MemberPreset.owner = 511).
      orgPermissions: 511,
      name: L10n(
        ar: _arName.text.trim(),
        en: _enName.text.trim(),
        fr: _frName.text.trim(),
      ),
      address: L10n(
        ar: _arAddr.text.trim(),
        en: _enAddr.text.trim(),
        fr: _frAddr.text.trim(),
      ),
      queues: const [],
    );

    ref.read(selectedWorkspaceProvider.notifier).select(created);
    // Drop the cached workspace list so the selection screen refetches (and
    // shows the new org) whenever it is next opened.
    ref.invalidate(workspacesProvider);

    messenger.showSnackBar(
      const SnackBar(content: Text('Organization created.')),
    );
    context.go(AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create organization')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            // ── Type & sector ───────────────────────────────────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: DropdownButtonFormField<int>(
                    initialValue: _sector,
                    decoration: const InputDecoration(
                      labelText: 'Sector',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    items: const [
                      DropdownMenuItem(value: 0, child: Text('Public')),
                      DropdownMenuItem(value: 1, child: Text('Private')),
                    ],
                    onChanged: (v) => setState(() => _sector = v ?? _sector),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(child: _subtypeField()),
              ],
            ),
            const SizedBox(height: 16),

            // ── Coordinates ─────────────────────────────────────────────
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _latitude,
                    decoration: const InputDecoration(
                      labelText: 'Latitude',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true, signed: true),
                    validator: _numberValidator,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _longitude,
                    decoration: const InputDecoration(
                      labelText: 'Longitude',
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true, signed: true),
                    validator: _numberValidator,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // ── Translations ────────────────────────────────────────────
            Text(
              'At least one language is required.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
            ),
            const SizedBox(height: 12),
            _langGroup(label: 'English (EN)', nameCtrl: _enName, addrCtrl: _enAddr),
            const SizedBox(height: 12),
            _langGroup(label: 'Français (FR)', nameCtrl: _frName, addrCtrl: _frAddr),
            const SizedBox(height: 12),
            _langGroup(
              label: 'العربية (AR)',
              nameCtrl: _arName,
              addrCtrl: _arAddr,
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: _saving ? null : _save,
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
              ),
              child: _saving
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Create organization'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _subtypeField() {
    if (_loadingSubtypes) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: LinearProgressIndicator(),
      );
    }
    if (_subtypesError != null) {
      return Row(
        children: [
          Expanded(
            child: Text(
              'Subtypes unavailable',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
          TextButton(onPressed: _fetchSubtypes, child: const Text('Retry')),
        ],
      );
    }
    return DropdownButtonFormField<int?>(
      initialValue: _subtypeId,
      decoration: const InputDecoration(
        labelText: 'Type',
        border: OutlineInputBorder(),
        isDense: true,
      ),
      items: [
        const DropdownMenuItem<int?>(value: null, child: Text('— None —')),
        for (final st in _subtypes)
          DropdownMenuItem<int?>(value: st.id, child: Text(st.displayName)),
      ],
      onChanged: (v) => setState(() => _subtypeId = v),
    );
  }

  String? _numberValidator(String? value) {
    if (value == null || value.trim().isEmpty) return 'Required';
    return double.tryParse(value.trim()) == null ? 'Invalid number' : null;
  }

  Widget _langGroup({
    required String label,
    required TextEditingController nameCtrl,
    required TextEditingController addrCtrl,
    TextDirection textDirection = TextDirection.ltr,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(height: 8),
        TextFormField(
          controller: nameCtrl,
          textDirection: textDirection,
          decoration: const InputDecoration(
            labelText: 'Name',
            isDense: true,
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: addrCtrl,
          textDirection: textDirection,
          decoration: const InputDecoration(
            labelText: 'Address',
            isDense: true,
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
