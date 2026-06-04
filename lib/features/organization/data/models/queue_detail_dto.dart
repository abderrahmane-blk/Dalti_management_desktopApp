import 'dart:convert';

import 'package:desktop_turn_management/features/organization/domain/entities/queue_full_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'queue_detail_dto.freezed.dart';
part 'queue_detail_dto.g.dart';

/// One language's name + description for a queue, as returned by
/// `GET /queues/{id}/full`.
@freezed
abstract class QueueTranslationItemDto with _$QueueTranslationItemDto {
  const factory QueueTranslationItemDto({
    required String name,
    String? description,
  }) = _QueueTranslationItemDto;

  factory QueueTranslationItemDto.fromJson(Map<String, dynamic> json) =>
      _$QueueTranslationItemDtoFromJson(json);
}

/// Wire shape of `GET /queues/{id}/full`. [rules] is a raw JSON string; it is
/// parsed into [QueueRulesData] in [toEntity].
@freezed
abstract class QueueDetailDto with _$QueueDetailDto {
  const QueueDetailDto._();

  const factory QueueDetailDto({
    required int id,
    required int orgId,
    required String mode,
    required String status,
    required String rules,
    int? nextQueueId,
    QueueTranslationItemDto? ar,
    QueueTranslationItemDto? en,
    QueueTranslationItemDto? fr,
  }) = _QueueDetailDto;

  factory QueueDetailDto.fromJson(Map<String, dynamic> json) =>
      _$QueueDetailDtoFromJson(json);

  QueueFullData toEntity() {
    QueueRulesData parsedRules;
    try {
      final decoded = jsonDecode(rules);
      parsedRules = decoded is Map<String, dynamic>
          ? QueueRulesData.fromJson(decoded)
          : const QueueRulesData();
    } catch (_) {
      parsedRules = const QueueRulesData();
    }
    return QueueFullData(
      id: id,
      mode: mode,
      status: status,
      rules: parsedRules,
      nameAr: ar?.name ?? '',
      nameEn: en?.name ?? '',
      nameFr: fr?.name ?? '',
      descAr: ar?.description ?? '',
      descEn: en?.description ?? '',
      descFr: fr?.description ?? '',
      nextQueueId: nextQueueId,
    );
  }
}
