import 'package:desktop_turn_management/core/network/api_client.dart';
import 'package:desktop_turn_management/features/auth/data/models/auth_response_dto.dart';

/// Talks to the backend's auth endpoints (`/auth/*`). These are anonymous —
/// they run before the app holds a token — so requests skip the bearer header.
class AuthRemoteDataSource {
  AuthRemoteDataSource(this._client);

  final ApiClient _client;

  /// `POST /auth/google` — exchanges a Google ID token for the app's own JWT
  /// (+ refresh token + user). Throws [ApiException] on failure.
  Future<AuthResponseDto> signInWithGoogle(String idToken) async {
    final data = await _client.post(
      '/auth/google',
      data: {'idToken': idToken},
      authenticated: false,
    );
    return AuthResponseDto.fromJson(data as Map<String, dynamic>);
  }
}
