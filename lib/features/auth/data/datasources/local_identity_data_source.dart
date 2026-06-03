import 'dart:convert';

import 'package:desktop_turn_management/core/auth/auth_token_store.dart';
import 'package:desktop_turn_management/core/network/api_exception.dart';
import 'package:desktop_turn_management/features/auth/data/models/jwt_claims_dto.dart';

/// Resolves the current user's identity by decoding the JWT held in the
/// [AuthTokenStore] — no network call.
///
/// This is the dev stand-in for `GET /users/me`: until Google sign-in exists,
/// the pasted token *is* the identity. Replace this with a remote datasource
/// hitting `/users/me` later; the repository above stays the same.
class LocalIdentityDataSource {
  LocalIdentityDataSource(this._tokenStore);

  final AuthTokenStore _tokenStore;

  /// Decodes the access token's payload into [JwtClaimsDto].
  ///
  /// Throws [ApiException] (`unauthorized` when no token is configured,
  /// `deserialization` when the token is not a readable JWT).
  Future<JwtClaimsDto> currentClaims() async {
    final token = await _tokenStore.readAccessToken();
    if (token == null || token.isEmpty) {
      throw const ApiException(
        type: ApiErrorType.unauthorized,
        message:
            'No access token configured. Paste a dev JWT in dev_auth_token_store.dart.',
      );
    }
    try {
      final parts = token.split('.');
      if (parts.length != 3) {
        throw const FormatException('Not a JWT (expected three segments).');
      }
      final payload =
          utf8.decode(base64Url.decode(base64Url.normalize(parts[1])));
      return JwtClaimsDto.fromJson(jsonDecode(payload) as Map<String, dynamic>);
    } catch (e) {
      throw ApiException(
        type: ApiErrorType.deserialization,
        message: 'Could not read your identity from the access token.',
        cause: e,
      );
    }
  }
}
