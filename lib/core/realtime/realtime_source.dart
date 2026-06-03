/// Abstract source of a continuously-updating resource of type [T].
///
/// This is the seam that lets the app move from polling → SSE → WebSockets
/// without the domain or UI layers ever knowing how updates arrive. Consumers
/// (feature providers) depend on `RealtimeSource<T>` via DI and simply listen
/// to [watch]; switching transport means binding a different implementation in
/// one provider.
///
/// Implementations:
///  * `PollingSource`  — implemented now (periodic repository fetch).
///  * `SseSource`      — later, same interface, server-sent events.
///  * `SocketSource`   — later, same interface, WebSocket push.
abstract interface class RealtimeSource<T> {
  /// A stream of the latest known state of the resource.
  ///
  /// The stream should emit the current value as soon as practical after the
  /// first listener subscribes, then emit again whenever the value changes.
  /// Transport/fetch failures are delivered as stream errors so consumers can
  /// surface them without the stream terminating.
  Stream<T> watch();

  /// Releases any timers, sockets, or subscriptions held by the source.
  Future<void> dispose();
}
