import 'package:desktop_turn_management/core/network/api_client.dart';
import 'package:desktop_turn_management/features/walk_in/data/datasources/walk_in_remote_data_source.dart';
import 'package:desktop_turn_management/features/walk_in/data/repositories/walk_in_repository_impl.dart';
import 'package:desktop_turn_management/features/walk_in/domain/repositories/walk_in_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'walk_in_providers.g.dart';

/// Remote datasource bound to the shared [ApiClient].
@riverpod
WalkInRemoteDataSource walkInRemoteDataSource(Ref ref) =>
    WalkInRemoteDataSource(ref.watch(apiClientProvider));

/// The abstract [WalkInRepository] — the single type the feature depends on.
@riverpod
WalkInRepository walkInRepository(Ref ref) =>
    WalkInRepositoryImpl(ref.watch(walkInRemoteDataSourceProvider));
