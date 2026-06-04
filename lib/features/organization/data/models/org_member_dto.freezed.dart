// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'org_member_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrgMemberDto {

 String get userId; String get email; String get name; String get role; int get permissions;
/// Create a copy of OrgMemberDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrgMemberDtoCopyWith<OrgMemberDto> get copyWith => _$OrgMemberDtoCopyWithImpl<OrgMemberDto>(this as OrgMemberDto, _$identity);

  /// Serializes this OrgMemberDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrgMemberDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.permissions, permissions) || other.permissions == permissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,email,name,role,permissions);

@override
String toString() {
  return 'OrgMemberDto(userId: $userId, email: $email, name: $name, role: $role, permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class $OrgMemberDtoCopyWith<$Res>  {
  factory $OrgMemberDtoCopyWith(OrgMemberDto value, $Res Function(OrgMemberDto) _then) = _$OrgMemberDtoCopyWithImpl;
@useResult
$Res call({
 String userId, String email, String name, String role, int permissions
});




}
/// @nodoc
class _$OrgMemberDtoCopyWithImpl<$Res>
    implements $OrgMemberDtoCopyWith<$Res> {
  _$OrgMemberDtoCopyWithImpl(this._self, this._then);

  final OrgMemberDto _self;
  final $Res Function(OrgMemberDto) _then;

/// Create a copy of OrgMemberDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? email = null,Object? name = null,Object? role = null,Object? permissions = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OrgMemberDto].
extension OrgMemberDtoPatterns on OrgMemberDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrgMemberDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrgMemberDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrgMemberDto value)  $default,){
final _that = this;
switch (_that) {
case _OrgMemberDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrgMemberDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrgMemberDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String email,  String name,  String role,  int permissions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrgMemberDto() when $default != null:
return $default(_that.userId,_that.email,_that.name,_that.role,_that.permissions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String email,  String name,  String role,  int permissions)  $default,) {final _that = this;
switch (_that) {
case _OrgMemberDto():
return $default(_that.userId,_that.email,_that.name,_that.role,_that.permissions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String email,  String name,  String role,  int permissions)?  $default,) {final _that = this;
switch (_that) {
case _OrgMemberDto() when $default != null:
return $default(_that.userId,_that.email,_that.name,_that.role,_that.permissions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrgMemberDto extends OrgMemberDto {
  const _OrgMemberDto({required this.userId, required this.email, required this.name, required this.role, required this.permissions}): super._();
  factory _OrgMemberDto.fromJson(Map<String, dynamic> json) => _$OrgMemberDtoFromJson(json);

@override final  String userId;
@override final  String email;
@override final  String name;
@override final  String role;
@override final  int permissions;

/// Create a copy of OrgMemberDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrgMemberDtoCopyWith<_OrgMemberDto> get copyWith => __$OrgMemberDtoCopyWithImpl<_OrgMemberDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrgMemberDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrgMemberDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.permissions, permissions) || other.permissions == permissions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,email,name,role,permissions);

@override
String toString() {
  return 'OrgMemberDto(userId: $userId, email: $email, name: $name, role: $role, permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class _$OrgMemberDtoCopyWith<$Res> implements $OrgMemberDtoCopyWith<$Res> {
  factory _$OrgMemberDtoCopyWith(_OrgMemberDto value, $Res Function(_OrgMemberDto) _then) = __$OrgMemberDtoCopyWithImpl;
@override @useResult
$Res call({
 String userId, String email, String name, String role, int permissions
});




}
/// @nodoc
class __$OrgMemberDtoCopyWithImpl<$Res>
    implements _$OrgMemberDtoCopyWith<$Res> {
  __$OrgMemberDtoCopyWithImpl(this._self, this._then);

  final _OrgMemberDto _self;
  final $Res Function(_OrgMemberDto) _then;

/// Create a copy of OrgMemberDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? email = null,Object? name = null,Object? role = null,Object? permissions = null,}) {
  return _then(_OrgMemberDto(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,permissions: null == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
