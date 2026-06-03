import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/auth/domain/entities/current_user.dart';

/// Domain-facing contract for the signed-in user's identity.
///
/// Presentation depends only on this. The current implementation resolves the
/// identity from the dev JWT; a future Google-auth implementation can resolve it
/// from `GET /users/me` behind the same interface.
abstract interface class UserRepository {
  /// Returns the current user, or an [Err] (never throws) when no valid token
  /// is configured / the token cannot be read.
  Future<Result<CurrentUser>> currentUser();
}
