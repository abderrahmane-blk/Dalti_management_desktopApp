import 'package:desktop_turn_management/core/auth/dev_auth_token_store.dart';
import 'package:desktop_turn_management/core/auth/session_auth_token_store.dart';
import 'package:desktop_turn_management/core/network/api_client.dart';
import 'package:desktop_turn_management/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:desktop_turn_management/features/auth/data/datasources/google_sign_in_data_source.dart';
import 'package:desktop_turn_management/features/auth/data/datasources/local_identity_data_source.dart';
import 'package:desktop_turn_management/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:desktop_turn_management/features/auth/data/repositories/user_repository_impl.dart';
import 'package:desktop_turn_management/features/auth/domain/repositories/auth_repository.dart';
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

/// Performs the desktop Google OAuth flow (loopback + PKCE).
@riverpod
GoogleSignInDataSource googleSignInDataSource(Ref ref) =>
    GoogleSignInDataSource();

/// Calls the backend's anonymous `/auth/*` endpoints.
@riverpod
AuthRemoteDataSource authRemoteDataSource(Ref ref) =>
    AuthRemoteDataSource(ref.watch(apiClientProvider));

/// Sign-in / sign-out. Writes the obtained JWT into the shared session store.
@riverpod
AuthRepository authRepository(Ref ref) => AuthRepositoryImpl(
      google: ref.watch(googleSignInDataSourceProvider),
      remote: ref.watch(authRemoteDataSourceProvider),
      session: ref.watch(sessionAuthTokenStoreProvider),
    );
