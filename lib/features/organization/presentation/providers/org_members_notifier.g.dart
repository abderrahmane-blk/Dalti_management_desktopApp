// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'org_members_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Loads and mutates an organization's member list (one instance per org).
///
/// `build()` fetches once (requires MemberManage on the org). The mutation
/// methods call the backend and, on success, patch the list in place so the UI
/// updates without a reload; each returns the [ApiException] on failure (or
/// null on success) for a snackbar.

@ProviderFor(OrgMembers)
final orgMembersProvider = OrgMembersFamily._();

/// Loads and mutates an organization's member list (one instance per org).
///
/// `build()` fetches once (requires MemberManage on the org). The mutation
/// methods call the backend and, on success, patch the list in place so the UI
/// updates without a reload; each returns the [ApiException] on failure (or
/// null on success) for a snackbar.
final class OrgMembersProvider
    extends $AsyncNotifierProvider<OrgMembers, List<OrgMember>> {
  /// Loads and mutates an organization's member list (one instance per org).
  ///
  /// `build()` fetches once (requires MemberManage on the org). The mutation
  /// methods call the backend and, on success, patch the list in place so the UI
  /// updates without a reload; each returns the [ApiException] on failure (or
  /// null on success) for a snackbar.
  OrgMembersProvider._({
    required OrgMembersFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'orgMembersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$orgMembersHash();

  @override
  String toString() {
    return r'orgMembersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  OrgMembers create() => OrgMembers();

  @override
  bool operator ==(Object other) {
    return other is OrgMembersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$orgMembersHash() => r'b491f6b51571ef17e895f171c248e006610227e5';

/// Loads and mutates an organization's member list (one instance per org).
///
/// `build()` fetches once (requires MemberManage on the org). The mutation
/// methods call the backend and, on success, patch the list in place so the UI
/// updates without a reload; each returns the [ApiException] on failure (or
/// null on success) for a snackbar.

final class OrgMembersFamily extends $Family
    with
        $ClassFamilyOverride<
          OrgMembers,
          AsyncValue<List<OrgMember>>,
          List<OrgMember>,
          FutureOr<List<OrgMember>>,
          int
        > {
  OrgMembersFamily._()
    : super(
        retry: null,
        name: r'orgMembersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Loads and mutates an organization's member list (one instance per org).
  ///
  /// `build()` fetches once (requires MemberManage on the org). The mutation
  /// methods call the backend and, on success, patch the list in place so the UI
  /// updates without a reload; each returns the [ApiException] on failure (or
  /// null on success) for a snackbar.

  OrgMembersProvider call(int orgId) =>
      OrgMembersProvider._(argument: orgId, from: this);

  @override
  String toString() => r'orgMembersProvider';
}

/// Loads and mutates an organization's member list (one instance per org).
///
/// `build()` fetches once (requires MemberManage on the org). The mutation
/// methods call the backend and, on success, patch the list in place so the UI
/// updates without a reload; each returns the [ApiException] on failure (or
/// null on success) for a snackbar.

abstract class _$OrgMembers extends $AsyncNotifier<List<OrgMember>> {
  late final _$args = ref.$arg as int;
  int get orgId => _$args;

  FutureOr<List<OrgMember>> build(int orgId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<OrgMember>>, List<OrgMember>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<OrgMember>>, List<OrgMember>>,
              AsyncValue<List<OrgMember>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
