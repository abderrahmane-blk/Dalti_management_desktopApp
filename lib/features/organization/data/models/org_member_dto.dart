import 'package:desktop_turn_management/features/organization/domain/entities/org_member.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'org_member_dto.freezed.dart';
part 'org_member_dto.g.dart';

/// Wire shape of the backend `MemberPermissionsDto`
/// (`{ userId, email, name, role, permissions }`). Stays in the data layer;
/// mapped to [OrgMember] via [toEntity].
@freezed
abstract class OrgMemberDto with _$OrgMemberDto {
  const OrgMemberDto._();

  const factory OrgMemberDto({
    required String userId,
    required String email,
    required String name,
    required String role,
    required int permissions,
  }) = _OrgMemberDto;

  factory OrgMemberDto.fromJson(Map<String, dynamic> json) =>
      _$OrgMemberDtoFromJson(json);

  OrgMember toEntity() => OrgMember(
        userId: userId,
        email: email,
        name: name,
        role: role,
        permissions: permissions,
      );
}
