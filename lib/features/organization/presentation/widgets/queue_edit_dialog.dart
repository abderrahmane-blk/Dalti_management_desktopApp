import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/queue_full_data.dart';
import 'package:desktop_turn_management/features/organization/presentation/providers/organization_providers.dart';
import 'package:desktop_turn_management/features/workspaces/domain/entities/workspace.dart';
import 'package:desktop_turn_management/features/workspaces/presentation/providers/selected_workspace.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Full queue-edit dialog: takes 90 % of the viewport height and 75 % of the
/// width. Two separately-saveable sections — Info and Rules.
class QueueEditDialog extends ConsumerStatefulWidget {
  const QueueEditDialog({super.key, required this.queue});

  final ManagedQueue queue;

  @override
  ConsumerState<QueueEditDialog> createState() => _QueueEditDialogState();
}

// Mutable state for one work-time window row.
class _TimeWindowEntry {
  _TimeWindowEntry({String start = '', String end = ''})
      : startCtrl = TextEditingController(text: start),
        endCtrl = TextEditingController(text: end);
  final TextEditingController startCtrl;
  final TextEditingController endCtrl;
  void dispose() {
    startCtrl.dispose();
    endCtrl.dispose();
  }
}

class _QueueEditDialogState extends ConsumerState<QueueEditDialog> {
  // ── Info section (pre-filled from ManagedQueue immediately) ─────────────
  late final TextEditingController _nameEn;
  late final TextEditingController _nameFr;
  late final TextEditingController _nameAr;
  late final TextEditingController _descEn;
  late final TextEditingController _descFr;
  late final TextEditingController _descAr;
  late String _status;
  bool _savingInfo = false;

  // ── Rules section (loaded async) ─────────────────────────────────────────
  bool _loadingRules = true;
  String? _rulesError;

  bool _autoAccept = true;
  bool _addTurnOnAccept = true;
  final Set<int> _workDays = {};
  final List<_TimeWindowEntry> _workTime = [];
  final List<String> _specialOffDays = [];
  late final TextEditingController _maxResPerDay;
  late final TextEditingController _maxDaysAhead;
  final Set<String> _infoNeeded = {};
  // TimeBased-specific
  late final TextEditingController _timeDedicatedPerTurn;
  late final TextEditingController _safeTimeToFinish;
  late final TextEditingController _minTurnDuration;
  bool _savingRules = false;

  // ── Helpers ───────────────────────────────────────────────────────────────

  static const _dayLabels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  static const _commonInfoFields = ['name', 'phone', 'email', 'id'];
  static const _statusValues = ['Open', 'Closed'];

  bool get _isTimeBased => widget.queue.mode == 'TimeBased';

  @override
  void initState() {
    super.initState();
    _nameEn = TextEditingController(text: widget.queue.name.en);
    _nameFr = TextEditingController(text: widget.queue.name.fr);
    _nameAr = TextEditingController(text: widget.queue.name.ar);
    _descEn = TextEditingController(text: widget.queue.description.en);
    _descFr = TextEditingController(text: widget.queue.description.fr);
    _descAr = TextEditingController(text: widget.queue.description.ar);
    _status = widget.queue.status;

    _maxResPerDay = TextEditingController();
    _maxDaysAhead = TextEditingController();
    _timeDedicatedPerTurn = TextEditingController();
    _safeTimeToFinish = TextEditingController();
    _minTurnDuration = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((_) => _fetchRules());
  }

  @override
  void dispose() {
    _nameEn.dispose();
    _nameFr.dispose();
    _nameAr.dispose();
    _descEn.dispose();
    _descFr.dispose();
    _descAr.dispose();
    _maxResPerDay.dispose();
    _maxDaysAhead.dispose();
    _timeDedicatedPerTurn.dispose();
    _safeTimeToFinish.dispose();
    _minTurnDuration.dispose();
    for (final w in _workTime) {
      w.dispose();
    }
    super.dispose();
  }

  // ── Data fetching ─────────────────────────────────────────────────────────

  Future<void> _fetchRules() async {
    if (!mounted) return;
    setState(() {
      _loadingRules = true;
      _rulesError = null;
    });
    final result = await ref
        .read(organizationRepositoryProvider)
        .fetchQueueFull(widget.queue.id);
    if (!mounted) return;
    switch (result) {
      case Ok(:final value):
        _applyRules(value.rules);
        setState(() => _loadingRules = false);
      case Err(:final error):
        setState(() {
          _loadingRules = false;
          _rulesError = error.message;
        });
    }
  }

  void _applyRules(QueueRulesData rules) {
    for (final w in _workTime) {
      w.dispose();
    }
    _workTime.clear();

    setState(() {
      _autoAccept = rules.autoAcceptReservations ?? true;
      _addTurnOnAccept = rules.addTurnOnAccept ?? true;

      _workDays
        ..clear()
        ..addAll(rules.workDays ?? []);

      _workTime.addAll(
        (rules.workTime ?? []).map(
          (w) => _TimeWindowEntry(start: w.start, end: w.end),
        ),
      );

      _specialOffDays
        ..clear()
        ..addAll(rules.specialOffDays ?? []);

      _maxResPerDay.text = rules.maxReservationsPerDay?.toString() ?? '';
      _maxDaysAhead.text = rules.maxDaysAhead?.toString() ?? '';

      _infoNeeded
        ..clear()
        ..addAll(rules.infoNeededForReserving ?? []);

      _timeDedicatedPerTurn.text = rules.timeDedicatedPerTurn?.toString() ?? '';
      _safeTimeToFinish.text = rules.safeTimeToFinish?.toString() ?? '';
      _minTurnDuration.text = rules.minTurnDuration?.toString() ?? '';
    });
  }

  // ── Save info ─────────────────────────────────────────────────────────────

  Future<void> _saveInfo() async {
    setState(() => _savingInfo = true);

    final Map<String, dynamic> body = {'status': _status};

    void addLang(String key, String name, String desc) {
      if (name.trim().isNotEmpty) {
        body[key] = {
          'name': name.trim(),
          if (desc.trim().isNotEmpty) 'description': desc.trim(),
        };
      }
    }

    addLang('EN', _nameEn.text, _descEn.text);
    addLang('AR', _nameAr.text, _descAr.text);
    addLang('FR', _nameFr.text, _descFr.text);

    final result = await ref
        .read(organizationRepositoryProvider)
        .updateQueueInfo(widget.queue.id, body);
    if (!mounted) return;
    setState(() => _savingInfo = false);

    if (result case Err(:final error)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.message)));
      return;
    }

    // Reflect update in the local workspace so sidebar + org screen see it.
    final org = ref.read(selectedWorkspaceProvider);
    if (org != null) {
      final updatedQueues = org.queues.map((q) {
        if (q.id != widget.queue.id) return q;
        return q.copyWith(
          status: _status,
          name: L10n(
            ar: _nameAr.text.trim(),
            en: _nameEn.text.trim(),
            fr: _nameFr.text.trim(),
          ),
          description: L10n(
            ar: _descAr.text.trim(),
            en: _descEn.text.trim(),
            fr: _descFr.text.trim(),
          ),
        );
      }).toList();
      ref
          .read(selectedWorkspaceProvider.notifier)
          .select(org.copyWith(queues: updatedQueues));
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Queue info saved.')));
  }

  // ── Save rules ─────────────────────────────────────────────────────────────

  Future<void> _saveRules() async {
    setState(() => _savingRules = true);

    final Map<String, dynamic> patch = {
      'auto_accept_reservations': _autoAccept,
      'add_turn_on_accept': _addTurnOnAccept,
      'work_days': _workDays.toList()..sort(),
      'work_time': _workTime
          .map((w) => {'start': w.startCtrl.text, 'end': w.endCtrl.text})
          .toList(),
      'special_off_days': List<String>.from(_specialOffDays),
      'info_needed_for_reserving': _infoNeeded.toList(),
    };

    final maxRes = int.tryParse(_maxResPerDay.text);
    if (maxRes != null) patch['max_reservations_per_day'] = maxRes;

    final maxDays = int.tryParse(_maxDaysAhead.text);
    if (maxDays != null) patch['max_days_ahead'] = maxDays;

    if (_isTimeBased) {
      final timePer = int.tryParse(_timeDedicatedPerTurn.text);
      if (timePer != null) patch['time_dedicated_per_turn'] = timePer;

      final safe = int.tryParse(_safeTimeToFinish.text);
      if (safe != null) patch['safe_time_to_finish'] = safe;

      final minDur = int.tryParse(_minTurnDuration.text);
      if (minDur != null) patch['min_turn_duration'] = minDur;
    }

    final result = await ref
        .read(organizationRepositoryProvider)
        .updateQueueRules(widget.queue.id, patch);
    if (!mounted) return;
    setState(() => _savingRules = false);

    if (result case Err(:final error)) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.message)));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Rules saved.')));
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
                    _buildRulesSection(context),
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
                  'Edit Queue',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  widget.queue.name.display,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          Chip(
            label: Text(widget.queue.mode),
            padding: EdgeInsets.zero,
          ),
          const SizedBox(width: 8),
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
      title: 'Queue Info',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButtonFormField<String>(
            initialValue: _statusValues.contains(_status) ? _status : _statusValues.first,
            decoration: const InputDecoration(
              labelText: 'Status',
              border: OutlineInputBorder(),
              isDense: true,
            ),
            items: _statusValues
                .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                .toList(),
            onChanged: (v) => setState(() => _status = v ?? _status),
          ),
          const SizedBox(height: 16),
          _langGroup(
            label: 'English (EN)',
            nameCtrl: _nameEn,
            descCtrl: _descEn,
          ),
          const SizedBox(height: 12),
          _langGroup(
            label: 'French (FR)',
            nameCtrl: _nameFr,
            descCtrl: _descFr,
          ),
          const SizedBox(height: 12),
          _langGroup(
            label: 'Arabic (AR)',
            nameCtrl: _nameAr,
            descCtrl: _descAr,
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
    required TextEditingController descCtrl,
    TextDirection? textDirection,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const SizedBox(height: 6),
        TextField(
          controller: nameCtrl,
          textDirection: textDirection,
          decoration: const InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(),
            isDense: true,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: descCtrl,
          textDirection: textDirection,
          minLines: 2,
          maxLines: 4,
          decoration: const InputDecoration(
            labelText: 'Description',
            border: OutlineInputBorder(),
            isDense: true,
          ),
        ),
      ],
    );
  }

  // ── Rules section ─────────────────────────────────────────────────────────

  Widget _buildRulesSection(BuildContext context) {
    return _SectionCard(
      title: 'Queue Rules',
      child: switch ((_loadingRules, _rulesError)) {
        (true, _) => const Center(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: CircularProgressIndicator(),
            ),
          ),
        (false, final String err) => Center(
            child: Column(
              children: [
                const SizedBox(height: 16),
                Text('Could not load rules: $err'),
                const SizedBox(height: 12),
                OutlinedButton(
                  onPressed: _fetchRules,
                  child: const Text('Retry'),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        _ => _buildRulesForm(context),
      },
    );
  }

  Widget _buildRulesForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Toggles ──────────────────────────────────────────────────────
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Auto-accept reservations'),
          subtitle: const Text(
            'Incoming reservations are accepted automatically.',
          ),
          value: _autoAccept,
          onChanged: (v) => setState(() => _autoAccept = v),
        ),
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text('Add to queue turn on accept'),
          subtitle: const Text(
            'The reservation gets a position in the queue when accepted.',
          ),
          value: _addTurnOnAccept,
          onChanged: (v) => setState(() => _addTurnOnAccept = v),
        ),
        const Divider(),

        // ── Work days ─────────────────────────────────────────────────────
        const _RuleLabel('Work days'),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: List.generate(7, (i) {
            final selected = _workDays.contains(i);
            return FilterChip(
              label: Text(_dayLabels[i]),
              selected: selected,
              onSelected: (v) => setState(() {
                if (v) {
                  _workDays.add(i);
                } else {
                  _workDays.remove(i);
                }
              }),
            );
          }),
        ),
        const SizedBox(height: 16),

        // ── Work time windows ─────────────────────────────────────────────
        Row(
          children: [
            const Expanded(child: _RuleLabel('Work time windows')),
            TextButton.icon(
              onPressed: () =>
                  setState(() => _workTime.add(_TimeWindowEntry())),
              icon: const Icon(Icons.add, size: 16),
              label: const Text('Add window'),
            ),
          ],
        ),
        if (_workTime.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Text('No time windows set.'),
          ),
        for (int i = 0; i < _workTime.length; i++) ...[
          const SizedBox(height: 8),
          _TimeWindowRow(
            entry: _workTime[i],
            onRemove: () => setState(() {
              _workTime[i].dispose();
              _workTime.removeAt(i);
            }),
          ),
        ],
        const SizedBox(height: 16),

        // ── Special off days ──────────────────────────────────────────────
        Row(
          children: [
            const Expanded(child: _RuleLabel('Special off days')),
            TextButton.icon(
              onPressed: () => _addSpecialOffDay(context),
              icon: const Icon(Icons.add, size: 16),
              label: const Text('Add date'),
            ),
          ],
        ),
        if (_specialOffDays.isEmpty)
          const Text('No special off days set.')
        else
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              for (final d in _specialOffDays)
                Chip(
                  label: Text(d),
                  deleteIcon: const Icon(Icons.close, size: 14),
                  onDeleted: () =>
                      setState(() => _specialOffDays.remove(d)),
                ),
            ],
          ),
        const SizedBox(height: 16),

        // ── Info needed for reserving ─────────────────────────────────────
        const _RuleLabel('Info needed for reserving'),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: [
            for (final field in _commonInfoFields)
              FilterChip(
                label: Text(field),
                selected: _infoNeeded.contains(field),
                onSelected: (v) => setState(() {
                  if (v) {
                    _infoNeeded.add(field);
                  } else {
                    _infoNeeded.remove(field);
                  }
                }),
              ),
          ],
        ),
        const SizedBox(height: 16),

        // ── Number fields ─────────────────────────────────────────────────
        Row(
          children: [
            Expanded(
              child: _NumberField(
                controller: _maxResPerDay,
                label: 'Max reservations/day',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _NumberField(
                controller: _maxDaysAhead,
                label: 'Max days ahead',
              ),
            ),
          ],
        ),
        if (_isTimeBased) ...[
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _NumberField(
                  controller: _timeDedicatedPerTurn,
                  label: 'Minutes per turn',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _NumberField(
                  controller: _safeTimeToFinish,
                  label: 'Safe time to finish (min)',
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _NumberField(
                  controller: _minTurnDuration,
                  label: 'Min turn duration (min)',
                ),
              ),
            ],
          ),
        ],
        const SizedBox(height: 24),

        Align(
          alignment: Alignment.centerRight,
          child: FilledButton(
            onPressed: _savingRules ? null : _saveRules,
            child: _savingRules
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Save rules'),
          ),
        ),
      ],
    );
  }

  Future<void> _addSpecialOffDay(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked == null) return;
    final formatted =
        '${picked.year.toString().padLeft(4, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
    if (!_specialOffDays.contains(formatted)) {
      setState(() => _specialOffDays.add(formatted));
    }
  }
}

// ── Small helper widgets ───────────────────────────────────────────────────────

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

class _RuleLabel extends StatelessWidget {
  const _RuleLabel(this.text);
  final String text;

  @override
  Widget build(BuildContext context) =>
      Text(text, style: Theme.of(context).textTheme.labelLarge);
}

class _NumberField extends StatelessWidget {
  const _NumberField({required this.controller, required this.label});
  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        isDense: true,
      ),
    );
  }
}

class _TimeWindowRow extends StatelessWidget {
  const _TimeWindowRow({required this.entry, required this.onRemove});
  final _TimeWindowEntry entry;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: entry.startCtrl,
            decoration: const InputDecoration(
              labelText: 'Start (HH:MM)',
              border: OutlineInputBorder(),
              isDense: true,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: entry.endCtrl,
            decoration: const InputDecoration(
              labelText: 'End (HH:MM)',
              border: OutlineInputBorder(),
              isDense: true,
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          tooltip: 'Remove',
          onPressed: onRemove,
        ),
      ],
    );
  }
}
