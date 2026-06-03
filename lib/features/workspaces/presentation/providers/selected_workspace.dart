import 'package:desktop_turn_management/features/workspaces/domain/entities/workspace.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_workspace.g.dart';

/// The organization the user chose to manage on the selection screen.
///
/// App-level state shared across the whole post-login flow, so it is
/// `keepAlive` (it must survive route changes). `null` means "nothing chosen
/// yet" — the home screen redirects back to selection in that case.
@Riverpod(keepAlive: true)
class SelectedWorkspace extends _$SelectedWorkspace {
  @override
  ManagedOrganization? build() => null;

  /// Registers the user's choice.
  void select(ManagedOrganization organization) => state = organization;

  /// Clears the choice (logout, or "handle something else").
  void clear() => state = null;
}
