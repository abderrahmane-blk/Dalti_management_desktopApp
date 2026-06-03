import 'package:desktop_turn_management/core/network/api_exception.dart';

/// A lightweight `Either`-style type used to surface failures without throwing
/// across layer boundaries.
///
/// The success branch carries a value of type [T]; the failure branch always
/// carries an [ApiException] so the UI never has to reason about raw
/// `dio`/transport exceptions. Pattern-match with Dart 3 switch expressions:
///
/// ```dart
/// final label = switch (result) {
///   Ok(:final value) => 'Loaded ${value.length}',
///   Err(:final error) => error.message,
/// };
/// ```
sealed class Result<T> {
  const Result();

  /// `true` when this is an [Ok].
  bool get isOk => this is Ok<T>;

  /// `true` when this is an [Err].
  bool get isErr => this is Err<T>;

  /// Returns the value if [Ok], otherwise `null`.
  T? get valueOrNull => switch (this) {
        Ok<T>(:final value) => value,
        Err<T>() => null,
      };

  /// Maps the success value, preserving a failure unchanged.
  Result<R> map<R>(R Function(T value) transform) => switch (this) {
        Ok<T>(:final value) => Ok(transform(value)),
        Err<T>(:final error) => Err(error),
      };

  /// Folds both branches into a single value.
  R fold<R>(R Function(T value) onOk, R Function(ApiException error) onErr) =>
      switch (this) {
        Ok<T>(:final value) => onOk(value),
        Err<T>(:final error) => onErr(error),
      };
}

/// Success branch holding a [value].
final class Ok<T> extends Result<T> {
  const Ok(this.value);
  final T value;
}

/// Failure branch holding an [ApiException].
final class Err<T> extends Result<T> {
  const Err(this.error);
  final ApiException error;
}

/// Runs [body], wrapping the outcome in a [Result] and converting any thrown
/// [ApiException] into an [Err]. Non-[ApiException] errors are rethrown because
/// they indicate programmer error rather than an expected I/O failure.
Future<Result<T>> guard<T>(Future<T> Function() body) async {
  try {
    return Ok(await body());
  } on ApiException catch (e) {
    return Err(e);
  }
}
