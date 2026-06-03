// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_workspace.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The organization the user chose to manage on the selection screen.
///
/// App-level state shared across the whole post-login flow, so it is
/// `keepAlive` (it must survive route changes). `null` means "nothing chosen
/// yet" — the home screen redirects back to selection in that case.

@ProviderFor(SelectedWorkspace)
final selectedWorkspaceProvider = SelectedWorkspaceProvider._();

/// The organization the user chose to manage on the selection screen.
///
/// App-level state shared across the whole post-login flow, so it is
/// `keepAlive` (it must survive route changes). `null` means "nothing chosen
/// yet" — the home screen redirects back to selection in that case.
final class SelectedWorkspaceProvider
    extends $NotifierProvider<SelectedWorkspace, ManagedOrganization?> {
  /// The organization the user chose to manage on the selection screen.
  ///
  /// App-level state shared across the whole post-login flow, so it is
  /// `keepAlive` (it must survive route changes). `null` means "nothing chosen
  /// yet" — the home screen redirects back to selection in that case.
  SelectedWorkspaceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedWorkspaceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedWorkspaceHash();

  @$internal
  @override
  SelectedWorkspace create() => SelectedWorkspace();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ManagedOrganization? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ManagedOrganization?>(value),
    );
  }
}

String _$selectedWorkspaceHash() => r'd65c04bd636634ef4e81e964c3e65068ca9fb75f';

/// The organization the user chose to manage on the selection screen.
///
/// App-level state shared across the whole post-login flow, so it is
/// `keepAlive` (it must survive route changes). `null` means "nothing chosen
/// yet" — the home screen redirects back to selection in that case.

abstract class _$SelectedWorkspace extends $Notifier<ManagedOrganization?> {
  ManagedOrganization? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ManagedOrganization?, ManagedOrganization?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ManagedOrganization?, ManagedOrganization?>,
              ManagedOrganization?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
