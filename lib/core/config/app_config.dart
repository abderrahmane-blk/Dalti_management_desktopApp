import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_config.g.dart';

/// Immutable runtime configuration for the app.
///
/// Kept tiny on purpose; richer environment handling (flavors, --dart-define,
/// secrets) can extend this without touching consumers, since everything reads
/// it through [appConfigProvider].
class AppConfig {
  const AppConfig({
    required this.baseUrl,
    this.connectTimeout = const Duration(seconds: 10),
    this.receiveTimeout = const Duration(seconds: 10),
    this.pollInterval = const Duration(seconds: 5),
  });

  /// Base URL of the backend REST API, e.g. `https://api.example.com/v1`.
  final String baseUrl;
  final Duration connectTimeout;
  final Duration receiveTimeout;

  /// Default interval used by `PollingSource`. SSE/WebSocket sources ignore it.
  final Duration pollInterval;

  /// Local-development defaults.
  ///
  /// Points at the Dalti reservation backend (.NET, see CLAUDE.md). The HTTP
  /// dev profile listens on :5289 (HTTPS is :7124). Endpoints are NOT wired to
  /// the real API yet — see `ReservationRemoteDataSource`.
  static const AppConfig dev = AppConfig(
    baseUrl: 'http://localhost:5289',
  );
}

/// Exposes [AppConfig] to the provider graph.
///
/// This intentionally throws if not overridden: `main.dart` (and tests) must
/// inject a concrete config via `appConfigProvider.overrideWithValue(...)`,
/// which keeps environment selection explicit and out of library code.
@riverpod
AppConfig appConfig(Ref ref) =>
    throw UnimplementedError('appConfigProvider must be overridden in main()');
