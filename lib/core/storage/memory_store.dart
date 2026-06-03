import 'package:desktop_turn_management/core/storage/key_value_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'memory_store.g.dart';

/// In-memory [KeyValueStore]. Data lives only for the lifetime of the process.
///
/// Deliberately the simplest possible implementation; it exists so the rest of
/// the app can be written against persistence today and have a real database
/// dropped in later (see ARCHITECTURE.md › Storage seam).
class MemoryStore implements KeyValueStore {
  final Map<String, Object?> _data = <String, Object?>{};

  @override
  Future<void> write(String key, Object? value) async => _data[key] = value;

  @override
  Future<Object?> read(String key) async => _data[key];

  @override
  Future<void> delete(String key) async => _data.remove(key);

  @override
  Future<void> clear() async => _data.clear();

  @override
  Future<bool> containsKey(String key) async => _data.containsKey(key);
}

/// The app-wide [KeyValueStore] binding.
///
/// Defaults to [MemoryStore]; override in `main.dart`/tests to swap in a
/// disk-backed implementation. Marked `keepAlive` so cached data is not
/// disposed when no widget is listening.
@Riverpod(keepAlive: true)
KeyValueStore keyValueStore(Ref ref) => MemoryStore();
