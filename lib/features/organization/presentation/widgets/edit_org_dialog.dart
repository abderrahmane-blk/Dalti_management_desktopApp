import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/catalog_items.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/org_edit_draft.dart';
import 'package:desktop_turn_management/features/organization/presentation/providers/org_specialties_notifier.dart';
import 'package:desktop_turn_management/features/organization/presentation/providers/organization_providers.dart';
import 'package:desktop_turn_management/features/workspaces/domain/entities/workspace.dart';
import 'package:desktop_turn_management/features/workspaces/presentation/providers/selected_workspace.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Full organization-edit dialog — 90 % of the viewport height, ~75 % width.
/// Two sections:
///   1. Info (sector, subtype, EN/FR/AR name + address) → `PUT /orgs/{id}`
///   2. Specialties (toggle from the global catalog) → `POST/DELETE` per change
class EditOrgDialog extends ConsumerStatefulWidget {
  const EditOrgDialog({super.key, required this.organization});

  final ManagedOrganization organization;

  @override
  ConsumerState<EditOrgDialog> createState() => _EditOrgDialogState();
}

class _EditOrgDialogState extends ConsumerState<EditOrgDialog> {
  // ── Info (pre-filled immediately) ────────────────────────────────────────
  late int _sector;
  int? _subtypeId;

  late final TextEditingController _enName;
  late final TextEditingController _enAddr;
  late final TextEditingController _frName;
  late final TextEditingController _frAddr;
  late final TextEditingController _arName;
  late final TextEditingController _arAddr;

  bool _savingInfo = false;

  // ── Catalog & specialties (loaded async) ─────────────────────────────────
  bool _loadingCatalog = true;
  String? _catalogError;

  List<SpecialtyItem> _allSpecialties = [];
  List<OrgSubtypeItem> _allSubtypes = [];

  /// Specialty ids already linked when the dialog opened.
  Set<int> _originalLinkedIds = {};

  /// Working set the user sees / edits — starts equal to [_originalLinkedIds].
  Set<int> _selectedIds = {};

  bool _savingSpecialties = false;

  @override
  void initState() {
    super.initState();
    final org = widget.organization;
    _sector = org.sector.toLowerCase() == 'private' ? 1 : 0;
    _subtypeId = org.subtypeId;

    _enName = TextEditingController(text: org.name.en);
    _enAddr = TextEditingController(text: org.address.en);
    _frName = TextEditingController(text: org.name.fr);
    _frAddr = TextEditingController(text: org.address.fr);
    _arName = TextEditingController(text: org.name.ar);
    _arAddr = TextEditingController(text: org.address.ar);

    WidgetsBinding.instance.addPostFrameCallback((_) => _fetchCatalog());
  }

  @override
  void dispose() {
    for (final c in [_enName, _enAddr, _frName, _frAddr, _arName, _arAddr]) {
      c.dispose();
    }
    super.dispose();
  }

  // ── Data fetching ─────────────────────────────────────────────────────────

  Future<void> _fetchCatalog() async {
    if (!mounted) return;
    setState(() {
      _loadingCatalog = true;
      _catalogError = null;
    });

    final repo = ref.read(organizationRepositoryProvider);
    final orgId = widget.organization.id;

    final results = await Future.wait([
      repo.fetchAllSpecialties(),
      repo.fetchOrgSubtypes(),
      repo.fetchOrgSpecialties(orgId),
    ]);

    if (!mounted) return;

    final specialtiesResult = results[0] as Result<List<SpecialtyItem>>;
    final subtypesResult = results[1] as Result<List<OrgSubtypeItem>>;
    final orgSpecialtiesResult = results[2] as Result<List<SpecialtyItem>>;

    if (specialtiesResult case Err(:final error)) {
      setState(() {
        _loadingCatalog = false;
        _catalogError = error.message;
      });
      return;
    }
    if (subtypesResult case Err(:final error)) {
      setState(() {
        _loadingCatalog = false;
        _catalogError = error.message;
      });
      return;
    }
    if (orgSpecialtiesResult case Err(:final error)) {
      setState(() {
        _loadingCatalog = false;
        _catalogError = error.message;
      });
      return;
    }

    final linked = (orgSpecialtiesResult as Ok<List<SpecialtyItem>>).value
        .map((s) => s.id)
        .toSet();

    setState(() {
      _allSpecialties = (specialtiesResult as Ok<List<SpecialtyItem>>).value;
      _allSubtypes = (subtypesResult as Ok<List<OrgSubtypeItem>>).value;
      _originalLinkedIds = Set.from(linked);
      _selectedIds = Set.from(linked);
      _loadingCatalog = false;
    });
  }

  // ── Save info ─────────────────────────────────────────────────────────────

  Future<void> _saveInfo() async {
    final messenger = ScaffoldMessenger.of(context);
    setState(() => _savingInfo = true);

    final draft = OrgEditDraft(
      sector: _sector,
      subtypeId: _subtypeId,
      en: OrgTranslationDraft(name: _enName.text.trim(), address: _enAddr.text.trim()),
      fr: OrgTranslationDraft(name: _frName.text.trim(), address: _frAddr.text.trim()),
      ar: OrgTranslationDraft(name: _arName.text.trim(), address: _arAddr.text.trim()),
    );

    final result = await ref
        .read(organizationRepositoryProvider)
        .updateOrg(widget.organization.id, draft);

    if (!mounted) return;
    setState(() => _savingInfo = false);

    if (result case Err(:final error)) {
      messenger.showSnackBar(SnackBar(content: Text(error.message)));
      return;
    }

    // Reflect locally so the sidebar + org screen update without a refetch.
    final org = ref.read(selectedWorkspaceProvider);
    if (org != null) {
      ref.read(selectedWorkspaceProvider.notifier).select(
            org.copyWith(
              sector: _sector == 1 ? 'Private' : 'Public',
              subtypeId: _subtypeId,
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
            ),
          );
    }

    messenger.showSnackBar(const SnackBar(content: Text('Organization info saved.')));
  }

  // ── Save specialties ──────────────────────────────────────────────────────

  Future<void> _saveSpecialties() async {
    final messenger = ScaffoldMessenger.of(context);
    setState(() => _savingSpecialties = true);

    final repo = ref.read(organizationRepositoryProvider);
    final orgId = widget.organization.id;

    final toLink = _selectedIds.difference(_originalLinkedIds);
    final toUnlink = _originalLinkedIds.difference(_selectedIds);

    final errors = <String>[];

    for (final id in toLink) {
      final r = await repo.linkSpecialty(orgId, id);
      if (r case Err(:final error)) errors.add(error.message);
    }
    for (final id in toUnlink) {
      final r = await repo.unlinkSpecialty(orgId, id);
      if (r case Err(:final error)) errors.add(error.message);
    }

    if (!mounted) return;
    setState(() {
      _savingSpecialties = false;
      if (errors.isEmpty) {
        _originalLinkedIds = Set.from(_selectedIds);
      }
    });

    if (errors.isNotEmpty) {
      messenger.showSnackBar(SnackBar(content: Text(errors.join('\n'))));
    } else {
      // Invalidate the org specialties provider so the org screen refreshes.
      ref.invalidate(orgSpecialtiesProvider(orgId));
      messenger.showSnackBar(const SnackBar(content: Text('Specialties saved.')));
    }
  }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
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
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildInfoSection(context),
                    const SizedBox(height: 24),
                    _buildSpecialtiesSection(context),
                  ],
                ),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Edit Organization',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  widget.organization.name.display,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
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

  // ── Info section ──────────────────────────────────────────────────────────

  Widget _buildInfoSection(BuildContext context) {
    return _SectionCard(
      title: 'Organization Info',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
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
              Expanded(
                child: _loadingCatalog
                    ? const LinearProgressIndicator()
                    : _allSubtypes.isEmpty
                        ? const Text('No subtypes available.')
                        : DropdownButtonFormField<int?>(
                            initialValue: _subtypeId,
                            decoration: const InputDecoration(
                              labelText: 'Type',
                              border: OutlineInputBorder(),
                              isDense: true,
                            ),
                            items: [
                              const DropdownMenuItem<int?>(
                                value: 0,
                                child: Text('— None —'),
                              ),
                              for (final st in _allSubtypes)
                                DropdownMenuItem<int?>(
                                  value: st.id,
                                  child: Text(st.displayName),
                                ),
                            ],
                            onChanged: (v) => setState(() => _subtypeId = v),
                          ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          _langGroup(
            label: 'English (EN)',
            nameCtrl: _enName,
            addrCtrl: _enAddr,
          ),
          const SizedBox(height: 12),
          _langGroup(
            label: 'Français (FR)',
            nameCtrl: _frName,
            addrCtrl: _frAddr,
          ),
          const SizedBox(height: 12),
          _langGroup(
            label: 'العربية (AR)',
            nameCtrl: _arName,
            addrCtrl: _arAddr,
            textDirection: TextDirection.rtl,
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton(
              onPressed: _savingInfo ? null : _saveInfo,
              child: _savingInfo
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Save info'),
            ),
          ),
        ],
      ),
    );
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
        TextField(
          controller: nameCtrl,
          textDirection: textDirection,
          decoration: const InputDecoration(
            labelText: 'Name',
            isDense: true,
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
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

  // ── Specialties section ───────────────────────────────────────────────────

  Widget _buildSpecialtiesSection(BuildContext context) {
    return _SectionCard(
      title: 'Specialties',
      child: _loadingCatalog
          ? const Center(child: CircularProgressIndicator())
          : _catalogError != null
              ? _CatalogError(
                  message: _catalogError!,
                  onRetry: _fetchCatalog,
                )
              : _allSpecialties.isEmpty
                  ? const Text('No specialties in the catalog.')
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Wrap(
                          spacing: 8,
                          runSpacing: 4,
                          children: [
                            for (final spec in _allSpecialties)
                              FilterChip(
                                label: Text(spec.displayName),
                                selected: _selectedIds.contains(spec.id),
                                onSelected: _savingSpecialties
                                    ? null
                                    : (on) => setState(() {
                                          if (on) {
                                            _selectedIds.add(spec.id);
                                          } else {
                                            _selectedIds.remove(spec.id);
                                          }
                                        }),
                              ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Align(
                          alignment: Alignment.centerRight,
                          child: FilledButton(
                            onPressed: _savingSpecialties ? null : _saveSpecialties,
                            child: _savingSpecialties
                                ? const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(strokeWidth: 2),
                                  )
                                : const Text('Save specialties'),
                          ),
                        ),
                      ],
                    ),
    );
  }
}

// ── Shared helper widgets ─────────────────────────────────────────────────────

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

class _CatalogError extends StatelessWidget {
  const _CatalogError({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(message, style: const TextStyle(color: Colors.red)),
        const SizedBox(height: 8),
        TextButton.icon(
          onPressed: onRetry,
          icon: const Icon(Icons.refresh),
          label: const Text('Retry'),
        ),
      ],
    );
  }
}
