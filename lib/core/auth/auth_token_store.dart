/// Supplies the bearer access token used to authenticate API requests.
///
/// This is the auth seam. Today it is satisfied by a dev shim that returns a
/// hand-pasted JWT (see `DevAuthTokenStore`). Later, a `features/auth` Google
/// sign-in flow will implement this interface (storing tokens it receives from
/// the backend's `POST /auth/google`) and the binding in `authTokenStoreProvider`
/// will point at it — `ApiClient` and everything above it stay unchanged.
abstract interface class AuthTokenStore {
  /// The current access token, or `null` when unauthenticated. When `null`,
  /// `ApiClient` sends no `Authorization` header.
  Future<String?> readAccessToken();
}
