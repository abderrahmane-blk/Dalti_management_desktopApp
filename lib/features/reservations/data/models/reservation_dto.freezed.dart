// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReservationDto {

 String get id; String get customerName; int get partySize; DateTime get scheduledAt; String get status; String? get note;
/// Create a copy of ReservationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReservationDtoCopyWith<ReservationDto> get copyWith => _$ReservationDtoCopyWithImpl<ReservationDto>(this as ReservationDto, _$identity);

  /// Serializes this ReservationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReservationDto&&(identical(other.id, id) || other.id == id)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.partySize, partySize) || other.partySize == partySize)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,customerName,partySize,scheduledAt,status,note);

@override
String toString() {
  return 'ReservationDto(id: $id, customerName: $customerName, partySize: $partySize, scheduledAt: $scheduledAt, status: $status, note: $note)';
}


}

/// @nodoc
abstract mixin class $ReservationDtoCopyWith<$Res>  {
  factory $ReservationDtoCopyWith(ReservationDto value, $Res Function(ReservationDto) _then) = _$ReservationDtoCopyWithImpl;
@useResult
$Res call({
 String id, String customerName, int partySize, DateTime scheduledAt, String status, String? note
});




}
/// @nodoc
class _$ReservationDtoCopyWithImpl<$Res>
    implements $ReservationDtoCopyWith<$Res> {
  _$ReservationDtoCopyWithImpl(this._self, this._then);

  final ReservationDto _self;
  final $Res Function(ReservationDto) _then;

/// Create a copy of ReservationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? customerName = null,Object? partySize = null,Object? scheduledAt = null,Object? status = null,Object? note = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,partySize: null == partySize ? _self.partySize : partySize // ignore: cast_nullable_to_non_nullable
as int,scheduledAt: null == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReservationDto].
extension ReservationDtoPatterns on ReservationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReservationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReservationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReservationDto value)  $default,){
final _that = this;
switch (_that) {
case _ReservationDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReservationDto value)?  $default,){
final _that = this;
switch (_that) {
case _ReservationDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String customerName,  int partySize,  DateTime scheduledAt,  String status,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReservationDto() when $default != null:
return $default(_that.id,_that.customerName,_that.partySize,_that.scheduledAt,_that.status,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String customerName,  int partySize,  DateTime scheduledAt,  String status,  String? note)  $default,) {final _that = this;
switch (_that) {
case _ReservationDto():
return $default(_that.id,_that.customerName,_that.partySize,_that.scheduledAt,_that.status,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String customerName,  int partySize,  DateTime scheduledAt,  String status,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _ReservationDto() when $default != null:
return $default(_that.id,_that.customerName,_that.partySize,_that.scheduledAt,_that.status,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReservationDto extends ReservationDto {
  const _ReservationDto({required this.id, required this.customerName, required this.partySize, required this.scheduledAt, required this.status, this.note}): super._();
  factory _ReservationDto.fromJson(Map<String, dynamic> json) => _$ReservationDtoFromJson(json);

@override final  String id;
@override final  String customerName;
@override final  int partySize;
@override final  DateTime scheduledAt;
@override final  String status;
@override final  String? note;

/// Create a copy of ReservationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReservationDtoCopyWith<_ReservationDto> get copyWith => __$ReservationDtoCopyWithImpl<_ReservationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReservationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReservationDto&&(identical(other.id, id) || other.id == id)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.partySize, partySize) || other.partySize == partySize)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,customerName,partySize,scheduledAt,status,note);

@override
String toString() {
  return 'ReservationDto(id: $id, customerName: $customerName, partySize: $partySize, scheduledAt: $scheduledAt, status: $status, note: $note)';
}


}

/// @nodoc
abstract mixin class _$ReservationDtoCopyWith<$Res> implements $ReservationDtoCopyWith<$Res> {
  factory _$ReservationDtoCopyWith(_ReservationDto value, $Res Function(_ReservationDto) _then) = __$ReservationDtoCopyWithImpl;
@override @useResult
$Res call({
 String id, String customerName, int partySize, DateTime scheduledAt, String status, String? note
});




}
/// @nodoc
class __$ReservationDtoCopyWithImpl<$Res>
    implements _$ReservationDtoCopyWith<$Res> {
  __$ReservationDtoCopyWithImpl(this._self, this._then);

  final _ReservationDto _self;
  final $Res Function(_ReservationDto) _then;

/// Create a copy of ReservationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? customerName = null,Object? partySize = null,Object? scheduledAt = null,Object? status = null,Object? note = freezed,}) {
  return _then(_ReservationDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,customerName: null == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String,partySize: null == partySize ? _self.partySize : partySize // ignore: cast_nullable_to_non_nullable
as int,scheduledAt: null == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
