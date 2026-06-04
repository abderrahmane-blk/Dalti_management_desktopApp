// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'queue_reservation_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QueueReservationDto {

 int get id; int get queueId; String get status; String? get name; String? get phone; String? get userId; int? get position; String? get secretCode; DateTime? get createdAt; String? get scheduledDate; String? get scheduledTime; Object? get info; int? get servicePointId; String? get calledByUserId; DateTime? get calledAt;
/// Create a copy of QueueReservationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueueReservationDtoCopyWith<QueueReservationDto> get copyWith => _$QueueReservationDtoCopyWithImpl<QueueReservationDto>(this as QueueReservationDto, _$identity);

  /// Serializes this QueueReservationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueueReservationDto&&(identical(other.id, id) || other.id == id)&&(identical(other.queueId, queueId) || other.queueId == queueId)&&(identical(other.status, status) || other.status == status)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.position, position) || other.position == position)&&(identical(other.secretCode, secretCode) || other.secretCode == secretCode)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.scheduledDate, scheduledDate) || other.scheduledDate == scheduledDate)&&(identical(other.scheduledTime, scheduledTime) || other.scheduledTime == scheduledTime)&&const DeepCollectionEquality().equals(other.info, info)&&(identical(other.servicePointId, servicePointId) || other.servicePointId == servicePointId)&&(identical(other.calledByUserId, calledByUserId) || other.calledByUserId == calledByUserId)&&(identical(other.calledAt, calledAt) || other.calledAt == calledAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,queueId,status,name,phone,userId,position,secretCode,createdAt,scheduledDate,scheduledTime,const DeepCollectionEquality().hash(info),servicePointId,calledByUserId,calledAt);

@override
String toString() {
  return 'QueueReservationDto(id: $id, queueId: $queueId, status: $status, name: $name, phone: $phone, userId: $userId, position: $position, secretCode: $secretCode, createdAt: $createdAt, scheduledDate: $scheduledDate, scheduledTime: $scheduledTime, info: $info, servicePointId: $servicePointId, calledByUserId: $calledByUserId, calledAt: $calledAt)';
}


}

/// @nodoc
abstract mixin class $QueueReservationDtoCopyWith<$Res>  {
  factory $QueueReservationDtoCopyWith(QueueReservationDto value, $Res Function(QueueReservationDto) _then) = _$QueueReservationDtoCopyWithImpl;
@useResult
$Res call({
 int id, int queueId, String status, String? name, String? phone, String? userId, int? position, String? secretCode, DateTime? createdAt, String? scheduledDate, String? scheduledTime, Object? info, int? servicePointId, String? calledByUserId, DateTime? calledAt
});




}
/// @nodoc
class _$QueueReservationDtoCopyWithImpl<$Res>
    implements $QueueReservationDtoCopyWith<$Res> {
  _$QueueReservationDtoCopyWithImpl(this._self, this._then);

  final QueueReservationDto _self;
  final $Res Function(QueueReservationDto) _then;

/// Create a copy of QueueReservationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? queueId = null,Object? status = null,Object? name = freezed,Object? phone = freezed,Object? userId = freezed,Object? position = freezed,Object? secretCode = freezed,Object? createdAt = freezed,Object? scheduledDate = freezed,Object? scheduledTime = freezed,Object? info = freezed,Object? servicePointId = freezed,Object? calledByUserId = freezed,Object? calledAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,queueId: null == queueId ? _self.queueId : queueId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int?,secretCode: freezed == secretCode ? _self.secretCode : secretCode // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,scheduledDate: freezed == scheduledDate ? _self.scheduledDate : scheduledDate // ignore: cast_nullable_to_non_nullable
as String?,scheduledTime: freezed == scheduledTime ? _self.scheduledTime : scheduledTime // ignore: cast_nullable_to_non_nullable
as String?,info: freezed == info ? _self.info : info ,servicePointId: freezed == servicePointId ? _self.servicePointId : servicePointId // ignore: cast_nullable_to_non_nullable
as int?,calledByUserId: freezed == calledByUserId ? _self.calledByUserId : calledByUserId // ignore: cast_nullable_to_non_nullable
as String?,calledAt: freezed == calledAt ? _self.calledAt : calledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [QueueReservationDto].
extension QueueReservationDtoPatterns on QueueReservationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueueReservationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueueReservationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueueReservationDto value)  $default,){
final _that = this;
switch (_that) {
case _QueueReservationDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueueReservationDto value)?  $default,){
final _that = this;
switch (_that) {
case _QueueReservationDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int queueId,  String status,  String? name,  String? phone,  String? userId,  int? position,  String? secretCode,  DateTime? createdAt,  String? scheduledDate,  String? scheduledTime,  Object? info,  int? servicePointId,  String? calledByUserId,  DateTime? calledAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueueReservationDto() when $default != null:
return $default(_that.id,_that.queueId,_that.status,_that.name,_that.phone,_that.userId,_that.position,_that.secretCode,_that.createdAt,_that.scheduledDate,_that.scheduledTime,_that.info,_that.servicePointId,_that.calledByUserId,_that.calledAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int queueId,  String status,  String? name,  String? phone,  String? userId,  int? position,  String? secretCode,  DateTime? createdAt,  String? scheduledDate,  String? scheduledTime,  Object? info,  int? servicePointId,  String? calledByUserId,  DateTime? calledAt)  $default,) {final _that = this;
switch (_that) {
case _QueueReservationDto():
return $default(_that.id,_that.queueId,_that.status,_that.name,_that.phone,_that.userId,_that.position,_that.secretCode,_that.createdAt,_that.scheduledDate,_that.scheduledTime,_that.info,_that.servicePointId,_that.calledByUserId,_that.calledAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int queueId,  String status,  String? name,  String? phone,  String? userId,  int? position,  String? secretCode,  DateTime? createdAt,  String? scheduledDate,  String? scheduledTime,  Object? info,  int? servicePointId,  String? calledByUserId,  DateTime? calledAt)?  $default,) {final _that = this;
switch (_that) {
case _QueueReservationDto() when $default != null:
return $default(_that.id,_that.queueId,_that.status,_that.name,_that.phone,_that.userId,_that.position,_that.secretCode,_that.createdAt,_that.scheduledDate,_that.scheduledTime,_that.info,_that.servicePointId,_that.calledByUserId,_that.calledAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QueueReservationDto extends QueueReservationDto {
  const _QueueReservationDto({required this.id, required this.queueId, required this.status, this.name, this.phone, this.userId, this.position, this.secretCode, this.createdAt, this.scheduledDate, this.scheduledTime, this.info, this.servicePointId, this.calledByUserId, this.calledAt}): super._();
  factory _QueueReservationDto.fromJson(Map<String, dynamic> json) => _$QueueReservationDtoFromJson(json);

@override final  int id;
@override final  int queueId;
@override final  String status;
@override final  String? name;
@override final  String? phone;
@override final  String? userId;
@override final  int? position;
@override final  String? secretCode;
@override final  DateTime? createdAt;
@override final  String? scheduledDate;
@override final  String? scheduledTime;
@override final  Object? info;
@override final  int? servicePointId;
@override final  String? calledByUserId;
@override final  DateTime? calledAt;

/// Create a copy of QueueReservationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueueReservationDtoCopyWith<_QueueReservationDto> get copyWith => __$QueueReservationDtoCopyWithImpl<_QueueReservationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QueueReservationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueueReservationDto&&(identical(other.id, id) || other.id == id)&&(identical(other.queueId, queueId) || other.queueId == queueId)&&(identical(other.status, status) || other.status == status)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.position, position) || other.position == position)&&(identical(other.secretCode, secretCode) || other.secretCode == secretCode)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.scheduledDate, scheduledDate) || other.scheduledDate == scheduledDate)&&(identical(other.scheduledTime, scheduledTime) || other.scheduledTime == scheduledTime)&&const DeepCollectionEquality().equals(other.info, info)&&(identical(other.servicePointId, servicePointId) || other.servicePointId == servicePointId)&&(identical(other.calledByUserId, calledByUserId) || other.calledByUserId == calledByUserId)&&(identical(other.calledAt, calledAt) || other.calledAt == calledAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,queueId,status,name,phone,userId,position,secretCode,createdAt,scheduledDate,scheduledTime,const DeepCollectionEquality().hash(info),servicePointId,calledByUserId,calledAt);

@override
String toString() {
  return 'QueueReservationDto(id: $id, queueId: $queueId, status: $status, name: $name, phone: $phone, userId: $userId, position: $position, secretCode: $secretCode, createdAt: $createdAt, scheduledDate: $scheduledDate, scheduledTime: $scheduledTime, info: $info, servicePointId: $servicePointId, calledByUserId: $calledByUserId, calledAt: $calledAt)';
}


}

/// @nodoc
abstract mixin class _$QueueReservationDtoCopyWith<$Res> implements $QueueReservationDtoCopyWith<$Res> {
  factory _$QueueReservationDtoCopyWith(_QueueReservationDto value, $Res Function(_QueueReservationDto) _then) = __$QueueReservationDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, int queueId, String status, String? name, String? phone, String? userId, int? position, String? secretCode, DateTime? createdAt, String? scheduledDate, String? scheduledTime, Object? info, int? servicePointId, String? calledByUserId, DateTime? calledAt
});




}
/// @nodoc
class __$QueueReservationDtoCopyWithImpl<$Res>
    implements _$QueueReservationDtoCopyWith<$Res> {
  __$QueueReservationDtoCopyWithImpl(this._self, this._then);

  final _QueueReservationDto _self;
  final $Res Function(_QueueReservationDto) _then;

/// Create a copy of QueueReservationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? queueId = null,Object? status = null,Object? name = freezed,Object? phone = freezed,Object? userId = freezed,Object? position = freezed,Object? secretCode = freezed,Object? createdAt = freezed,Object? scheduledDate = freezed,Object? scheduledTime = freezed,Object? info = freezed,Object? servicePointId = freezed,Object? calledByUserId = freezed,Object? calledAt = freezed,}) {
  return _then(_QueueReservationDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,queueId: null == queueId ? _self.queueId : queueId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int?,secretCode: freezed == secretCode ? _self.secretCode : secretCode // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,scheduledDate: freezed == scheduledDate ? _self.scheduledDate : scheduledDate // ignore: cast_nullable_to_non_nullable
as String?,scheduledTime: freezed == scheduledTime ? _self.scheduledTime : scheduledTime // ignore: cast_nullable_to_non_nullable
as String?,info: freezed == info ? _self.info : info ,servicePointId: freezed == servicePointId ? _self.servicePointId : servicePointId // ignore: cast_nullable_to_non_nullable
as int?,calledByUserId: freezed == calledByUserId ? _self.calledByUserId : calledByUserId // ignore: cast_nullable_to_non_nullable
as String?,calledAt: freezed == calledAt ? _self.calledAt : calledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$QueueBoardDto {

 List<QueueReservationDto> get reservations;
/// Create a copy of QueueBoardDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueueBoardDtoCopyWith<QueueBoardDto> get copyWith => _$QueueBoardDtoCopyWithImpl<QueueBoardDto>(this as QueueBoardDto, _$identity);

  /// Serializes this QueueBoardDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueueBoardDto&&const DeepCollectionEquality().equals(other.reservations, reservations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(reservations));

@override
String toString() {
  return 'QueueBoardDto(reservations: $reservations)';
}


}

/// @nodoc
abstract mixin class $QueueBoardDtoCopyWith<$Res>  {
  factory $QueueBoardDtoCopyWith(QueueBoardDto value, $Res Function(QueueBoardDto) _then) = _$QueueBoardDtoCopyWithImpl;
@useResult
$Res call({
 List<QueueReservationDto> reservations
});




}
/// @nodoc
class _$QueueBoardDtoCopyWithImpl<$Res>
    implements $QueueBoardDtoCopyWith<$Res> {
  _$QueueBoardDtoCopyWithImpl(this._self, this._then);

  final QueueBoardDto _self;
  final $Res Function(QueueBoardDto) _then;

/// Create a copy of QueueBoardDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reservations = null,}) {
  return _then(_self.copyWith(
reservations: null == reservations ? _self.reservations : reservations // ignore: cast_nullable_to_non_nullable
as List<QueueReservationDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [QueueBoardDto].
extension QueueBoardDtoPatterns on QueueBoardDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueueBoardDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueueBoardDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueueBoardDto value)  $default,){
final _that = this;
switch (_that) {
case _QueueBoardDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueueBoardDto value)?  $default,){
final _that = this;
switch (_that) {
case _QueueBoardDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<QueueReservationDto> reservations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueueBoardDto() when $default != null:
return $default(_that.reservations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<QueueReservationDto> reservations)  $default,) {final _that = this;
switch (_that) {
case _QueueBoardDto():
return $default(_that.reservations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<QueueReservationDto> reservations)?  $default,) {final _that = this;
switch (_that) {
case _QueueBoardDto() when $default != null:
return $default(_that.reservations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QueueBoardDto extends QueueBoardDto {
  const _QueueBoardDto({final  List<QueueReservationDto> reservations = const <QueueReservationDto>[]}): _reservations = reservations,super._();
  factory _QueueBoardDto.fromJson(Map<String, dynamic> json) => _$QueueBoardDtoFromJson(json);

 final  List<QueueReservationDto> _reservations;
@override@JsonKey() List<QueueReservationDto> get reservations {
  if (_reservations is EqualUnmodifiableListView) return _reservations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reservations);
}


/// Create a copy of QueueBoardDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueueBoardDtoCopyWith<_QueueBoardDto> get copyWith => __$QueueBoardDtoCopyWithImpl<_QueueBoardDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QueueBoardDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueueBoardDto&&const DeepCollectionEquality().equals(other._reservations, _reservations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_reservations));

@override
String toString() {
  return 'QueueBoardDto(reservations: $reservations)';
}


}

/// @nodoc
abstract mixin class _$QueueBoardDtoCopyWith<$Res> implements $QueueBoardDtoCopyWith<$Res> {
  factory _$QueueBoardDtoCopyWith(_QueueBoardDto value, $Res Function(_QueueBoardDto) _then) = __$QueueBoardDtoCopyWithImpl;
@override @useResult
$Res call({
 List<QueueReservationDto> reservations
});




}
/// @nodoc
class __$QueueBoardDtoCopyWithImpl<$Res>
    implements _$QueueBoardDtoCopyWith<$Res> {
  __$QueueBoardDtoCopyWithImpl(this._self, this._then);

  final _QueueBoardDto _self;
  final $Res Function(_QueueBoardDto) _then;

/// Create a copy of QueueBoardDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reservations = null,}) {
  return _then(_QueueBoardDto(
reservations: null == reservations ? _self._reservations : reservations // ignore: cast_nullable_to_non_nullable
as List<QueueReservationDto>,
  ));
}


}


/// @nodoc
mixin _$CallResultDto {

 QueueReservationDto get reservation;
/// Create a copy of CallResultDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CallResultDtoCopyWith<CallResultDto> get copyWith => _$CallResultDtoCopyWithImpl<CallResultDto>(this as CallResultDto, _$identity);

  /// Serializes this CallResultDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CallResultDto&&(identical(other.reservation, reservation) || other.reservation == reservation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reservation);

@override
String toString() {
  return 'CallResultDto(reservation: $reservation)';
}


}

/// @nodoc
abstract mixin class $CallResultDtoCopyWith<$Res>  {
  factory $CallResultDtoCopyWith(CallResultDto value, $Res Function(CallResultDto) _then) = _$CallResultDtoCopyWithImpl;
@useResult
$Res call({
 QueueReservationDto reservation
});


$QueueReservationDtoCopyWith<$Res> get reservation;

}
/// @nodoc
class _$CallResultDtoCopyWithImpl<$Res>
    implements $CallResultDtoCopyWith<$Res> {
  _$CallResultDtoCopyWithImpl(this._self, this._then);

  final CallResultDto _self;
  final $Res Function(CallResultDto) _then;

/// Create a copy of CallResultDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reservation = null,}) {
  return _then(_self.copyWith(
reservation: null == reservation ? _self.reservation : reservation // ignore: cast_nullable_to_non_nullable
as QueueReservationDto,
  ));
}
/// Create a copy of CallResultDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QueueReservationDtoCopyWith<$Res> get reservation {
  
  return $QueueReservationDtoCopyWith<$Res>(_self.reservation, (value) {
    return _then(_self.copyWith(reservation: value));
  });
}
}


/// Adds pattern-matching-related methods to [CallResultDto].
extension CallResultDtoPatterns on CallResultDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CallResultDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CallResultDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CallResultDto value)  $default,){
final _that = this;
switch (_that) {
case _CallResultDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CallResultDto value)?  $default,){
final _that = this;
switch (_that) {
case _CallResultDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( QueueReservationDto reservation)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CallResultDto() when $default != null:
return $default(_that.reservation);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( QueueReservationDto reservation)  $default,) {final _that = this;
switch (_that) {
case _CallResultDto():
return $default(_that.reservation);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( QueueReservationDto reservation)?  $default,) {final _that = this;
switch (_that) {
case _CallResultDto() when $default != null:
return $default(_that.reservation);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CallResultDto extends CallResultDto {
  const _CallResultDto({required this.reservation}): super._();
  factory _CallResultDto.fromJson(Map<String, dynamic> json) => _$CallResultDtoFromJson(json);

@override final  QueueReservationDto reservation;

/// Create a copy of CallResultDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CallResultDtoCopyWith<_CallResultDto> get copyWith => __$CallResultDtoCopyWithImpl<_CallResultDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CallResultDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CallResultDto&&(identical(other.reservation, reservation) || other.reservation == reservation));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reservation);

@override
String toString() {
  return 'CallResultDto(reservation: $reservation)';
}


}

/// @nodoc
abstract mixin class _$CallResultDtoCopyWith<$Res> implements $CallResultDtoCopyWith<$Res> {
  factory _$CallResultDtoCopyWith(_CallResultDto value, $Res Function(_CallResultDto) _then) = __$CallResultDtoCopyWithImpl;
@override @useResult
$Res call({
 QueueReservationDto reservation
});


@override $QueueReservationDtoCopyWith<$Res> get reservation;

}
/// @nodoc
class __$CallResultDtoCopyWithImpl<$Res>
    implements _$CallResultDtoCopyWith<$Res> {
  __$CallResultDtoCopyWithImpl(this._self, this._then);

  final _CallResultDto _self;
  final $Res Function(_CallResultDto) _then;

/// Create a copy of CallResultDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reservation = null,}) {
  return _then(_CallResultDto(
reservation: null == reservation ? _self.reservation : reservation // ignore: cast_nullable_to_non_nullable
as QueueReservationDto,
  ));
}

/// Create a copy of CallResultDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QueueReservationDtoCopyWith<$Res> get reservation {
  
  return $QueueReservationDtoCopyWith<$Res>(_self.reservation, (value) {
    return _then(_self.copyWith(reservation: value));
  });
}
}

// dart format on
