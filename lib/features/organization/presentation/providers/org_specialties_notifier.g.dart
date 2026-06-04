// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'org_specialties_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Loads the specialties currently linked to [orgId].
/// Fetch-once on build; the edit dialog invalidates it after changes.

@ProviderFor(OrgSpecialties)
final orgSpecialtiesProvider = OrgSpecialtiesFamily._();

/// Loads the specialties currently linked to [orgId].
/// Fetch-once on build; the edit dialog invalidates it after changes.
final class OrgSpecialtiesProvider
    extends $AsyncNotifierProvider<OrgSpecialties, List<SpecialtyItem>> {
  /// Loads the specialties currently linked to [orgId].
  /// Fetch-once on build; the edit dialog invalidates it after changes.
  OrgSpecialtiesProvider._({
    required OrgSpecialtiesFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'orgSpecialtiesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$orgSpecialtiesHash();

  @override
  String toString() {
    return r'orgSpecialtiesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  OrgSpecialties create() => OrgSpecialties();

  @override
  bool operator ==(Object other) {
    return other is OrgSpecialtiesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$orgSpecialtiesHash() => r'1b0cf17bfc53e4dda3db9dc25da6a2c0b7f39b9e';

/// Loads the specialties currently linked to [orgId].
/// Fetch-once on build; the edit dialog invalidates it after changes.

final class OrgSpecialtiesFamily extends $Family
    with
        $ClassFamilyOverride<
          OrgSpecialties,
          AsyncValue<List<SpecialtyItem>>,
          List<SpecialtyItem>,
          FutureOr<List<SpecialtyItem>>,
          int
        > {
  OrgSpecialtiesFamily._()
    : super(
        retry: null,
        name: r'orgSpecialtiesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Loads the specialties currently linked to [orgId].
  /// Fetch-once on build; the edit dialog invalidates it after changes.

  OrgSpecialtiesProvider call(int orgId) =>
      OrgSpecialtiesProvider._(argument: orgId, from: this);

  @override
  String toString() => r'orgSpecialtiesProvider';
}

/// Loads the specialties currently linked to [orgId].
/// Fetch-once on build; the edit dialog invalidates it after changes.

abstract class _$OrgSpecialties extends $AsyncNotifier<List<SpecialtyItem>> {
  late final _$args = ref.$arg as int;
  int get orgId => _$args;

  FutureOr<List<SpecialtyItem>> build(int orgId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<SpecialtyItem>>, List<SpecialtyItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<SpecialtyItem>>, List<SpecialtyItem>>,
              AsyncValue<List<SpecialtyItem>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
