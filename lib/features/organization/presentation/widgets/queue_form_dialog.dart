import 'package:desktop_turn_management/features/workspaces/domain/entities/workspace.dart';
import 'package:flutter/material.dart';

/// Add / edit a queue. **UI only** for now — saving is not wired to the backend
/// yet, so [pop]ping with `true` just lets the caller acknowledge the intent.
///
/// Collects all three language translations (EN / FR / AR) for name and
/// description, matching the org-edit dialog's shape.
// TODO(queues): wire Save to `POST /orgs/{orgId}/queues` (create) and
// `PATCH /queues/{queueId}` (edit) once the queues data layer is implemented.
class QueueFormDialog extends StatefulWidget {
  const QueueFormDialog({super.key, this.queue});

  /// The queue being edited, or null when adding a new one.
  final ManagedQueue? queue;

  @override
  State<QueueFormDialog> createState() => _QueueFormDialogState();
}

class _QueueFormDialogState extends State<QueueFormDialog> {
  late final _enName = TextEditingController(text: widget.queue?.name.en ?? '');
  late final _enDesc =
      TextEditingController(text: widget.queue?.description.en ?? '');
  late final _frName = TextEditingController(text: widget.queue?.name.fr ?? '');
  late final _frDesc =
      TextEditingController(text: widget.queue?.description.fr ?? '');
  late final _arName = TextEditingController(text: widget.queue?.name.ar ?? '');
  late final _arDesc =
      TextEditingController(text: widget.queue?.description.ar ?? '');
  late String _mode = widget.queue?.mode ?? 'Simple';

  bool get _isEdit => widget.queue != null;

  @override
  void dispose() {
    for (final c in [_enName, _enDesc, _frName, _frDesc, _arName, _arDesc]) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_isEdit ? 'Edit queue' : 'Add a new queue'),
      content: SizedBox(
        width: 460,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _langGroup(label: 'English (EN)', nameCtrl: _enName, descCtrl: _enDesc),
              const SizedBox(height: 12),
              _langGroup(label: 'Français (FR)', nameCtrl: _frName, descCtrl: _frDesc),
              const SizedBox(height: 12),
              _langGroup(
                label: 'العربية (AR)',
                nameCtrl: _arName,
                descCtrl: _arDesc,
                textDirection: TextDirection.rtl,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                initialValue: _mode,
                decoration: const InputDecoration(
                  labelText: 'Mode',
                  border: OutlineInputBorder(),
                  isDense: true,
                ),
                items: const [
                  DropdownMenuItem(value: 'Simple', child: Text('Simple')),
                  DropdownMenuItem(value: 'TimeBased', child: Text('Time-based')),
                ],
                onChanged: (v) => setState(() => _mode = v ?? _mode),
              ),
              const SizedBox(height: 12),
              Text(
                'Saving is not wired to the backend yet.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Save'),
        ),
      ],
    );
  }

  Widget _langGroup({
    required String label,
    required TextEditingController nameCtrl,
    required TextEditingController descCtrl,
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
          controller: descCtrl,
          textDirection: textDirection,
          minLines: 1,
          maxLines: 3,
          decoration: const InputDecoration(
            labelText: 'Description',
            isDense: true,
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
