import 'package:desktop_turn_management/app/app.dart';
import 'package:desktop_turn_management/core/config/app_config.dart';
import 'package:desktop_turn_management/core/storage/memory_store.dart';
import 'package:desktop_turn_management/core/sync/sync_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    ProviderScope(
      // Top-level composition root. Every swappable seam is bound here, so
      // changing environment, storage, or sync is a one-line edit:
      //
      //  * appConfig     — environment / base URL (must be provided).
      //  * keyValueStore — swap MemoryStore() for a DB-backed store later.
      //  * syncEngine     — swap NoOpSyncEngine() for a real engine later.
      //
      // Auth: `authTokenStoreProvider` defaults to the dev shim that reads a
      // hand-pasted JWT (lib/core/auth/dev_auth_token_store.dart). When Google
      // sign-in lands, override it here with the real token store.
      //
      // The realtime transport (polling → SSE → socket) is overridden per
      // feature, e.g. `reservationsRealtimeSourceProvider.overrideWith(...)`.
      overrides: [
        appConfigProvider.overrideWithValue(AppConfig.dev),
        keyValueStoreProvider.overrideWithValue(MemoryStore()),
        syncEngineProvider.overrideWithValue(const NoOpSyncEngine()),
      ],
      child: const ReservationsManagerApp(),
    ),
  );
}
