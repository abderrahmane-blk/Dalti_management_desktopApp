/// Abstract local persistence seam.
///
/// Local datasources depend on this interface only, so the in-memory
/// implementation used today can be replaced by a real embedded database
/// (drift / sqlite / isar / hive) later without changing any datasource,
/// repository, or UI code — only the binding in `keyValueStoreProvider`.
///
/// Values are expected to be JSON-encodable (`String`, `num`, `bool`, `null`,
/// `List`, `Map`) so a future disk-backed implementation can serialize them
/// unchanged.
abstract interface class KeyValueStore {
  /// Stores [value] under [key], overwriting any existing entry.
  Future<void> write(String key, Object? value);

  /// Reads the value stored under [key], or `null` if absent.
  Future<Object?> read(String key);

  /// Removes the entry for [key] if present.
  Future<void> delete(String key);

  /// Removes all entries.
  Future<void> clear();

  /// `true` if [key] currently has a value.
  Future<bool> containsKey(String key);
}
