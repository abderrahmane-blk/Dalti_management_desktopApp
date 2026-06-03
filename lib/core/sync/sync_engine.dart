import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sync_engine.g.dart';

/// High-level state of the background synchronization process.
enum SyncState { idle, syncing, error }

/// A snapshot of sync status, suitable for surfacing in the UI later.
class SyncStatus {
  const SyncStatus({required this.state, this.lastSyncedAt, this.message});

  final SyncState state;
  final DateTime? lastSyncedAt;
  final String? message;

  static const SyncStatus idle = SyncStatus(state: SyncState.idle);
}

/// Future seam for reconciling local (offline) state with the backend.
///
/// Today everything is fetched live and held in memory, so there is nothing to
/// reconcile — but the interface is wired through the app now (inert) so that a
/// real implementation (queue of pending mutations, conflict resolution,
/// delta pull) can be dropped in by overriding `syncEngineProvider` only.
///
/// See ARCHITECTURE.md › Sync seam.
abstract interface class SyncEngine {
  /// Pushes locally-queued mutations to the backend.
  Future<void> push();

  /// Pulls remote changes into the local store.
  Future<void> pull();

  /// Convenience: [pull] then [push] (or whatever order a real engine needs).
  Future<void> sync();

  /// Observable status for UI badges / indicators.
  Stream<SyncStatus> watchStatus();
}

/// Inert [SyncEngine]: every operation is a successful no-op and the status
/// stream reports a single [SyncStatus.idle]. Lets call sites and providers be
/// written against sync today without changing behaviour.
class NoOpSyncEngine implements SyncEngine {
  const NoOpSyncEngine();

  @override
  Future<void> push() async {}

  @override
  Future<void> pull() async {}

  @override
  Future<void> sync() async {}

  @override
  Stream<SyncStatus> watchStatus() => Stream.value(SyncStatus.idle);
}

/// App-wide [SyncEngine] binding. Defaults to [NoOpSyncEngine]; override to
/// install a real engine later.
@Riverpod(keepAlive: true)
SyncEngine syncEngine(Ref ref) => const NoOpSyncEngine();
