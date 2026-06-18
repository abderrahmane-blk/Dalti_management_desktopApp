import 'package:desktop_turn_management/core/auth/auth_token_store.dart';
import 'package:desktop_turn_management/core/auth/dev_auth_token_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_auth_token_store.g.dart';

/// A mutable, in-memory [AuthTokenStore] for the running session.
///
/// It holds whatever access token the app last obtained:
///   • the dev JWT it is seeded with (so "Continue as dev" keeps working), or
///   • the JWT returned by `POST /auth/google` after a real Google sign-in.
///
/// `ApiClient` reads [readAccessToken] live on every request, so calling
/// [setAccessToken] takes effect immediately for subsequent calls. The token
/// lives for the process lifetime only — there is no disk persistence yet
/// (matches the `MemoryStore` storage seam).
// TODO(auth): persist the token (and refresh token) once the storage seam is
// backed by a disk store, so sign-in survives restarts + supports refresh.
class SessionAuthTokenStore implements AuthTokenStore {
  SessionAuthTokenStore({String? initialToken}) : _token = initialToken;

  String? _token;

  /// Replaces the current token (pass `null` / empty to sign out).
  void setAccessToken(String? token) => _token = token;

  /// Clears the token (sign out).
  void clear() => _token = null;

  @override
  Future<String?> readAccessToken() async =>
      (_token == null || _token!.isEmpty) ? null : _token;
}

/// The single session token store instance. Seeded with the dev token so the
/// dev path works out of the box; the Google sign-in flow overwrites it.
///
/// `main.dart` binds [authTokenStoreProvider] to this so `ApiClient` and the
/// sign-in flow share one instance.
@Riverpod(keepAlive: true)
SessionAuthTokenStore sessionAuthTokenStore(Ref ref) =>
    SessionAuthTokenStore(initialToken: kDevAccessToken);
