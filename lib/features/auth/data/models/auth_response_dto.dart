import 'package:desktop_turn_management/features/auth/domain/entities/current_user.dart';

/// The backend's `AuthResponse` from `POST /auth/google` and `POST /auth/refresh`.
/// Stays in the data layer; the repository maps [user] to a [CurrentUser].
class AuthResponseDto {
  const AuthResponseDto({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  final String accessToken;
  final String refreshToken;
  final AuthUserDto user;

  factory AuthResponseDto.fromJson(Map<String, dynamic> json) =>
      AuthResponseDto(
        accessToken: json['accessToken'] as String,
        refreshToken: json['refreshToken'] as String,
        user: AuthUserDto.fromJson(json['user'] as Map<String, dynamic>),
      );
}

/// The `UserDto` nested in an auth response.
class AuthUserDto {
  const AuthUserDto({
    required this.id,
    required this.email,
    required this.name,
  });

  final String id;
  final String email;
  final String name;

  factory AuthUserDto.fromJson(Map<String, dynamic> json) => AuthUserDto(
        id: json['id'].toString(),
        email: json['email'] as String,
        name: json['name'] as String,
      );

  CurrentUser toEntity() => CurrentUser(id: id, email: email, name: name);
}
