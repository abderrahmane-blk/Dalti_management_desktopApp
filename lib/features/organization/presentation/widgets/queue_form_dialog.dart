import 'package:desktop_turn_management/features/workspaces/domain/entities/workspace.dart';
import 'package:flutter/material.dart';

/// Add / edit a queue. **UI only** for now — saving is not wired to the backend
/// yet, so [pop]ping with `true` just lets the caller acknowledge the intent.
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
  late final _name =
      TextEditingController(text: widget.queue?.name.en ?? '');
  late final _description =
      TextEditingController(text: widget.queue?.description.en ?? '');
  late String _mode = widget.queue?.mode ?? 'Simple';

  bool get _isEdit => widget.queue != null;

  @override
  void dispose() {
    _name.dispose();
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(_isEdit ? 'Edit queue' : 'Add a new queue'),
      content: SizedBox(
        width: 420,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _name,
              decoration: const InputDecoration(
                labelText: 'Name (English)',
                isDense: true,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _description,
              minLines: 1,
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Description (English)',
                isDense: true,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<String>(
              initialValue: _mode,
              decoration: const InputDecoration(
                labelText: 'Mode',
                border: OutlineInputBorder(),
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
}
