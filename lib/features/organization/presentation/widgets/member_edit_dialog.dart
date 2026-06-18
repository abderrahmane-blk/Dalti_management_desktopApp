import 'package:desktop_turn_management/core/network/api_exception.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/org_member.dart';
import 'package:desktop_turn_management/features/organization/domain/entities/org_permissions.dart';
import 'package:flutter/material.dart';

/// Dialog to change a member's permission preset or remove them. [onSave] and
/// [onDelete] perform the calls and return the error (or null on success). The
/// dialog closes on success and reports failures via a snackbar; Delete asks
/// for confirmation first.
class MemberEditDialog extends StatefulWidget {
  const MemberEditDialog({
    super.key,
    required this.member,
    required this.onSave,
    required this.onDelete,
  });

  final OrgMember member;
  final Future<ApiException?> Function(int permissions) onSave;
  final Future<ApiException?> Function() onDelete;

  @override
  State<MemberEditDialog> createState() => _MemberEditDialogState();
}

class _MemberEditDialogState extends State<MemberEditDialog> {
  late MemberPreset _preset = widget.member.preset;
  bool _busy = false;

  /// Includes [MemberPreset.custom] as a (non-applyable) option only when the
  /// member's current permissions don't match a named preset.
  List<MemberPreset> get _options => [
        if (_preset == MemberPreset.custom) MemberPreset.custom,
        ...MemberPreset.selectable,
      ];

  Future<void> _save() async {
    if (_preset == MemberPreset.custom) return; // can't apply a custom mask here
    await _run(() => widget.onSave(_preset.mask), 'Permissions updated.');
  }

  Future<void> _confirmDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Remove member?'),
        content: Text(
          'Remove ${widget.member.displayName} from this organization? '
          'This cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(ctx).colorScheme.error,
            ),
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Remove'),
          ),
        ],
      ),
    );
    if (confirmed ?? false) {
      await _run(widget.onDelete, 'Member removed.');
    }
  }

  Future<void> _run(
    Future<ApiException?> Function() action,
    String okMessage,
  ) async {
    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    setState(() => _busy = true);
    final error = await action();
    if (!mounted) return;
    setState(() => _busy = false);
    if (error == null) {
      navigator.pop();
      messenger.showSnackBar(SnackBar(content: Text(okMessage)));
    } else {
      messenger.showSnackBar(SnackBar(content: Text(error.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final member = widget.member;
    return AlertDialog(
      title: Text(member.displayName),
      content: SizedBox(
        width: 460,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(member.email),
            const SizedBox(height: 4),
            Text('Role: ${member.role}'),
            const SizedBox(height: 16),
            DropdownButtonFormField<MemberPreset>(
              initialValue: _preset,
              isExpanded: true,
              decoration: const InputDecoration(
                labelText: 'Permissions',
                border: OutlineInputBorder(),
              ),
              items: [
                for (final preset in _options)
                  DropdownMenuItem(
                    value: preset,
                    child: Text(
                      preset == MemberPreset.custom
                          ? 'Custom (${member.permissions})'
                          : preset.label,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
              ],
              onChanged: _busy
                  ? null
                  : (p) => setState(() => _preset = p ?? _preset),
            ),
            const SizedBox(height: 8),
            Text(
              _preset == MemberPreset.custom
                  ? 'This member has a custom permission set. Pick a preset to change it.'
                  : _preset.description,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: _busy ? null : _confirmDelete,
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).colorScheme.error,
          ),
          child: const Text('Remove'),
        ),
        TextButton(
          onPressed: _busy ? null : () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: (_busy || _preset == MemberPreset.custom) ? null : _save,
          child: const Text('Save'),
        ),
      ],
    );
  }
}
