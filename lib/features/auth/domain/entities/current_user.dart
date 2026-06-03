import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_user.freezed.dart';

/// The signed-in user. Pure domain model — no JSON, no token concerns.
///
/// Today it is derived from the dev JWT's claims (see [LocalIdentityDataSource]).
/// When real Google sign-in lands, the same entity will instead be populated
/// from the backend's `GET /users/me`, with no change above the data layer.
@freezed
abstract class CurrentUser with _$CurrentUser {
  const factory CurrentUser({
    required String id,
    required String email,
    required String name,
    String? phone,
  }) = _CurrentUser;
}
