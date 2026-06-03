import 'package:desktop_turn_management/core/auth/dev_auth_token_store.dart';
import 'package:desktop_turn_management/features/auth/data/datasources/local_identity_data_source.dart';
import 'package:desktop_turn_management/features/auth/data/repositories/user_repository_impl.dart';
import 'package:desktop_turn_management/features/auth/domain/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_providers.g.dart';

/// Identity datasource bound to the app-wide auth seam ([authTokenStoreProvider]).
@riverpod
LocalIdentityDataSource localIdentityDataSource(Ref ref) =>
    LocalIdentityDataSource(ref.watch(authTokenStoreProvider));

/// The abstract [UserRepository] — the single type presentation depends on.
@riverpod
UserRepository userRepository(Ref ref) =>
    UserRepositoryImpl(ref.watch(localIdentityDataSourceProvider));
