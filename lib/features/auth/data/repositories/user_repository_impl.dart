import 'package:desktop_turn_management/core/result/result.dart';
import 'package:desktop_turn_management/features/auth/data/datasources/local_identity_data_source.dart';
import 'package:desktop_turn_management/features/auth/domain/entities/current_user.dart';
import 'package:desktop_turn_management/features/auth/domain/repositories/user_repository.dart';

/// [UserRepository] backed by the JWT identity datasource. DTO→entity mapping
/// happens here so the claims DTO never reaches presentation.
class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._identity);

  final LocalIdentityDataSource _identity;

  @override
  Future<Result<CurrentUser>> currentUser() => guard(() async {
        final claims = await _identity.currentClaims();
        return claims.toEntity();
      });
}
