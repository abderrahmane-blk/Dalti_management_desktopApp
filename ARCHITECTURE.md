# Architecture

A Flutter **desktop** client (Windows / Linux / macOS) for managing
reservations served by an existing backend REST API. This document describes
the layering and — most importantly — the two seams that are designed to absorb
future change without rippling into the UI or domain code:

1. **Realtime seam:** polling now → SSE / WebSockets later.
2. **Storage seam:** in-memory now → local database + sync later.

---

## Layering (strict feature-first)

```
lib/
  app/        MaterialApp, router (go_router), theme — composition only
  core/       cross-cutting infrastructure (network, realtime, storage, sync, result)
  features/
    <feature>/
      data/         models (DTOs), datasources (remote+local), repository impl
      domain/       entities (pure), repository interface
      presentation/ providers (Riverpod), screens, widgets
```

**Dependency rule.** Presentation → domain → (data implements domain). The
presentation/providers and UI depend **only** on the abstract repository in
`domain/repositories`; they never import `dio`, the `KeyValueStore`, or the
concrete datasources. DTOs (`data/models`) never escape a repository — the
repository maps DTO ↔ entity.

State management is **Riverpod with code generation** (`@riverpod`). Every
dependency — API client, repositories, datasources, stores, realtime sources —
is a provider, so each can be overridden in `main.dart` and in tests. There are
no global singletons.

Error handling: `dio` errors are mapped to `ApiException` in `ApiClient`
(the single place transport errors exist). Repositories convert thrown
`ApiException`s into a `Result<T>` (`Ok`/`Err`) via `guard(...)`, so no raw
exception reaches the UI.

---

## Realtime seam — `core/realtime/`

The UI must not know *how* data arrives. It is fed by a single abstraction:

```dart
abstract interface class RealtimeSource<T> {
  Stream<T> watch();        // current value, then updates; errors via stream errors
  Future<void> dispose();
}
```

**Today:** `PollingSource<T>` implements it by calling a `fetch` callback every
`interval` and emitting the result on a broadcast stream. It is transport- and
domain-agnostic — it knows nothing about HTTP or reservations; it is just handed
a `Future<T> Function()`.

**Wiring (the swap point).** For a feature, exactly one provider constructs the
source. For reservations:

```dart
// features/reservations/presentation/providers/reservation_providers.dart
@riverpod
RealtimeSource<List<Reservation>> reservationsRealtimeSource(Ref ref) {
  final repo = ref.watch(reservationRepositoryProvider);
  final config = ref.watch(appConfigProvider);
  final source = PollingSource<List<Reservation>>(
    interval: config.pollInterval,
    fetch: () async { /* repo.fetchReservations() → throw on Err */ },
  );
  ref.onDispose(source.dispose);
  return source;
}
```

The `Reservations` `AsyncNotifier` only does `ref.watch(reservationsRealtimeSourceProvider).watch().listen(...)`.

### Transition: polling → SSE → WebSockets

1. Add `core/realtime/sse_source.dart` (and later `socket_source.dart`)
   implementing `RealtimeSource<T>` — same interface, push-based instead of
   pull-based. Stream errors keep the same contract.
2. Change **one** provider: bind `reservationsRealtimeSourceProvider` (or
   override it in `main.dart`) to return the new source instead of
   `PollingSource`.

Nothing in `domain/`, the notifier, or any widget changes. The notifier already
consumes a `Stream<T>`; whether each event came from a 5-second poll or a socket
frame is invisible to it.

---

## Storage seam — `core/storage/`

Local persistence is behind a narrow interface:

```dart
abstract interface class KeyValueStore {
  Future<void> write(String key, Object? value);   // value is JSON-encodable
  Future<Object?> read(String key);
  Future<void> delete(String key);
  Future<void> clear();
  Future<bool> containsKey(String key);
}
```

**Today:** `MemoryStore` (a `Map`). Lives for the process lifetime only.

Local datasources (e.g. `ReservationLocalDataSource`) depend on
`KeyValueStore` and store only JSON-encodable maps (`dto.toJson()`), exactly
what a disk-backed store would persist.

### Transition: memory → local database

1. Add an implementation (drift / sqlite / isar / hive) of `KeyValueStore` — or
   a richer typed cache interface that extends it.
2. Change **one** binding: `keyValueStoreProvider` (or override it in
   `main.dart`).

Datasources, repositories, providers and UI are untouched, because they only
ever saw the interface and JSON-encodable values.

---

## Sync seam — `core/sync/`

A `SyncEngine` interface is wired through the app today but **inert**
(`NoOpSyncEngine`): every operation is a successful no-op and the status stream
reports `idle`. The reservations repository already takes a `SyncEngine` via DI.

When real offline/sync support is needed (a queue of pending mutations, conflict
resolution, delta pull), implement `SyncEngine` and override **one** binding:
`syncEngineProvider`. The hybrid in-memory ↔ persisted model then becomes:
realtime source → repository (writes through to local store) → sync engine
reconciles local and remote in the background.

---

## Composition root — `main.dart`

`ProviderScope` binds the swappable seams in one place:

```dart
overrides: [
  appConfigProvider.overrideWithValue(AppConfig.dev),     // environment / base URL
  keyValueStoreProvider.overrideWithValue(MemoryStore()), // → DB-backed later
  syncEngineProvider.overrideWithValue(const NoOpSyncEngine()), // → real engine later
],
```

The realtime transport is overridden per feature (e.g.
`reservationsRealtimeSourceProvider.overrideWith(...)`), which is also how the
widget test injects a fake source with no backend.

---

## Reference slice — `features/reservations/`

End-to-end template to copy for new features:

| Layer | File |
|-------|------|
| Entity (pure) | `domain/entities/reservation.dart` |
| Repository interface | `domain/repositories/reservation_repository.dart` |
| DTO (freezed + json) | `data/models/reservation_dto.dart` |
| Remote datasource (Dio) | `data/datasources/reservation_remote_data_source.dart` |
| Local datasource (store) | `data/datasources/reservation_local_data_source.dart` |
| Repository impl | `data/repositories/reservation_repository_impl.dart` |
| Providers + realtime wiring | `presentation/providers/reservation_providers.dart` |
| AsyncNotifier (list state) | `presentation/providers/reservations_notifier.dart` |
| Screen / widgets | `presentation/screens/`, `presentation/widgets/` |

---

## Code generation

Riverpod, Freezed and json_serializable are generated. After changing an
annotated file:

```sh
dart run build_runner build          # one-off
dart run build_runner watch          # continuous
```

> Note: recent `build_runner` no longer accepts `--delete-conflicting-outputs`
> (it conflicts/cleans automatically); the flag is ignored if passed.

## Linting

`analysis_options.yaml` includes `flutter_lints`, strict casts/raw-types, and
excludes generated files. `riverpod_lint` + `custom_lint` are **not** enabled
yet: as of this writing no published pair is compatible with the pinned
`flutter_riverpod 3.3.x` (riverpod 3.2.1) + `freezed_annotation 3.1.x` +
analyzer 12 toolchain (`riverpod_lint 3.1.4-dev.1` needs `analyzer_plugin
^0.14.0`, which no `custom_lint` release provides). The file documents the
exact two-line change to enable them once compatible versions ship.
```
