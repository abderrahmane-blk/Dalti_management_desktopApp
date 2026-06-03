/// Coarse classification of transport/HTTP failures, decoupled from `dio` so
/// the UI and domain layers can branch on failure kind without importing the
/// networking package.
enum ApiErrorType {
  /// No connectivity / DNS / socket failure.
  network,

  /// Connect/send/receive timed out.
  timeout,

  /// HTTP 401/403.
  unauthorized,

  /// HTTP 404.
  notFound,

  /// HTTP 4xx other than 401/403/404.
  badRequest,

  /// HTTP 5xx.
  server,

  /// Request was cancelled.
  cancelled,

  /// Response body could not be parsed into the expected shape.
  deserialization,

  /// Anything not covered above.
  unknown,
}

/// The single exception type allowed to cross out of the network layer.
///
/// `dio`'s [DioException] (and any parsing error) is mapped to this in
/// `ApiClient`, so repositories only ever catch [ApiException] and translate it
/// into a `Result`.
class ApiException implements Exception {
  const ApiException({
    required this.type,
    required this.message,
    this.statusCode,
    this.cause,
  });

  final ApiErrorType type;
  final String message;
  final int? statusCode;

  /// The originating error (e.g. the `DioException`), kept for logging only —
  /// never surfaced to the UI.
  final Object? cause;

  bool get isUnauthorized => type == ApiErrorType.unauthorized;

  @override
  String toString() =>
      'ApiException(${type.name}, status: $statusCode, message: $message)';
}
