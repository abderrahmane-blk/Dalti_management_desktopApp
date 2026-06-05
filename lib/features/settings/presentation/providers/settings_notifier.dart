import 'package:desktop_turn_management/core/storage/memory_store.dart';
import 'package:desktop_turn_management/features/settings/domain/entities/app_settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_notifier.g.dart';

@Riverpod(keepAlive: true)
class Settings extends _$Settings {
  static const _key = 'app_settings';

  @override
  Future<AppSettings> build() async {
    final raw = await ref.watch(keyValueStoreProvider).read(_key);
    if (raw == null) return const AppSettings();
    return AppSettings.fromJson(raw as Map<String, dynamic>);
  }

  Future<void> save(AppSettings settings) async {
    state = AsyncData(settings);
    await ref.read(keyValueStoreProvider).write(_key, settings.toJson());
  }
}
