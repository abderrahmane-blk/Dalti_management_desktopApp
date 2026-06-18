import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/auth/domain/entities/current_user.dart';

/// Sign-in / sign-out operations. Separate from [UserRepository] (which only
/// *reads* the current identity) so presentation depends on a narrow type.
abstract interface class AuthRepository {
  /// Runs the Google sign-in flow, exchanges the token with the backend, stores
  /// the returned JWT, and returns the signed-in [CurrentUser].
  Future<Result<CurrentUser>> signInWithGoogle();

  /// Forgets the stored token (local sign-out).
  Future<void> signOut();
}
