// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queue_history_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Loads and holds a queue's reservation history.
///
/// Unlike the live board, this does **not** poll. `build()` loads the previous
/// month + the current month (up to yesterday) once; afterwards the state only
/// changes when the user refreshes a date/month or edits a status. Reservations
/// live in the store (KeyValueStore) behind the repository.

@ProviderFor(QueueHistory)
final queueHistoryProvider = QueueHistoryFamily._();

/// Loads and holds a queue's reservation history.
///
/// Unlike the live board, this does **not** poll. `build()` loads the previous
/// month + the current month (up to yesterday) once; afterwards the state only
/// changes when the user refreshes a date/month or edits a status. Reservations
/// live in the store (KeyValueStore) behind the repository.
final class QueueHistoryProvider
    extends $AsyncNotifierProvider<QueueHistory, HistoryView> {
  /// Loads and holds a queue's reservation history.
  ///
  /// Unlike the live board, this does **not** poll. `build()` loads the previous
  /// month + the current month (up to yesterday) once; afterwards the state only
  /// changes when the user refreshes a date/month or edits a status. Reservations
  /// live in the store (KeyValueStore) behind the repository.
  QueueHistoryProvider._({
    required QueueHistoryFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'queueHistoryProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$queueHistoryHash();

  @override
  String toString() {
    return r'queueHistoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  QueueHistory create() => QueueHistory();

  @override
  bool operator ==(Object other) {
    return other is QueueHistoryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$queueHistoryHash() => r'892653b09a9d299ec37cab4ebd5b22bb18831456';

/// Loads and holds a queue's reservation history.
///
/// Unlike the live board, this does **not** poll. `build()` loads the previous
/// month + the current month (up to yesterday) once; afterwards the state only
/// changes when the user refreshes a date/month or edits a status. Reservations
/// live in the store (KeyValueStore) behind the repository.

final class QueueHistoryFamily extends $Family
    with
        $ClassFamilyOverride<
          QueueHistory,
          AsyncValue<HistoryView>,
          HistoryView,
          FutureOr<HistoryView>,
          int
        > {
  QueueHistoryFamily._()
    : super(
        retry: null,
        name: r'queueHistoryProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Loads and holds a queue's reservation history.
  ///
  /// Unlike the live board, this does **not** poll. `build()` loads the previous
  /// month + the current month (up to yesterday) once; afterwards the state only
  /// changes when the user refreshes a date/month or edits a status. Reservations
  /// live in the store (KeyValueStore) behind the repository.

  QueueHistoryProvider call(int queueId) =>
      QueueHistoryProvider._(argument: queueId, from: this);

  @override
  String toString() => r'queueHistoryProvider';
}

/// Loads and holds a queue's reservation history.
///
/// Unlike the live board, this does **not** poll. `build()` loads the previous
/// month + the current month (up to yesterday) once; afterwards the state only
/// changes when the user refreshes a date/month or edits a status. Reservations
/// live in the store (KeyValueStore) behind the repository.

abstract class _$QueueHistory extends $AsyncNotifier<HistoryView> {
  late final _$args = ref.$arg as int;
  int get queueId => _$args;

  FutureOr<HistoryView> build(int queueId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<HistoryView>, HistoryView>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<HistoryView>, HistoryView>,
              AsyncValue<HistoryView>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
