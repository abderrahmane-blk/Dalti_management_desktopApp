import 'package:desktop_turn_management/features/auth/domain/entities/current_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'jwt_claims_dto.freezed.dart';
part 'jwt_claims_dto.g.dart';

/// Wire shape of the dev JWT's payload claims (`sub`, `email`, `name`).
///
/// Lives in the data layer; never escapes the repository. When the backend's
/// `GET /users/me` is wired instead, swap this for a `CurrentUserDto` matching
/// `{ id, email, name, phone }` — nothing above the repository changes.
@freezed
abstract class JwtClaimsDto with _$JwtClaimsDto {
  const JwtClaimsDto._();

  const factory JwtClaimsDto({
    required String sub,
    required String email,
    required String name,
  }) = _JwtClaimsDto;

  factory JwtClaimsDto.fromJson(Map<String, dynamic> json) =>
      _$JwtClaimsDtoFromJson(json);

  CurrentUser toEntity() => CurrentUser(id: sub, email: email, name: name);
}
