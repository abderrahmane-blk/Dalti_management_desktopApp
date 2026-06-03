import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/workspaces/domain/entities/workspace.dart';
import 'package:desktop_turn_management/features/workspaces/presentation/providers/workspace_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workspaces_notifier.g.dart';

/// Loads the user's manageable workspaces for the selection screen.
///
/// Online-first with an offline fallback: it fetches fresh data (roles and
/// queues can change), and only falls back to the cache when the network fails.
@riverpod
class Workspaces extends _$Workspaces {
  @override
  Future<Workspace> build() async {
    final repository = ref.watch(workspaceRepositoryProvider);

    final result = await repository.fetchWorkspaces();
    if (result is Ok<Workspace>) return result.value;

    final cached = await repository.cachedWorkspace();
    if (cached != null) return cached;

    throw (result as Err<Workspace>).error;
  }

  /// Forces a one-shot refresh, showing a loading state while it runs.
  Future<void> refresh() async {
    state = const AsyncLoading<Workspace>();
    state = await AsyncValue.guard(() async {
      final result =
          await ref.read(workspaceRepositoryProvider).fetchWorkspaces();
      return switch (result) {
        Ok(:final value) => value,
        Err(:final error) => throw error,
      };
    });
  }
}
