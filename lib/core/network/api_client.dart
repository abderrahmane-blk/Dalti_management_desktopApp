import 'package:desktop_turn_management/core/auth/auth_token_store.dart';
import 'package:desktop_turn_management/core/auth/dev_auth_token_store.dart';
import 'package:desktop_turn_management/core/config/app_config.dart';
import 'package:desktop_turn_management/core/network/api_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_client.g.dart';

/// Thin wrapper around `dio` that is the *only* place transport errors exist.
///
/// Every method returns the decoded JSON body and throws an [ApiException] on
/// failure. Remote datasources call these methods and never touch `dio`
/// directly, so swapping the HTTP engine (or adding auth/retry interceptors)
/// is contained here.
class ApiClient {
  ApiClient({
    required AppConfig config,
    required AuthTokenStore tokenStore,
    Dio? dio,
  }) : _dio = (dio ?? Dio())
          ..options.baseUrl = config.baseUrl
          ..options.connectTimeout = config.connectTimeout
          ..options.receiveTimeout = config.receiveTimeout
          ..options.headers['Content-Type'] = 'application/json' {
    // Inject `Authorization: Bearer <token>` on every request from the auth
    // seam. Today the token is the hand-pasted dev JWT; when Google sign-in
    // lands, only the AuthTokenStore binding changes — this stays put.
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Requests opt out of auth with `extra['skipAuth'] == true` (e.g. an
        // anonymous walk-in, which must not be filed under the operator).
        if (options.extra['skipAuth'] != true) {
          final token = await tokenStore.readAccessToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
        }
        handler.next(options);
      },
    ));
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
        requestBody: true,
        responseBody: false,
      ));
    }
  }

  final Dio _dio;

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return _send(() => _dio.get<dynamic>(path, queryParameters: queryParameters));
  }

  /// POSTs [data] to [path]. Set [authenticated] to `false` to send the request
  /// without the bearer token (used for anonymous endpoints like walk-in
  /// registration).
  Future<dynamic> post(
    String path, {
    Object? data,
    bool authenticated = true,
  }) async {
    return _send(() => _dio.post<dynamic>(
          path,
          data: data,
          options: authenticated ? null : Options(extra: {'skipAuth': true}),
        ));
  }

  Future<dynamic> put(String path, {Object? data}) async {
    return _send(() => _dio.put<dynamic>(path, data: data));
  }

  Future<dynamic> patch(String path, {Object? data}) async {
    return _send(() => _dio.patch<dynamic>(path, data: data));
  }

  Future<dynamic> delete(String path, {Object? data}) async {
    return _send(() => _dio.delete<dynamic>(path, data: data));
  }

  /// Executes [request], returning the response body or throwing a mapped
  /// [ApiException].
  Future<dynamic> _send(Future<Response<dynamic>> Function() request) async {
    try {
      final response = await request();
      return response.data;
    } on DioException catch (e) {
      throw _mapDioException(e);
    }
  }

  ApiException _mapDioException(DioException e) {
    final status = e.response?.statusCode;
    final ApiErrorType type = switch (e.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.sendTimeout ||
      DioExceptionType.receiveTimeout =>
        ApiErrorType.timeout,
      DioExceptionType.cancel => ApiErrorType.cancelled,
      DioExceptionType.connectionError => ApiErrorType.network,
      DioExceptionType.badResponse => _statusToType(status),
      _ => ApiErrorType.unknown,
    };
    return ApiException(
      type: type,
      statusCode: status,
      message: _messageFor(type, status),
      cause: e,
    );
  }

  ApiErrorType _statusToType(int? status) {
    if (status == null) return ApiErrorType.unknown;
    if (status == 401 || status == 403) return ApiErrorType.unauthorized;
    if (status == 404) return ApiErrorType.notFound;
    if (status >= 500) return ApiErrorType.server;
    if (status >= 400) return ApiErrorType.badRequest;
    return ApiErrorType.unknown;
  }

  String _messageFor(ApiErrorType type, int? status) => switch (type) {
        ApiErrorType.network => 'Could not reach the server.',
        ApiErrorType.timeout => 'The request timed out.',
        ApiErrorType.unauthorized => 'You are not authorized.',
        ApiErrorType.notFound => 'The requested resource was not found.',
        ApiErrorType.badRequest => 'The request was rejected ($status).',
        ApiErrorType.server => 'The server encountered an error ($status).',
        ApiErrorType.cancelled => 'The request was cancelled.',
        ApiErrorType.deserialization => 'The server response was malformed.',
        ApiErrorType.unknown => 'An unexpected error occurred.',
      };
}

/// Builds the shared [ApiClient] from the injected [AppConfig] and auth seam.
@riverpod
ApiClient apiClient(Ref ref) {
  return ApiClient(
    config: ref.watch(appConfigProvider),
    tokenStore: ref.watch(authTokenStoreProvider),
  );
}
