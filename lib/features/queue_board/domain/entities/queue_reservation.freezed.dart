// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'queue_reservation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$QueueReservation {

 int get id; int get queueId; ReservationStatus get status; String? get name; String? get phone; String? get userId; int? get position; String? get secretCode; DateTime? get createdAt; String? get scheduledDate; String? get scheduledTime; String? get info; int? get servicePointId; String? get calledByUserId; DateTime? get calledAt;
/// Create a copy of QueueReservation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueueReservationCopyWith<QueueReservation> get copyWith => _$QueueReservationCopyWithImpl<QueueReservation>(this as QueueReservation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueueReservation&&(identical(other.id, id) || other.id == id)&&(identical(other.queueId, queueId) || other.queueId == queueId)&&(identical(other.status, status) || other.status == status)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.position, position) || other.position == position)&&(identical(other.secretCode, secretCode) || other.secretCode == secretCode)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.scheduledDate, scheduledDate) || other.scheduledDate == scheduledDate)&&(identical(other.scheduledTime, scheduledTime) || other.scheduledTime == scheduledTime)&&(identical(other.info, info) || other.info == info)&&(identical(other.servicePointId, servicePointId) || other.servicePointId == servicePointId)&&(identical(other.calledByUserId, calledByUserId) || other.calledByUserId == calledByUserId)&&(identical(other.calledAt, calledAt) || other.calledAt == calledAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,queueId,status,name,phone,userId,position,secretCode,createdAt,scheduledDate,scheduledTime,info,servicePointId,calledByUserId,calledAt);

@override
String toString() {
  return 'QueueReservation(id: $id, queueId: $queueId, status: $status, name: $name, phone: $phone, userId: $userId, position: $position, secretCode: $secretCode, createdAt: $createdAt, scheduledDate: $scheduledDate, scheduledTime: $scheduledTime, info: $info, servicePointId: $servicePointId, calledByUserId: $calledByUserId, calledAt: $calledAt)';
}


}

/// @nodoc
abstract mixin class $QueueReservationCopyWith<$Res>  {
  factory $QueueReservationCopyWith(QueueReservation value, $Res Function(QueueReservation) _then) = _$QueueReservationCopyWithImpl;
@useResult
$Res call({
 int id, int queueId, ReservationStatus status, String? name, String? phone, String? userId, int? position, String? secretCode, DateTime? createdAt, String? scheduledDate, String? scheduledTime, String? info, int? servicePointId, String? calledByUserId, DateTime? calledAt
});




}
/// @nodoc
class _$QueueReservationCopyWithImpl<$Res>
    implements $QueueReservationCopyWith<$Res> {
  _$QueueReservationCopyWithImpl(this._self, this._then);

  final QueueReservation _self;
  final $Res Function(QueueReservation) _then;

/// Create a copy of QueueReservation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? queueId = null,Object? status = null,Object? name = freezed,Object? phone = freezed,Object? userId = freezed,Object? position = freezed,Object? secretCode = freezed,Object? createdAt = freezed,Object? scheduledDate = freezed,Object? scheduledTime = freezed,Object? info = freezed,Object? servicePointId = freezed,Object? calledByUserId = freezed,Object? calledAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,queueId: null == queueId ? _self.queueId : queueId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReservationStatus,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int?,secretCode: freezed == secretCode ? _self.secretCode : secretCode // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,scheduledDate: freezed == scheduledDate ? _self.scheduledDate : scheduledDate // ignore: cast_nullable_to_non_nullable
as String?,scheduledTime: freezed == scheduledTime ? _self.scheduledTime : scheduledTime // ignore: cast_nullable_to_non_nullable
as String?,info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as String?,servicePointId: freezed == servicePointId ? _self.servicePointId : servicePointId // ignore: cast_nullable_to_non_nullable
as int?,calledByUserId: freezed == calledByUserId ? _self.calledByUserId : calledByUserId // ignore: cast_nullable_to_non_nullable
as String?,calledAt: freezed == calledAt ? _self.calledAt : calledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [QueueReservation].
extension QueueReservationPatterns on QueueReservation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueueReservation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueueReservation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueueReservation value)  $default,){
final _that = this;
switch (_that) {
case _QueueReservation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueueReservation value)?  $default,){
final _that = this;
switch (_that) {
case _QueueReservation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int queueId,  ReservationStatus status,  String? name,  String? phone,  String? userId,  int? position,  String? secretCode,  DateTime? createdAt,  String? scheduledDate,  String? scheduledTime,  String? info,  int? servicePointId,  String? calledByUserId,  DateTime? calledAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueueReservation() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int queueId,  ReservationStatus status,  String? name,  String? phone,  String? userId,  int? position,  String? secretCode,  DateTime? createdAt,  String? scheduledDate,  String? scheduledTime,  String? info,  int? servicePointId,  String? calledByUserId,  DateTime? calledAt)  $default,) {final _that = this;
switch (_that) {
case _QueueReservation():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int queueId,  ReservationStatus status,  String? name,  String? phone,  String? userId,  int? position,  String? secretCode,  DateTime? createdAt,  String? scheduledDate,  String? scheduledTime,  String? info,  int? servicePointId,  String? calledByUserId,  DateTime? calledAt)?  $default,) {final _that = this;
switch (_that) {
case _QueueReservation() when $default != null:
return $default(_that.id,_that.queueId,_that.status,_that.name,_that.phone,_that.userId,_that.position,_that.secretCode,_that.createdAt,_that.scheduledDate,_that.scheduledTime,_that.info,_that.servicePointId,_that.calledByUserId,_that.calledAt);case _:
  return null;

}
}

}

/// @nodoc


class _QueueReservation extends QueueReservation {
  const _QueueReservation({required this.id, required this.queueId, required this.status, this.name, this.phone, this.userId, this.position, this.secretCode, this.createdAt, this.scheduledDate, this.scheduledTime, this.info, this.servicePointId, this.calledByUserId, this.calledAt}): super._();
  

@override final  int id;
@override final  int queueId;
@override final  ReservationStatus status;
@override final  String? name;
@override final  String? phone;
@override final  String? userId;
@override final  int? position;
@override final  String? secretCode;
@override final  DateTime? createdAt;
@override final  String? scheduledDate;
@override final  String? scheduledTime;
@override final  String? info;
@override final  int? servicePointId;
@override final  String? calledByUserId;
@override final  DateTime? calledAt;

/// Create a copy of QueueReservation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueueReservationCopyWith<_QueueReservation> get copyWith => __$QueueReservationCopyWithImpl<_QueueReservation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueueReservation&&(identical(other.id, id) || other.id == id)&&(identical(other.queueId, queueId) || other.queueId == queueId)&&(identical(other.status, status) || other.status == status)&&(identical(other.name, name) || other.name == name)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.position, position) || other.position == position)&&(identical(other.secretCode, secretCode) || other.secretCode == secretCode)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.scheduledDate, scheduledDate) || other.scheduledDate == scheduledDate)&&(identical(other.scheduledTime, scheduledTime) || other.scheduledTime == scheduledTime)&&(identical(other.info, info) || other.info == info)&&(identical(other.servicePointId, servicePointId) || other.servicePointId == servicePointId)&&(identical(other.calledByUserId, calledByUserId) || other.calledByUserId == calledByUserId)&&(identical(other.calledAt, calledAt) || other.calledAt == calledAt));
}


@override
int get hashCode => Object.hash(runtimeType,id,queueId,status,name,phone,userId,position,secretCode,createdAt,scheduledDate,scheduledTime,info,servicePointId,calledByUserId,calledAt);

@override
String toString() {
  return 'QueueReservation(id: $id, queueId: $queueId, status: $status, name: $name, phone: $phone, userId: $userId, position: $position, secretCode: $secretCode, createdAt: $createdAt, scheduledDate: $scheduledDate, scheduledTime: $scheduledTime, info: $info, servicePointId: $servicePointId, calledByUserId: $calledByUserId, calledAt: $calledAt)';
}


}

/// @nodoc
abstract mixin class _$QueueReservationCopyWith<$Res> implements $QueueReservationCopyWith<$Res> {
  factory _$QueueReservationCopyWith(_QueueReservation value, $Res Function(_QueueReservation) _then) = __$QueueReservationCopyWithImpl;
@override @useResult
$Res call({
 int id, int queueId, ReservationStatus status, String? name, String? phone, String? userId, int? position, String? secretCode, DateTime? createdAt, String? scheduledDate, String? scheduledTime, String? info, int? servicePointId, String? calledByUserId, DateTime? calledAt
});




}
/// @nodoc
class __$QueueReservationCopyWithImpl<$Res>
    implements _$QueueReservationCopyWith<$Res> {
  __$QueueReservationCopyWithImpl(this._self, this._then);

  final _QueueReservation _self;
  final $Res Function(_QueueReservation) _then;

/// Create a copy of QueueReservation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? queueId = null,Object? status = null,Object? name = freezed,Object? phone = freezed,Object? userId = freezed,Object? position = freezed,Object? secretCode = freezed,Object? createdAt = freezed,Object? scheduledDate = freezed,Object? scheduledTime = freezed,Object? info = freezed,Object? servicePointId = freezed,Object? calledByUserId = freezed,Object? calledAt = freezed,}) {
  return _then(_QueueReservation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,queueId: null == queueId ? _self.queueId : queueId // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ReservationStatus,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int?,secretCode: freezed == secretCode ? _self.secretCode : secretCode // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,scheduledDate: freezed == scheduledDate ? _self.scheduledDate : scheduledDate // ignore: cast_nullable_to_non_nullable
as String?,scheduledTime: freezed == scheduledTime ? _self.scheduledTime : scheduledTime // ignore: cast_nullable_to_non_nullable
as String?,info: freezed == info ? _self.info : info // ignore: cast_nullable_to_non_nullable
as String?,servicePointId: freezed == servicePointId ? _self.servicePointId : servicePointId // ignore: cast_nullable_to_non_nullable
as int?,calledByUserId: freezed == calledByUserId ? _self.calledByUserId : calledByUserId // ignore: cast_nullable_to_non_nullable
as String?,calledAt: freezed == calledAt ? _self.calledAt : calledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
