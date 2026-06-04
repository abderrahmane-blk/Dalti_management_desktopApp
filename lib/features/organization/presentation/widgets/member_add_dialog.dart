import 'package:desktop_turn_management/core/network/api_exception.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/org_permissions.dart';
import 'package:flutter/material.dart';

/// Dialog to add an existing user (by email) to the org with a permission
/// preset. [onAdd] performs the call and returns the error (or null on success);
/// the dialog closes on success and reports failures via a snackbar.
class MemberAddDialog extends StatefulWidget {
  const MemberAddDialog({super.key, required this.onAdd});

  final Future<ApiException?> Function(String email, int permissions) onAdd;

  @override
  State<MemberAddDialog> createState() => _MemberAddDialogState();
}

class _MemberAddDialogState extends State<MemberAddDialog> {
  final _emailController = TextEditingController();
  MemberPreset _preset = MemberPreset.operator;
  bool _submitting = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final email = _emailController.text.trim();
    if (email.isEmpty) return;
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    setState(() => _submitting = true);
    final error = await widget.onAdd(email, _preset.mask);
    if (!mounted) return;
    setState(() => _submitting = false);
    if (error == null) {
      navigator.pop();
      messenger.showSnackBar(const SnackBar(content: Text('Member added.')));
    } else {
      messenger.showSnackBar(SnackBar(content: Text(error.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add member'),
      content: SizedBox(
        width: 380,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'User email',
                helperText: 'They must have signed in at least once.',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<MemberPreset>(
              initialValue: _preset,
              decoration: const InputDecoration(
                labelText: 'Permissions',
                border: OutlineInputBorder(),
              ),
              items: [
                for (final preset in MemberPreset.selectable)
                  DropdownMenuItem(
                    value: preset,
                    child: Text('${preset.label} — ${preset.description}'),
                  ),
              ],
              onChanged: (p) => setState(() => _preset = p ?? _preset),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _submitting ? null : () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: _submitting ? null : _submit,
          child: Text(_submitting ? 'Adding…' : 'Add'),
        ),
      ],
    );
  }
}
