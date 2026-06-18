import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/auth/presentation/providers/auth_providers.dart';
import 'package:desktop_turn_management/features/auth/presentation/providers/current_user_notifier.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'google_sign_in_notifier.g.dart';

/// Drives the Google sign-in button. Its [AsyncValue] state is `loading` while
/// the browser flow + token exchange run, and `error` (with the [ApiException])
/// when sign-in fails, so the login screen can disable the button and show the
/// message. On success it refreshes [currentUserProvider] from the new token.
@riverpod
class GoogleSignIn extends _$GoogleSignIn {
  @override
  Future<void> build() async {}

  /// Returns `true` on success so the caller can navigate.
  Future<bool> signIn() async {
    state = const AsyncLoading<void>();
    final result = await ref.read(authRepositoryProvider).signInWithGoogle();
    switch (result) {
      case Ok():
        ref.invalidate(currentUserProvider);
        state = const AsyncData<void>(null);
        return true;
      case Err(:final error):
        state = AsyncError<void>(error, StackTrace.current);
        return false;
    }
  }
}
