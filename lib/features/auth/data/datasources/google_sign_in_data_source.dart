import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:desktop_turn_management/core/network/api_exception.dart';
import 'package:desktop_turn_management/features/auth/data/datasources/google_oauth_config.dart';
import 'package:dio/dio.dart';
import 'package:url_launcher/url_launcher.dart';

/// Runs the desktop Google OAuth flow and returns a Google **ID token**.
///
/// Uses the standard "installed app" loopback + PKCE flow:
///   1. start a one-shot local HTTP server on a random `localhost` port,
///   2. open the system browser at Google's consent screen,
///   3. catch the redirect (`http://localhost:<port>/?code=…`),
///   4. exchange the code (+ PKCE verifier + client secret) for tokens,
///   5. hand back the `id_token` — the backend's `POST /auth/google` verifies it.
///
/// Google's loopback redirect matches the registered `http://localhost` and
/// ignores the port, so a fresh random port each time is fine.
class GoogleSignInDataSource {
  GoogleSignInDataSource({Dio? tokenClient}) : _dio = tokenClient ?? Dio();

  final Dio _dio;

  static const List<String> _scopes = ['openid', 'email', 'profile'];

  /// How long to wait for the user to finish in the browser before giving up.
  static const Duration _timeout = Duration(minutes: 3);

  Future<String> signIn() async {
    final config = await GoogleOAuthConfig.load();

    final verifier = _randomUrlSafe(64);
    final challenge = _codeChallenge(verifier);
    final state = _randomUrlSafe(24);

    final HttpServer server;
    try {
      server = await HttpServer.bind(InternetAddress.loopbackIPv4, 0);
    } catch (e) {
      throw ApiException(
        type: ApiErrorType.unknown,
        message: 'Could not start the local sign-in listener.',
        cause: e,
      );
    }
    final redirectUri = 'http://localhost:${server.port}';

    try {
      final authUrl = Uri.parse(config.authUri).replace(queryParameters: {
        'client_id': config.clientId,
        'redirect_uri': redirectUri,
        'response_type': 'code',
        'scope': _scopes.join(' '),
        'code_challenge': challenge,
        'code_challenge_method': 'S256',
        'state': state,
        'access_type': 'offline',
        'prompt': 'select_account',
      });

      final bool launched;
      try {
        launched = await launchUrl(authUrl, mode: LaunchMode.externalApplication);
      } catch (e) {
        throw ApiException(
          type: ApiErrorType.unknown,
          message: 'Could not open the browser for Google sign-in.',
          cause: e,
        );
      }
      if (!launched) {
        throw const ApiException(
          type: ApiErrorType.unknown,
          message: 'Could not open the browser for Google sign-in.',
        );
      }

      final code = await _awaitRedirect(server, expectedState: state);

      return await _exchangeCode(
        config: config,
        code: code,
        codeVerifier: verifier,
        redirectUri: redirectUri,
      );
    } finally {
      await server.close(force: true);
    }
  }

  /// Waits for Google's redirect request, validates `state`, and returns the
  /// authorization `code`. Replies to the browser with a small "done" page.
  Future<String> _awaitRedirect(
    HttpServer server, {
    required String expectedState,
  }) async {
    final completer = Completer<String>();

    final subscription = server.listen((HttpRequest request) async {
      final params = request.uri.queryParameters;
      // Ignore stray requests (e.g. favicon) that carry no OAuth result.
      if (!params.containsKey('code') && !params.containsKey('error')) {
        request.response.statusCode = HttpStatus.noContent;
        await request.response.close();
        return;
      }

      _writeBrowserResponse(request.response, params.containsKey('code'));
      await request.response.close();

      if (completer.isCompleted) return;
      if (params['error'] != null) {
        completer.completeError(ApiException(
          type: ApiErrorType.unauthorized,
          message: 'Google sign-in was cancelled or denied (${params['error']}).',
        ));
      } else if (params['state'] != expectedState) {
        completer.completeError(const ApiException(
          type: ApiErrorType.unknown,
          message: 'Google sign-in failed a security check (state mismatch).',
        ));
      } else {
        completer.complete(params['code']!);
      }
    });

    try {
      return await completer.future.timeout(
        _timeout,
        onTimeout: () => throw const ApiException(
          type: ApiErrorType.timeout,
          message: 'Google sign-in timed out. Please try again.',
        ),
      );
    } finally {
      await subscription.cancel();
    }
  }

  /// Exchanges the authorization code for tokens and returns the `id_token`.
  Future<String> _exchangeCode({
    required GoogleOAuthConfig config,
    required String code,
    required String codeVerifier,
    required String redirectUri,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        config.tokenUri,
        data: {
          'code': code,
          'client_id': config.clientId,
          'client_secret': config.clientSecret,
          'redirect_uri': redirectUri,
          'grant_type': 'authorization_code',
          'code_verifier': codeVerifier,
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );
      final idToken = response.data?['id_token'] as String?;
      if (idToken == null || idToken.isEmpty) {
        throw const ApiException(
          type: ApiErrorType.deserialization,
          message: 'Google did not return an ID token.',
        );
      }
      return idToken;
    } on DioException catch (e) {
      throw ApiException(
        type: ApiErrorType.unknown,
        message: 'Could not complete Google sign-in (token exchange failed).',
        cause: e,
      );
    }
  }

  void _writeBrowserResponse(HttpResponse response, bool success) {
    response.headers.contentType = ContentType.html;
    response.write(
      '<!doctype html><html><head><meta charset="utf-8">'
      '<title>Reservations Manager</title></head>'
      '<body style="font-family:sans-serif;text-align:center;margin-top:15%">'
      '<h2>${success ? 'Signed in' : 'Sign-in failed'}</h2>'
      '<p>You can close this tab and return to Reservations Manager.</p>'
      '</body></html>',
    );
  }

  // ── PKCE helpers ────────────────────────────────────────────────────────

  /// A random URL-safe string (unreserved chars) of [length] characters.
  String _randomUrlSafe(int length) {
    const chars =
        'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-._~';
    final rnd = Random.secure();
    return List.generate(length, (_) => chars[rnd.nextInt(chars.length)]).join();
  }

  /// S256 code challenge: base64url(sha256(verifier)) without padding.
  String _codeChallenge(String verifier) {
    final digest = sha256.convert(utf8.encode(verifier));
    return base64Url.encode(digest.bytes).replaceAll('=', '');
  }
}
