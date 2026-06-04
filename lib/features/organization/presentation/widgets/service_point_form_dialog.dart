import 'package:flutter/material.dart';

/// Add / edit a service point. **UI only** for now — saving is not wired to the
/// backend yet.
// TODO(service-points): wire Save to `POST /orgs/{orgId}/service-points`
// (create) and `PUT /orgs/{orgId}/service-points/{id}` (edit) once the
// service-points data layer is implemented.
class ServicePointFormDialog extends StatefulWidget {
  const ServicePointFormDialog({
    super.key,
    this.initialCode,
    this.initialName,
    this.initialActive = true,
  });

  final String? initialCode;
  final String? initialName;
  final bool initialActive;

  bool get isEdit => initialCode != null;

  @override
  State<ServicePointFormDialog> createState() => _ServicePointFormDialogState();
}

class _ServicePointFormDialogState extends State<ServicePointFormDialog> {
  late final _code = TextEditingController(text: widget.initialCode ?? '');
  late final _name = TextEditingController(text: widget.initialName ?? '');
  late bool _active = widget.initialActive;

  @override
  void dispose() {
    _code.dispose();
    _name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.isEdit ? 'Edit service point' : 'Add a service point'),
      content: SizedBox(
        width: 420,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _code,
              decoration: const InputDecoration(
                labelText: 'Code (e.g. G1)',
                isDense: true,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _name,
              decoration: const InputDecoration(
                labelText: 'Name (English)',
                isDense: true,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text('Active'),
              value: _active,
              onChanged: (v) => setState(() => _active = v),
            ),
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
