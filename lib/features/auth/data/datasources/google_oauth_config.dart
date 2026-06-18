import 'dart:convert';
import 'dart:io';

import 'package:desktop_turn_management/core/network/api_exception.dart';

/// Google OAuth client credentials for the desktop ("installed") app.
///
/// Loaded at runtime from the `client_secret_*.json` Google hands out (the file
/// the user dropped in `./secret/`, which is git-ignored). Reading it at runtime
/// keeps the secret out of source and out of the compiled binary.
class GoogleOAuthConfig {
  const GoogleOAuthConfig({
    required this.clientId,
    required this.clientSecret,
    required this.authUri,
    required this.tokenUri,
  });

  final String clientId;
  final String clientSecret;
  final String authUri;
  final String tokenUri;

  /// Directory (relative to the working dir) the credentials file lives in.
  static const String _secretDir = 'secret';

  /// Reads the first `client_secret_*.json` from [_secretDir] and parses the
  /// `installed` (or `web`) block.
  ///
  /// Throws an [ApiException] when the file is missing or malformed so the UI
  /// can show a clear message instead of a raw I/O error.
  static Future<GoogleOAuthConfig> load() async {
    final dir = Directory(_secretDir);
    if (!dir.existsSync()) {
      throw const ApiException(
        type: ApiErrorType.unknown,
        message:
            'Missing the "secret/" folder with the Google client_secret JSON.',
      );
    }

    File? file;
    for (final entry in dir.listSync()) {
      final name = entry.uri.pathSegments.last;
      if (entry is File &&
          name.startsWith('client_secret') &&
          name.endsWith('.json')) {
        file = entry;
        break;
      }
    }
    if (file == null) {
      throw const ApiException(
        type: ApiErrorType.unknown,
        message: 'No client_secret_*.json found in the "secret/" folder.',
      );
    }

    try {
      final json = jsonDecode(await file.readAsString()) as Map<String, dynamic>;
      final block = (json['installed'] ?? json['web']) as Map<String, dynamic>;
      return GoogleOAuthConfig(
        clientId: block['client_id'] as String,
        clientSecret: block['client_secret'] as String,
        authUri: block['auth_uri'] as String,
        tokenUri: block['token_uri'] as String,
      );
    } catch (e) {
      throw ApiException(
        type: ApiErrorType.deserialization,
        message: 'The Google client_secret JSON could not be read.',
        cause: e,
      );
    }
  }
}
