import 'package:desktop_turn_management/core/auth/session_auth_token_store.dart';
import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:desktop_turn_management/features/auth/data/datasources/google_sign_in_data_source.dart';
import 'package:desktop_turn_management/features/auth/domain/entities/current_user.dart';
import 'package:desktop_turn_management/features/auth/domain/repositories/auth_repository.dart';

/// [AuthRepository] orchestrating the desktop Google sign-in:
/// Google OAuth → backend exchange → store the JWT in the session token store.
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this._google,
    required this._remote,
    required this._session,
  });

  final GoogleSignInDataSource _google;
  final AuthRemoteDataSource _remote;
  final SessionAuthTokenStore _session;

  @override
  Future<Result<CurrentUser>> signInWithGoogle() => guard(() async {
        final idToken = await _google.signIn();
        final response = await _remote.signInWithGoogle(idToken);
        _session.setAccessToken(response.accessToken);
        return response.user.toEntity();
      });

  @override
  Future<void> signOut() async => _session.clear();
}
