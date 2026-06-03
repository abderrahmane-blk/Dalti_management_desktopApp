# CLAUDE.md

Guidance for AI agents (and humans) working in this repository.

## What this is

`desktop_turn_management` — a Flutter **desktop** app (Windows / Linux / macOS;
no mobile/web yet) for clinics/organisations to manage reservations. It is a
client for an existing backend; it owns no business logic the backend doesn't.

The app title shown to users is **"Reservations Manager"**.

## Current state (read before changing things)

- **Foundation only.** One reference feature (`reservations`) is wired
  end-to-end as a template. Build new features by copying its shape.
- **UI is intentionally minimal** — mostly plain text, light theme only. Do
  **not** invest in styling yet; functionality comes first. Keep widgets small.
- **Not connected to the real backend.** Endpoints in
  `ReservationRemoteDataSource` are placeholders (see its `TODO`). `AppConfig.dev`
  points at the backend host but the request paths/DTOs aren't matched yet.
- **Auth is a dev shim.** A hand-pasted JWT is injected as a bearer token; there
  is no login screen yet. See "Auth" below.

## Commands

```sh
# Code generation (Riverpod, Freezed, json_serializable). Run after editing any
# @riverpod / @freezed / @JsonSerializable file.
dart run build_runner build         # one-off
dart run build_runner watch         # continuous
#   NOTE: recent build_runner ignores --delete-conflicting-outputs (auto-cleans).

flutter run -d linux                # or -d macos / -d windows
flutter analyze                     # must stay clean ("No issues found!")
flutter test
```

## Architecture (see ARCHITECTURE.md for the full picture)

Strict **feature-first** layering under `lib/features/<feature>/{data,domain,presentation}`,
with cross-cutting infra in `lib/core/` and composition in `lib/app/` + `main.dart`.

Hard rules — keep these intact:

1. **Repository pattern.** Presentation/providers depend only on the abstract
   repository in `domain/repositories`. Never import `dio`, `KeyValueStore`, or
   concrete datasources from presentation/domain.
2. **DTOs stay in the data layer.** `data/models` DTOs never reach the UI;
   repositories map DTO ↔ entity.
3. **Riverpod with codegen** (`@riverpod`). Every dependency is a provider so it
   can be overridden in `main.dart` and tests. No global singletons. Use
   `AsyncNotifier` for server-backed state.
4. **Errors → `Result`.** `dio` errors are mapped to `ApiException` in
   `ApiClient` (the only place transport errors exist); repositories return
   `Result<T>` (`Ok`/`Err`). No raw exceptions reach the UI.
5. **Models are immutable** (Freezed).

### The seams (designed swap points — change one binding, nothing else)

| Seam | Interface | Default impl | Swap by overriding |
|------|-----------|--------------|--------------------|
| Realtime | `core/realtime/RealtimeSource<T>` | `PollingSource` | `reservationsRealtimeSourceProvider` (per feature) → SSE/socket later |
| Storage | `core/storage/KeyValueStore` | `MemoryStore` | `keyValueStoreProvider` → local DB later |
| Sync | `core/sync/SyncEngine` | `NoOpSyncEngine` (inert) | `syncEngineProvider` |
| Auth token | `core/auth/AuthTokenStore` | `DevAuthTokenStore` | `authTokenStoreProvider` → Google auth later |

## Auth

There is no login flow yet. `ApiClient` adds `Authorization: Bearer <token>` from
`AuthTokenStore`. The default `DevAuthTokenStore` reads a JWT from
`lib/core/auth/dev_auth_token_store.dart`:

- pass at launch: `flutter run -d linux --dart-define=ACCESS_TOKEN=eyJ...`, or
- paste into the `_pastedToken` constant in that file.

If the token is empty, requests go out unauthenticated (backend will 401 →
`ApiException(unauthorized)`). Never commit a real token.

When implementing real auth: add a `features/auth` slice doing Google sign-in,
have it call the backend's `POST /auth/google`, store the returned JWT, implement
`AuthTokenStore` from it, and override `authTokenStoreProvider`. Nothing in
`ApiClient` or above changes.

## Backend (DO NOT integrate yet — just know where it is)

- Location: `../Dalti_Reservation-backend` (sibling dir; .NET, feature-sliced
  Minimal API, has its own `CLAUDE.md`).
- Dev URLs: `http://localhost:5289` (http profile), `https://localhost:7124`.
- Auth: `POST /auth/google` (`{ idToken }` → JWT), `POST /auth/refresh`,
  `GET /users/me`. Most endpoints `RequireAuthorization()` (bearer JWT).
- Reservations (`/reservations` group, mostly authorized):
  `GET /reservations/today-and-future`, `GET /reservations/tomorrow-and-after`,
  `GET /my-reservations`, `GET /reservations/{id}`,
  `PATCH /reservations/{id}/status`, `GET /reservations/{id}/position`,
  `POST /reserve`, `POST /reservations/{id}/pass-to-next-queue`.
- Other feature areas present: Queues, ServicePoints, Organizations, Browse, Map.

## Linting

`analysis_options.yaml` includes `flutter_lints`, strict casts/raw-types, and
excludes generated files. `riverpod_lint` + `custom_lint` are **not** installed:
no published pair is compatible with the pinned `flutter_riverpod 3.3.x`
(riverpod 3.2.1) + `freezed_annotation 3.1.x` + analyzer 12 toolchain. The file
documents how to enable them once compatible versions ship. Prefer `dart fix
--apply` to clean up style lints.

## Conventions for agents

- After editing annotated files, **run build_runner** and keep `flutter analyze`
  clean before finishing.
- Keep the UI minimal until told otherwise; don't add styling, packages, or
  screens speculatively.
- Don't wire the real backend or build the login UI unless asked.
- New feature = copy the `reservations` slice structure exactly.
