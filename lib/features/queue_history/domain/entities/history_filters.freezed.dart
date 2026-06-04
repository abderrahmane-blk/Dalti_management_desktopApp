// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryFilters {

 Set<ReservationStatus> get statuses;/// Case-insensitive match against name or phone.
 String get text;/// Inclusive sub-range within the loaded window (day-only), or null.
 DateTime? get from; DateTime? get to;/// Restrict to a single service point id, or null for any.
 int? get servicePointId;
/// Create a copy of HistoryFilters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryFiltersCopyWith<HistoryFilters> get copyWith => _$HistoryFiltersCopyWithImpl<HistoryFilters>(this as HistoryFilters, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryFilters&&const DeepCollectionEquality().equals(other.statuses, statuses)&&(identical(other.text, text) || other.text == text)&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.servicePointId, servicePointId) || other.servicePointId == servicePointId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(statuses),text,from,to,servicePointId);

@override
String toString() {
  return 'HistoryFilters(statuses: $statuses, text: $text, from: $from, to: $to, servicePointId: $servicePointId)';
}


}

/// @nodoc
abstract mixin class $HistoryFiltersCopyWith<$Res>  {
  factory $HistoryFiltersCopyWith(HistoryFilters value, $Res Function(HistoryFilters) _then) = _$HistoryFiltersCopyWithImpl;
@useResult
$Res call({
 Set<ReservationStatus> statuses, String text, DateTime? from, DateTime? to, int? servicePointId
});




}
/// @nodoc
class _$HistoryFiltersCopyWithImpl<$Res>
    implements $HistoryFiltersCopyWith<$Res> {
  _$HistoryFiltersCopyWithImpl(this._self, this._then);

  final HistoryFilters _self;
  final $Res Function(HistoryFilters) _then;

/// Create a copy of HistoryFilters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statuses = null,Object? text = null,Object? from = freezed,Object? to = freezed,Object? servicePointId = freezed,}) {
  return _then(_self.copyWith(
statuses: null == statuses ? _self.statuses : statuses // ignore: cast_nullable_to_non_nullable
as Set<ReservationStatus>,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,from: freezed == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime?,to: freezed == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime?,servicePointId: freezed == servicePointId ? _self.servicePointId : servicePointId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryFilters].
extension HistoryFiltersPatterns on HistoryFilters {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryFilters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryFilters() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryFilters value)  $default,){
final _that = this;
switch (_that) {
case _HistoryFilters():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryFilters value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryFilters() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Set<ReservationStatus> statuses,  String text,  DateTime? from,  DateTime? to,  int? servicePointId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryFilters() when $default != null:
return $default(_that.statuses,_that.text,_that.from,_that.to,_that.servicePointId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Set<ReservationStatus> statuses,  String text,  DateTime? from,  DateTime? to,  int? servicePointId)  $default,) {final _that = this;
switch (_that) {
case _HistoryFilters():
return $default(_that.statuses,_that.text,_that.from,_that.to,_that.servicePointId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Set<ReservationStatus> statuses,  String text,  DateTime? from,  DateTime? to,  int? servicePointId)?  $default,) {final _that = this;
switch (_that) {
case _HistoryFilters() when $default != null:
return $default(_that.statuses,_that.text,_that.from,_that.to,_that.servicePointId);case _:
  return null;

}
}

}

/// @nodoc


class _HistoryFilters extends HistoryFilters {
  const _HistoryFilters({final  Set<ReservationStatus> statuses = const <ReservationStatus>{}, this.text = '', this.from, this.to, this.servicePointId}): _statuses = statuses,super._();
  

 final  Set<ReservationStatus> _statuses;
@override@JsonKey() Set<ReservationStatus> get statuses {
  if (_statuses is EqualUnmodifiableSetView) return _statuses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_statuses);
}

/// Case-insensitive match against name or phone.
@override@JsonKey() final  String text;
/// Inclusive sub-range within the loaded window (day-only), or null.
@override final  DateTime? from;
@override final  DateTime? to;
/// Restrict to a single service point id, or null for any.
@override final  int? servicePointId;

/// Create a copy of HistoryFilters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryFiltersCopyWith<_HistoryFilters> get copyWith => __$HistoryFiltersCopyWithImpl<_HistoryFilters>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryFilters&&const DeepCollectionEquality().equals(other._statuses, _statuses)&&(identical(other.text, text) || other.text == text)&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.servicePointId, servicePointId) || other.servicePointId == servicePointId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_statuses),text,from,to,servicePointId);

@override
String toString() {
  return 'HistoryFilters(statuses: $statuses, text: $text, from: $from, to: $to, servicePointId: $servicePointId)';
}


}

/// @nodoc
abstract mixin class _$HistoryFiltersCopyWith<$Res> implements $HistoryFiltersCopyWith<$Res> {
  factory _$HistoryFiltersCopyWith(_HistoryFilters value, $Res Function(_HistoryFilters) _then) = __$HistoryFiltersCopyWithImpl;
@override @useResult
$Res call({
 Set<ReservationStatus> statuses, String text, DateTime? from, DateTime? to, int? servicePointId
});




}
/// @nodoc
class __$HistoryFiltersCopyWithImpl<$Res>
    implements _$HistoryFiltersCopyWith<$Res> {
  __$HistoryFiltersCopyWithImpl(this._self, this._then);

  final _HistoryFilters _self;
  final $Res Function(_HistoryFilters) _then;

/// Create a copy of HistoryFilters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statuses = null,Object? text = null,Object? from = freezed,Object? to = freezed,Object? servicePointId = freezed,}) {
  return _then(_HistoryFilters(
statuses: null == statuses ? _self._statuses : statuses // ignore: cast_nullable_to_non_nullable
as Set<ReservationStatus>,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,from: freezed == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime?,to: freezed == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime?,servicePointId: freezed == servicePointId ? _self.servicePointId : servicePointId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
