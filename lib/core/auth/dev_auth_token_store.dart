import 'package:desktop_turn_management/core/auth/auth_token_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dev_auth_token_store.g.dart';

/// ============================================================================
/// DEV ONLY — paste your JWT access token here.
/// ============================================================================
///
/// Until Google sign-in is implemented, requests are authenticated with a token
/// you provide by hand. Get one from the backend's `POST /auth/google` (it
/// returns a JWT), then either:
///
///   • paste it between the quotes in [_pastedToken] below, OR
///   • pass it at launch (preferred, keeps it out of source control):
///       flutter run -d linux --dart-define=ACCESS_TOKEN=eyJhbGciOi...
///
/// Do NOT commit a real token.
const String _pastedToken = '';

/// Resolved dev token: `--dart-define=ACCESS_TOKEN` wins, else [_pastedToken].
const String kDevAccessToken =
    String.fromEnvironment('ACCESS_TOKEN', defaultValue: _pastedToken);

/// [AuthTokenStore] backed by the compile-time dev token above.
class DevAuthTokenStore implements AuthTokenStore {
  const DevAuthTokenStore();

  @override
  Future<String?> readAccessToken() async =>
      kDevAccessToken.isEmpty ? null : kDevAccessToken;
}

/// App-wide auth-token binding. Defaults to the dev shim; override (here or in
/// `main.dart`) once a real Google-auth-backed store exists.
@Riverpod(keepAlive: true)
AuthTokenStore authTokenStore(Ref ref) => const DevAuthTokenStore();
