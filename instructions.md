# Instructions

Practical getting-started and the plan for what's next. For deeper design notes
see `ARCHITECTURE.md`; for AI-agent rules see `CLAUDE.md`.

## What this is

A desktop client (Windows / Linux / macOS) for managing reservations from the
Dalti backend. Right now it is a **working skeleton**: a real architecture with
one feature (`reservations`) wired end-to-end, a bare text UI, and a temporary
way to authenticate by pasting a token. The goal at this stage is to get core
functionality working — not to make it pretty.

## Prerequisites

- Flutter 3.44+ / Dart 3.12+ (`flutter --version`).
- Desktop enabled (`linux/`, `macos/`, `windows/` already exist here).
- Linux desktop builds need the GTK/clang toolchain (`flutter doctor`).

## First run

```sh
flutter pub get
dart run build_runner build          # generate Riverpod/Freezed/JSON code
flutter run -d linux                 # or -d macos / -d windows
```

You'll see a light, text-only "Reservations" screen with a Refresh action.
Until the backend is wired up and you provide a token, the list will show an
error (that's expected — see below).

## Authentication (temporary)

There is **no login screen yet**. The app sends a JWT as a bearer token on every
request. Provide one of two ways:

1. **At launch (preferred — keeps secrets out of git):**
   ```sh
   flutter run -d linux --dart-define=ACCESS_TOKEN=eyJhbGciOi...
   ```
2. **Pasted in code (quick & dirty):** open
   `lib/core/auth/dev_auth_token_store.dart` and paste the JWT between the quotes
   in `_pastedToken`.

Get a token from the backend's `POST /auth/google` (it validates a Google ID
token and returns a JWT). Without a token, requests go out unauthenticated and
the backend returns 401 → the UI shows "You are not authorized."

> Do **not** commit a real token.

## Working with code generation

This project uses generated code (`*.g.dart`, `*.freezed.dart`). After editing
any file with `@riverpod`, `@freezed`, or JSON annotations, run:

```sh
dart run build_runner build      # or: dart run build_runner watch
```

(Recent `build_runner` no longer needs/accepts `--delete-conflicting-outputs`.)

## Backend

The backend is a separate .NET project at `../Dalti_Reservation-backend`
(dev URL `http://localhost:5289`). It is **not integrated yet** — only its
location and endpoints are documented (see `CLAUDE.md`). To integrate later,
update `ReservationRemoteDataSource` to the real routes/DTOs.

## Current focus & limitations

- ✅ Architecture, DI, error handling, the four swap-seams (realtime / storage /
  sync / auth), one reference feature, passing test.
- ⛔ Bare UI (text only, light theme) — intentional.
- ⛔ No real backend calls (placeholder endpoint).
- ⛔ No login UI (token pasted by hand).
- ⛔ In-memory only (no persistence), polling only (no SSE/sockets), sync inert.

## Roadmap (rough order)

1. **Backend integration** — point `ReservationRemoteDataSource` at the real
   reservation endpoints and match the DTO to the backend's shape.
2. **Google auth feature** — `features/auth` with Google sign-in → `POST
   /auth/google`, store the JWT, implement `AuthTokenStore`, override
   `authTokenStoreProvider`, add a login gate. Then delete the dev token shim.
3. **More features** — queues, service points, organizations (copy the
   `reservations` slice).
4. **Persistence** — replace `MemoryStore` with a local DB (`keyValueStoreProvider`).
5. **Realtime upgrade** — add an SSE/WebSocket `RealtimeSource` and override
   `reservationsRealtimeSourceProvider`.
6. **Sync** — implement a real `SyncEngine` for hybrid offline/online.
7. **UI pass** — only once the above works.
