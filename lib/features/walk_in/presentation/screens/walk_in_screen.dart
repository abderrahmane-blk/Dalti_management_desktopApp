import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/walk_in/domain/entities/walk_in_ticket.dart';
import 'package:desktop_turn_management/features/walk_in/presentation/providers/walk_in_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Form to register a walk-in onto a queue (the anonymous `reserve` flow).
///
/// On success a dialog offers to register another (clears the form) or finish
/// (`onDone`, which returns to the queue's Today board).
class WalkInScreen extends ConsumerStatefulWidget {
  const WalkInScreen({
    super.key,
    required this.queueId,
    required this.queueName,
    required this.queueMode,
    required this.onDone,
  });

  final int queueId;
  final String queueName;
  final String queueMode;

  /// Called when the operator is finished — returns to the Today board.
  final VoidCallback onDone;

  @override
  ConsumerState<WalkInScreen> createState() => _WalkInScreenState();
}

class _WalkInScreenState extends ConsumerState<WalkInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _infoController = TextEditingController();
  final _nameFocus = FocusNode();
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  bool _submitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _infoController.dispose();
    _nameFocus.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_submitting) return;
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final messenger = ScaffoldMessenger.of(context);
    setState(() => _submitting = true);

    final formattedDate = '${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}';
    final formattedTime = widget.queueMode == 'Simple' ? null : '${_selectedTime.hour.toString().padLeft(2, '0')}:${_selectedTime.minute.toString().padLeft(2, '0')}:00';

    final result = await ref.read(walkInRepositoryProvider).register(
          widget.queueId,
          name: _nameController.text.trim(),
          phone: _phoneController.text.trim(),
          info: _infoController.text.trim(),
          scheduledDate: formattedDate,
          scheduledTime: formattedTime,
        );
    if (!mounted) return;
    setState(() => _submitting = false);

    switch (result) {
      case Ok(:final value):
        await _showRegisteredDialog(value);
      case Err(:final error):
        messenger.showSnackBar(SnackBar(content: Text(error.message)));
    }
  }

  /// Confirms the registration and asks whether to add another or finish.
  Future<void> _showRegisteredDialog(WalkInTicket ticket) async {
    final addAnother = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Walk-in registered'),
        content: Text(
          'Ticket #${ticket.position} · code ${ticket.secretCode}.\n'
          'Register another walk-in?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Done'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: const Text('Add another'),
          ),
        ],
      ),
    );
    if (!mounted) return;
    if (addAnother ?? false) {
      _resetForm();
    } else {
      widget.onDone();
    }
  }

  void _resetForm() {
    _nameController.clear();
    _phoneController.clear();
    _infoController.clear();
    _formKey.currentState?.reset();
    setState(() {
      _selectedDate = DateTime.now();
      _selectedTime = TimeOfDay.now();
    });
    _nameFocus.requestFocus();
  }

  String? _required(String? value, String field) =>
      (value == null || value.trim().isEmpty) ? '$field is required.' : null;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(widget.queueName, style: theme.textTheme.titleLarge),
          Text(
            'Register a walk-in',
            style: theme.textTheme.bodyMedium
                ?.copyWith(color: theme.colorScheme.outline),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        focusNode: _nameFocus,
                        autofocus: true,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(),
                        ),
                        validator: (v) => _required(v, 'Name'),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          labelText: 'Phone',
                          border: OutlineInputBorder(),
                        ),
                        validator: (v) => _required(v, 'Phone'),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _infoController,
                        minLines: 1,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          labelText: 'Note (optional)',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                final date = await showDatePicker(
                                  context: context,
                                  initialDate: _selectedDate,
                                  firstDate: DateTime.now().subtract(const Duration(days: 365)),
                                  lastDate: DateTime.now().add(const Duration(days: 365)),
                                );
                                if (date != null) {
                                  setState(() => _selectedDate = date);
                                }
                              },
                              child: InputDecorator(
                                decoration: const InputDecoration(
                                  labelText: 'Date',
                                  border: OutlineInputBorder(),
                                ),
                                child: Text(
                                  '${_selectedDate.year}-${_selectedDate.month.toString().padLeft(2, '0')}-${_selectedDate.day.toString().padLeft(2, '0')}',
                                ),
                              ),
                            ),
                          ),
                          if (widget.queueMode != 'Simple') ...[
                            const SizedBox(width: 12),
                            Expanded(
                              child: InkWell(
                                onTap: () async {
                                  final time = await showTimePicker(
                                    context: context,
                                    initialTime: _selectedTime,
                                  );
                                  if (time != null) {
                                    setState(() => _selectedTime = time);
                                  }
                                },
                                child: InputDecorator(
                                  decoration: const InputDecoration(
                                    labelText: 'Time',
                                    border: OutlineInputBorder(),
                                  ),
                                  child: Text(
                                    _selectedTime.format(context),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 20),
                      FilledButton.icon(
                        onPressed: _submitting ? null : _submit,
                        icon: _submitting
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child:
                                    CircularProgressIndicator(strokeWidth: 2),
                              )
                            : const Icon(Icons.check),
                        label: Text(_submitting ? 'Registering…' : 'Register'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
