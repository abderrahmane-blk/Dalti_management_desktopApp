import 'dart:async';

import 'package:desktop_turn_management/core/realtime/realtime_source.dart';

/// [RealtimeSource] that emulates realtime updates by re-fetching on a fixed
/// [interval].
///
/// It is transport-agnostic: it knows nothing about HTTP, repositories, or
/// reservations — it is handed a [fetch] callback that returns the latest
/// value. This is what makes the polling→SSE→socket swap a one-line provider
/// change: only the binding that constructs the source changes, never this
/// class or its consumers.
///
/// Behaviour:
///  * Fetches immediately when the first listener subscribes, then every
///    [interval].
///  * A thrown error from [fetch] is forwarded via `addError` and does **not**
///    stop polling — the next tick still runs.
///  * Overlapping ticks are skipped while a fetch is in flight.
///  * Uses a broadcast stream and cancels the timer when the last listener
///    leaves.
class PollingSource<T> implements RealtimeSource<T> {
  PollingSource({
    required this._fetch,
    this.interval = const Duration(seconds: 5),
  });

  final Future<T> Function() _fetch;
  final Duration interval;

  StreamController<T>? _controller;
  Timer? _timer;
  bool _inFlight = false;
  bool _disposed = false;

  @override
  Stream<T> watch() {
    if (_disposed) {
      throw StateError('PollingSource has been disposed');
    }
    final controller = _controller ??= StreamController<T>.broadcast(
      onListen: _onListen,
      onCancel: _onCancel,
    );
    return controller.stream;
  }

  void _onListen() {
    unawaited(_poll());
    _timer = Timer.periodic(interval, (_) => unawaited(_poll()));
  }

  void _onCancel() {
    _timer?.cancel();
    _timer = null;
  }

  Future<void> _poll() async {
    if (_inFlight || _disposed) return;
    _inFlight = true;
    try {
      final value = await _fetch();
      if (!_disposed) _controller?.add(value);
    } catch (error, stackTrace) {
      if (!_disposed) _controller?.addError(error, stackTrace);
    } finally {
      _inFlight = false;
    }
  }

  @override
  Future<void> dispose() async {
    _disposed = true;
    _timer?.cancel();
    _timer = null;
    await _controller?.close();
    _controller = null;
  }
}
