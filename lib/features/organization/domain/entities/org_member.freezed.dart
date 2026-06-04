// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'org_member.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrgMember {

/// The user's GUID (used as the path id for permission/remove calls).
 String get userId; String get email; String get name; String get role; int get permissions;
/// Create a copy of OrgMember
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrgMemberCopyWith<OrgMember> get copyWith => _$OrgMemberCopyWithImpl<OrgMember>(this as OrgMember, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrgMember&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.permissions, permissions) || other.permissions == permissions));
}


@override
int get hashCode => Object.hash(runtimeType,userId,email,name,role,permissions);

@override
String toString() {
  return 'OrgMember(userId: $userId, email: $email, name: $name, role: $role, permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class $OrgMemberCopyWith<$Res>  {
  factory $OrgMemberCopyWith(OrgMember value, $Res Function(OrgMember) _then) = _$OrgMemberCopyWithImpl;
@useResult
$Res call({
 String userId, String email, String name, String role, int permissions
});




}
/// @nodoc
class _$OrgMemberCopyWithImpl<$Res>
    implements $OrgMemberCopyWith<$Res> {
  _$OrgMemberCopyWithImpl(this._self, this._then);

  final OrgMember _self;
  final $Res Function(OrgMember) _then;

/// Create a copy of OrgMember
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


/// Adds pattern-matching-related methods to [OrgMember].
extension OrgMemberPatterns on OrgMember {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrgMember value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrgMember() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrgMember value)  $default,){
final _that = this;
switch (_that) {
case _OrgMember():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrgMember value)?  $default,){
final _that = this;
switch (_that) {
case _OrgMember() when $default != null:
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
case _OrgMember() when $default != null:
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
case _OrgMember():
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
case _OrgMember() when $default != null:
return $default(_that.userId,_that.email,_that.name,_that.role,_that.permissions);case _:
  return null;

}
}

}

/// @nodoc


class _OrgMember extends OrgMember {
  const _OrgMember({required this.userId, required this.email, required this.name, required this.role, required this.permissions}): super._();
  

/// The user's GUID (used as the path id for permission/remove calls).
@override final  String userId;
@override final  String email;
@override final  String name;
@override final  String role;
@override final  int permissions;

/// Create a copy of OrgMember
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrgMemberCopyWith<_OrgMember> get copyWith => __$OrgMemberCopyWithImpl<_OrgMember>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrgMember&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name)&&(identical(other.role, role) || other.role == role)&&(identical(other.permissions, permissions) || other.permissions == permissions));
}


@override
int get hashCode => Object.hash(runtimeType,userId,email,name,role,permissions);

@override
String toString() {
  return 'OrgMember(userId: $userId, email: $email, name: $name, role: $role, permissions: $permissions)';
}


}

/// @nodoc
abstract mixin class _$OrgMemberCopyWith<$Res> implements $OrgMemberCopyWith<$Res> {
  factory _$OrgMemberCopyWith(_OrgMember value, $Res Function(_OrgMember) _then) = __$OrgMemberCopyWithImpl;
@override @useResult
$Res call({
 String userId, String email, String name, String role, int permissions
});




}
/// @nodoc
class __$OrgMemberCopyWithImpl<$Res>
    implements _$OrgMemberCopyWith<$Res> {
  __$OrgMemberCopyWithImpl(this._self, this._then);

  final _OrgMember _self;
  final $Res Function(_OrgMember) _then;

/// Create a copy of OrgMember
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? email = null,Object? name = null,Object? role = null,Object? permissions = null,}) {
  return _then(_OrgMember(
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
