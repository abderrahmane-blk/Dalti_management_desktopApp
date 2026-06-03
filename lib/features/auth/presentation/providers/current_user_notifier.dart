import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/auth/domain/entities/current_user.dart';
import 'package:desktop_turn_management/features/auth/presentation/providers/auth_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_user_notifier.g.dart';

/// Loads (and exposes) the signed-in user. Used by the login gate to render the
/// "Continue as `<name>`" button. (Generated provider: `currentUserProvider`.)
@riverpod
class CurrentUserNotifier extends _$CurrentUserNotifier {
  @override
  Future<CurrentUser> build() async {
    final result = await ref.watch(userRepositoryProvider).currentUser();
    return switch (result) {
      Ok(:final value) => value,
      Err(:final error) => throw error,
    };
  }

  /// Re-reads the identity (e.g. after a token is pasted in).
  Future<void> retry() async {
    state = const AsyncLoading<CurrentUser>();
    state = await AsyncValue.guard(() async {
      final result = await ref.read(userRepositoryProvider).currentUser();
      return switch (result) {
        Ok(:final value) => value,
        Err(:final error) => throw error,
      };
    });
  }
}
