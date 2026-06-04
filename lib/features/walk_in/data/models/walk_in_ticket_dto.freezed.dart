// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'walk_in_ticket_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WalkInTicketDto {

 int get id; int get position; String get secretCode; String? get scheduledDate; String? get scheduledTime;
/// Create a copy of WalkInTicketDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WalkInTicketDtoCopyWith<WalkInTicketDto> get copyWith => _$WalkInTicketDtoCopyWithImpl<WalkInTicketDto>(this as WalkInTicketDto, _$identity);

  /// Serializes this WalkInTicketDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WalkInTicketDto&&(identical(other.id, id) || other.id == id)&&(identical(other.position, position) || other.position == position)&&(identical(other.secretCode, secretCode) || other.secretCode == secretCode)&&(identical(other.scheduledDate, scheduledDate) || other.scheduledDate == scheduledDate)&&(identical(other.scheduledTime, scheduledTime) || other.scheduledTime == scheduledTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,position,secretCode,scheduledDate,scheduledTime);

@override
String toString() {
  return 'WalkInTicketDto(id: $id, position: $position, secretCode: $secretCode, scheduledDate: $scheduledDate, scheduledTime: $scheduledTime)';
}


}

/// @nodoc
abstract mixin class $WalkInTicketDtoCopyWith<$Res>  {
  factory $WalkInTicketDtoCopyWith(WalkInTicketDto value, $Res Function(WalkInTicketDto) _then) = _$WalkInTicketDtoCopyWithImpl;
@useResult
$Res call({
 int id, int position, String secretCode, String? scheduledDate, String? scheduledTime
});




}
/// @nodoc
class _$WalkInTicketDtoCopyWithImpl<$Res>
    implements $WalkInTicketDtoCopyWith<$Res> {
  _$WalkInTicketDtoCopyWithImpl(this._self, this._then);

  final WalkInTicketDto _self;
  final $Res Function(WalkInTicketDto) _then;

/// Create a copy of WalkInTicketDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? position = null,Object? secretCode = null,Object? scheduledDate = freezed,Object? scheduledTime = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,secretCode: null == secretCode ? _self.secretCode : secretCode // ignore: cast_nullable_to_non_nullable
as String,scheduledDate: freezed == scheduledDate ? _self.scheduledDate : scheduledDate // ignore: cast_nullable_to_non_nullable
as String?,scheduledTime: freezed == scheduledTime ? _self.scheduledTime : scheduledTime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [WalkInTicketDto].
extension WalkInTicketDtoPatterns on WalkInTicketDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WalkInTicketDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WalkInTicketDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WalkInTicketDto value)  $default,){
final _that = this;
switch (_that) {
case _WalkInTicketDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WalkInTicketDto value)?  $default,){
final _that = this;
switch (_that) {
case _WalkInTicketDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int position,  String secretCode,  String? scheduledDate,  String? scheduledTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WalkInTicketDto() when $default != null:
return $default(_that.id,_that.position,_that.secretCode,_that.scheduledDate,_that.scheduledTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int position,  String secretCode,  String? scheduledDate,  String? scheduledTime)  $default,) {final _that = this;
switch (_that) {
case _WalkInTicketDto():
return $default(_that.id,_that.position,_that.secretCode,_that.scheduledDate,_that.scheduledTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int position,  String secretCode,  String? scheduledDate,  String? scheduledTime)?  $default,) {final _that = this;
switch (_that) {
case _WalkInTicketDto() when $default != null:
return $default(_that.id,_that.position,_that.secretCode,_that.scheduledDate,_that.scheduledTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WalkInTicketDto extends WalkInTicketDto {
  const _WalkInTicketDto({required this.id, required this.position, required this.secretCode, this.scheduledDate, this.scheduledTime}): super._();
  factory _WalkInTicketDto.fromJson(Map<String, dynamic> json) => _$WalkInTicketDtoFromJson(json);

@override final  int id;
@override final  int position;
@override final  String secretCode;
@override final  String? scheduledDate;
@override final  String? scheduledTime;

/// Create a copy of WalkInTicketDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WalkInTicketDtoCopyWith<_WalkInTicketDto> get copyWith => __$WalkInTicketDtoCopyWithImpl<_WalkInTicketDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WalkInTicketDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WalkInTicketDto&&(identical(other.id, id) || other.id == id)&&(identical(other.position, position) || other.position == position)&&(identical(other.secretCode, secretCode) || other.secretCode == secretCode)&&(identical(other.scheduledDate, scheduledDate) || other.scheduledDate == scheduledDate)&&(identical(other.scheduledTime, scheduledTime) || other.scheduledTime == scheduledTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,position,secretCode,scheduledDate,scheduledTime);

@override
String toString() {
  return 'WalkInTicketDto(id: $id, position: $position, secretCode: $secretCode, scheduledDate: $scheduledDate, scheduledTime: $scheduledTime)';
}


}

/// @nodoc
abstract mixin class _$WalkInTicketDtoCopyWith<$Res> implements $WalkInTicketDtoCopyWith<$Res> {
  factory _$WalkInTicketDtoCopyWith(_WalkInTicketDto value, $Res Function(_WalkInTicketDto) _then) = __$WalkInTicketDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, int position, String secretCode, String? scheduledDate, String? scheduledTime
});




}
/// @nodoc
class __$WalkInTicketDtoCopyWithImpl<$Res>
    implements _$WalkInTicketDtoCopyWith<$Res> {
  __$WalkInTicketDtoCopyWithImpl(this._self, this._then);

  final _WalkInTicketDto _self;
  final $Res Function(_WalkInTicketDto) _then;

/// Create a copy of WalkInTicketDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? position = null,Object? secretCode = null,Object? scheduledDate = freezed,Object? scheduledTime = freezed,}) {
  return _then(_WalkInTicketDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,secretCode: null == secretCode ? _self.secretCode : secretCode // ignore: cast_nullable_to_non_nullable
as String,scheduledDate: freezed == scheduledDate ? _self.scheduledDate : scheduledDate // ignore: cast_nullable_to_non_nullable
as String?,scheduledTime: freezed == scheduledTime ? _self.scheduledTime : scheduledTime // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
