// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_board_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Live board state for one queue.
///
/// `build()` seeds from the first [RealtimeSource] emission and forwards every
/// subsequent emission (a 10s poll today) into `state`. Operator actions
/// (call-next, call/recall, status change, pass-to-next) run through the
/// repository and then force an immediate [refresh]; each returns the
/// [ApiException] on failure (or `null` on success) so the UI can report it.

@ProviderFor(QueueBoard)
final queueBoardProvider = QueueBoardFamily._();

/// Live board state for one queue.
///
/// `build()` seeds from the first [RealtimeSource] emission and forwards every
/// subsequent emission (a 10s poll today) into `state`. Operator actions
/// (call-next, call/recall, status change, pass-to-next) run through the
/// repository and then force an immediate [refresh]; each returns the
/// [ApiException] on failure (or `null` on success) so the UI can report it.
final class QueueBoardProvider
    extends $AsyncNotifierProvider<QueueBoard, List<QueueReservation>> {
  /// Live board state for one queue.
  ///
  /// `build()` seeds from the first [RealtimeSource] emission and forwards every
  /// subsequent emission (a 10s poll today) into `state`. Operator actions
  /// (call-next, call/recall, status change, pass-to-next) run through the
  /// repository and then force an immediate [refresh]; each returns the
  /// [ApiException] on failure (or `null` on success) so the UI can report it.
  QueueBoardProvider._({
    required QueueBoardFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'queueBoardProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$queueBoardHash();

  @override
  String toString() {
    return r'queueBoardProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  QueueBoard create() => QueueBoard();

  @override
  bool operator ==(Object other) {
    return other is QueueBoardProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$queueBoardHash() => r'69dedd315e109b72552c0ab61ac479b6e14ef5ee';

/// Live board state for one queue.
///
/// `build()` seeds from the first [RealtimeSource] emission and forwards every
/// subsequent emission (a 10s poll today) into `state`. Operator actions
/// (call-next, call/recall, status change, pass-to-next) run through the
/// repository and then force an immediate [refresh]; each returns the
/// [ApiException] on failure (or `null` on success) so the UI can report it.

final class QueueBoardFamily extends $Family
    with
        $ClassFamilyOverride<
          QueueBoard,
          AsyncValue<List<QueueReservation>>,
          List<QueueReservation>,
          FutureOr<List<QueueReservation>>,
          int
        > {
  QueueBoardFamily._()
    : super(
        retry: null,
        name: r'queueBoardProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Live board state for one queue.
  ///
  /// `build()` seeds from the first [RealtimeSource] emission and forwards every
  /// subsequent emission (a 10s poll today) into `state`. Operator actions
  /// (call-next, call/recall, status change, pass-to-next) run through the
  /// repository and then force an immediate [refresh]; each returns the
  /// [ApiException] on failure (or `null` on success) so the UI can report it.

  QueueBoardProvider call(int queueId) =>
      QueueBoardProvider._(argument: queueId, from: this);

  @override
  String toString() => r'queueBoardProvider';
}

/// Live board state for one queue.
///
/// `build()` seeds from the first [RealtimeSource] emission and forwards every
/// subsequent emission (a 10s poll today) into `state`. Operator actions
/// (call-next, call/recall, status change, pass-to-next) run through the
/// repository and then force an immediate [refresh]; each returns the
/// [ApiException] on failure (or `null` on success) so the UI can report it.

abstract class _$QueueBoard extends $AsyncNotifier<List<QueueReservation>> {
  late final _$args = ref.$arg as int;
  int get queueId => _$args;

  FutureOr<List<QueueReservation>> build(int queueId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<QueueReservation>>, List<QueueReservation>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<QueueReservation>>,
                List<QueueReservation>
              >,
              AsyncValue<List<QueueReservation>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
