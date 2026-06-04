// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BoardFilters {

 Set<ReservationStatus> get statuses;/// Case-insensitive match against name or phone.
 String get text;/// Restrict to a single service point id, or null for any.
 int? get servicePointId;
/// Create a copy of BoardFilters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoardFiltersCopyWith<BoardFilters> get copyWith => _$BoardFiltersCopyWithImpl<BoardFilters>(this as BoardFilters, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoardFilters&&const DeepCollectionEquality().equals(other.statuses, statuses)&&(identical(other.text, text) || other.text == text)&&(identical(other.servicePointId, servicePointId) || other.servicePointId == servicePointId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(statuses),text,servicePointId);

@override
String toString() {
  return 'BoardFilters(statuses: $statuses, text: $text, servicePointId: $servicePointId)';
}


}

/// @nodoc
abstract mixin class $BoardFiltersCopyWith<$Res>  {
  factory $BoardFiltersCopyWith(BoardFilters value, $Res Function(BoardFilters) _then) = _$BoardFiltersCopyWithImpl;
@useResult
$Res call({
 Set<ReservationStatus> statuses, String text, int? servicePointId
});




}
/// @nodoc
class _$BoardFiltersCopyWithImpl<$Res>
    implements $BoardFiltersCopyWith<$Res> {
  _$BoardFiltersCopyWithImpl(this._self, this._then);

  final BoardFilters _self;
  final $Res Function(BoardFilters) _then;

/// Create a copy of BoardFilters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? statuses = null,Object? text = null,Object? servicePointId = freezed,}) {
  return _then(_self.copyWith(
statuses: null == statuses ? _self.statuses : statuses // ignore: cast_nullable_to_non_nullable
as Set<ReservationStatus>,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,servicePointId: freezed == servicePointId ? _self.servicePointId : servicePointId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [BoardFilters].
extension BoardFiltersPatterns on BoardFilters {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BoardFilters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BoardFilters() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BoardFilters value)  $default,){
final _that = this;
switch (_that) {
case _BoardFilters():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BoardFilters value)?  $default,){
final _that = this;
switch (_that) {
case _BoardFilters() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Set<ReservationStatus> statuses,  String text,  int? servicePointId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BoardFilters() when $default != null:
return $default(_that.statuses,_that.text,_that.servicePointId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Set<ReservationStatus> statuses,  String text,  int? servicePointId)  $default,) {final _that = this;
switch (_that) {
case _BoardFilters():
return $default(_that.statuses,_that.text,_that.servicePointId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Set<ReservationStatus> statuses,  String text,  int? servicePointId)?  $default,) {final _that = this;
switch (_that) {
case _BoardFilters() when $default != null:
return $default(_that.statuses,_that.text,_that.servicePointId);case _:
  return null;

}
}

}

/// @nodoc


class _BoardFilters extends BoardFilters {
  const _BoardFilters({final  Set<ReservationStatus> statuses = const <ReservationStatus>{}, this.text = '', this.servicePointId}): _statuses = statuses,super._();
  

 final  Set<ReservationStatus> _statuses;
@override@JsonKey() Set<ReservationStatus> get statuses {
  if (_statuses is EqualUnmodifiableSetView) return _statuses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_statuses);
}

/// Case-insensitive match against name or phone.
@override@JsonKey() final  String text;
/// Restrict to a single service point id, or null for any.
@override final  int? servicePointId;

/// Create a copy of BoardFilters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoardFiltersCopyWith<_BoardFilters> get copyWith => __$BoardFiltersCopyWithImpl<_BoardFilters>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoardFilters&&const DeepCollectionEquality().equals(other._statuses, _statuses)&&(identical(other.text, text) || other.text == text)&&(identical(other.servicePointId, servicePointId) || other.servicePointId == servicePointId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_statuses),text,servicePointId);

@override
String toString() {
  return 'BoardFilters(statuses: $statuses, text: $text, servicePointId: $servicePointId)';
}


}

/// @nodoc
abstract mixin class _$BoardFiltersCopyWith<$Res> implements $BoardFiltersCopyWith<$Res> {
  factory _$BoardFiltersCopyWith(_BoardFilters value, $Res Function(_BoardFilters) _then) = __$BoardFiltersCopyWithImpl;
@override @useResult
$Res call({
 Set<ReservationStatus> statuses, String text, int? servicePointId
});




}
/// @nodoc
class __$BoardFiltersCopyWithImpl<$Res>
    implements _$BoardFiltersCopyWith<$Res> {
  __$BoardFiltersCopyWithImpl(this._self, this._then);

  final _BoardFilters _self;
  final $Res Function(_BoardFilters) _then;

/// Create a copy of BoardFilters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? statuses = null,Object? text = null,Object? servicePointId = freezed,}) {
  return _then(_BoardFilters(
statuses: null == statuses ? _self._statuses : statuses // ignore: cast_nullable_to_non_nullable
as Set<ReservationStatus>,text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,servicePointId: freezed == servicePointId ? _self.servicePointId : servicePointId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
