import 'package:desktop_turn_management/features/workspaces/domain/entities/workspace.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workspace_dto.freezed.dart';
part 'workspace_dto.g.dart';

/// Wire/storage shape of `GET /me/workspaces`. Lives entirely in the data
/// layer; mapped to domain entities via [toEntity] so DTOs never reach the UI.
@freezed
abstract class WorkspaceDto with _$WorkspaceDto {
  const WorkspaceDto._();

  const factory WorkspaceDto({
    required String userId,
    required bool isPlatformAdmin,
    required List<ManagedOrganizationDto> organizations,
  }) = _WorkspaceDto;

  factory WorkspaceDto.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceDtoFromJson(json);

  Workspace toEntity() => Workspace(
        userId: userId,
        isPlatformAdmin: isPlatformAdmin,
        organizations: organizations.map((o) => o.toEntity()).toList(),
      );
}

@freezed
abstract class ManagedOrganizationDto with _$ManagedOrganizationDto {
  const ManagedOrganizationDto._();

  const factory ManagedOrganizationDto({
    required int id,
    required String sector,
    required int subtypeId,
    required double latitude,
    required double longitude,
    required String role,
    required int orgPermissions,
    required LocalizedFieldsDto ar,
    required LocalizedFieldsDto en,
    required LocalizedFieldsDto fr,
    required List<ManagedQueueDto> queues,
  }) = _ManagedOrganizationDto;

  factory ManagedOrganizationDto.fromJson(Map<String, dynamic> json) =>
      _$ManagedOrganizationDtoFromJson(json);

  ManagedOrganization toEntity() => ManagedOrganization(
        id: id,
        sector: sector,
        subtypeId: subtypeId,
        latitude: latitude,
        longitude: longitude,
        role: orgRoleFromWire(role),
        orgPermissions: orgPermissions,
        name: L10n(ar: ar.name, en: en.name, fr: fr.name),
        address: L10n(
          ar: ar.address ?? '',
          en: en.address ?? '',
          fr: fr.address ?? '',
        ),
        queues: queues.map((q) => q.toEntity()).toList(),
      );
}

@freezed
abstract class ManagedQueueDto with _$ManagedQueueDto {
  const ManagedQueueDto._();

  const factory ManagedQueueDto({
    required int id,
    required String mode,
    required String status,
    required int effectivePermissions,
    required int grantPermissions,
    required bool canOperate,
    required LocalizedFieldsDto ar,
    required LocalizedFieldsDto en,
    required LocalizedFieldsDto fr,
  }) = _ManagedQueueDto;

  factory ManagedQueueDto.fromJson(Map<String, dynamic> json) =>
      _$ManagedQueueDtoFromJson(json);

  ManagedQueue toEntity() => ManagedQueue(
        id: id,
        mode: mode,
        status: status,
        effectivePermissions: effectivePermissions,
        grantPermissions: grantPermissions,
        canOperate: canOperate,
        name: L10n(ar: ar.name, en: en.name, fr: fr.name),
        description: L10n(
          ar: ar.description ?? '',
          en: en.description ?? '',
          fr: fr.description ?? '',
        ),
      );
}

/// One language's fields. `address` is present for organizations, `description`
/// for queues; the unused one is simply absent (null).
@freezed
abstract class LocalizedFieldsDto with _$LocalizedFieldsDto {
  const factory LocalizedFieldsDto({
    required String name,
    String? address,
    String? description,
  }) = _LocalizedFieldsDto;

  factory LocalizedFieldsDto.fromJson(Map<String, dynamic> json) =>
      _$LocalizedFieldsDtoFromJson(json);
}

/// Maps the backend role string onto [OrgRole], defaulting to [OrgRole.unknown].
OrgRole orgRoleFromWire(String role) => switch (role.toLowerCase()) {
      'owner' => OrgRole.owner,
      'manager' => OrgRole.manager,
      'staff' => OrgRole.staff,
      _ => OrgRole.unknown,
    };
