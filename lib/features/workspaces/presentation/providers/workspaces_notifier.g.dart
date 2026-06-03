// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspaces_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Loads the user's manageable workspaces for the selection screen.
///
/// Online-first with an offline fallback: it fetches fresh data (roles and
/// queues can change), and only falls back to the cache when the network fails.

@ProviderFor(Workspaces)
final workspacesProvider = WorkspacesProvider._();

/// Loads the user's manageable workspaces for the selection screen.
///
/// Online-first with an offline fallback: it fetches fresh data (roles and
/// queues can change), and only falls back to the cache when the network fails.
final class WorkspacesProvider
    extends $AsyncNotifierProvider<Workspaces, Workspace> {
  /// Loads the user's manageable workspaces for the selection screen.
  ///
  /// Online-first with an offline fallback: it fetches fresh data (roles and
  /// queues can change), and only falls back to the cache when the network fails.
  WorkspacesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workspacesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workspacesHash();

  @$internal
  @override
  Workspaces create() => Workspaces();
}

String _$workspacesHash() => r'604f5e2d1061580b97e9b6a00f0e739abfa7768d';

/// Loads the user's manageable workspaces for the selection screen.
///
/// Online-first with an offline fallback: it fetches fresh data (roles and
/// queues can change), and only falls back to the cache when the network fails.

abstract class _$Workspaces extends $AsyncNotifier<Workspace> {
  FutureOr<Workspace> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Workspace>, Workspace>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Workspace>, Workspace>,
              AsyncValue<Workspace>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
