// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'jwt_claims_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JwtClaimsDto {

 String get sub; String get email; String get name;
/// Create a copy of JwtClaimsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JwtClaimsDtoCopyWith<JwtClaimsDto> get copyWith => _$JwtClaimsDtoCopyWithImpl<JwtClaimsDto>(this as JwtClaimsDto, _$identity);

  /// Serializes this JwtClaimsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JwtClaimsDto&&(identical(other.sub, sub) || other.sub == sub)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sub,email,name);

@override
String toString() {
  return 'JwtClaimsDto(sub: $sub, email: $email, name: $name)';
}


}

/// @nodoc
abstract mixin class $JwtClaimsDtoCopyWith<$Res>  {
  factory $JwtClaimsDtoCopyWith(JwtClaimsDto value, $Res Function(JwtClaimsDto) _then) = _$JwtClaimsDtoCopyWithImpl;
@useResult
$Res call({
 String sub, String email, String name
});




}
/// @nodoc
class _$JwtClaimsDtoCopyWithImpl<$Res>
    implements $JwtClaimsDtoCopyWith<$Res> {
  _$JwtClaimsDtoCopyWithImpl(this._self, this._then);

  final JwtClaimsDto _self;
  final $Res Function(JwtClaimsDto) _then;

/// Create a copy of JwtClaimsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sub = null,Object? email = null,Object? name = null,}) {
  return _then(_self.copyWith(
sub: null == sub ? _self.sub : sub // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [JwtClaimsDto].
extension JwtClaimsDtoPatterns on JwtClaimsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JwtClaimsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JwtClaimsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JwtClaimsDto value)  $default,){
final _that = this;
switch (_that) {
case _JwtClaimsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JwtClaimsDto value)?  $default,){
final _that = this;
switch (_that) {
case _JwtClaimsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String sub,  String email,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JwtClaimsDto() when $default != null:
return $default(_that.sub,_that.email,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String sub,  String email,  String name)  $default,) {final _that = this;
switch (_that) {
case _JwtClaimsDto():
return $default(_that.sub,_that.email,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String sub,  String email,  String name)?  $default,) {final _that = this;
switch (_that) {
case _JwtClaimsDto() when $default != null:
return $default(_that.sub,_that.email,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JwtClaimsDto extends JwtClaimsDto {
  const _JwtClaimsDto({required this.sub, required this.email, required this.name}): super._();
  factory _JwtClaimsDto.fromJson(Map<String, dynamic> json) => _$JwtClaimsDtoFromJson(json);

@override final  String sub;
@override final  String email;
@override final  String name;

/// Create a copy of JwtClaimsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JwtClaimsDtoCopyWith<_JwtClaimsDto> get copyWith => __$JwtClaimsDtoCopyWithImpl<_JwtClaimsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JwtClaimsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JwtClaimsDto&&(identical(other.sub, sub) || other.sub == sub)&&(identical(other.email, email) || other.email == email)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sub,email,name);

@override
String toString() {
  return 'JwtClaimsDto(sub: $sub, email: $email, name: $name)';
}


}

/// @nodoc
abstract mixin class _$JwtClaimsDtoCopyWith<$Res> implements $JwtClaimsDtoCopyWith<$Res> {
  factory _$JwtClaimsDtoCopyWith(_JwtClaimsDto value, $Res Function(_JwtClaimsDto) _then) = __$JwtClaimsDtoCopyWithImpl;
@override @useResult
$Res call({
 String sub, String email, String name
});




}
/// @nodoc
class __$JwtClaimsDtoCopyWithImpl<$Res>
    implements _$JwtClaimsDtoCopyWith<$Res> {
  __$JwtClaimsDtoCopyWithImpl(this._self, this._then);

  final _JwtClaimsDto _self;
  final $Res Function(_JwtClaimsDto) _then;

/// Create a copy of JwtClaimsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sub = null,Object? email = null,Object? name = null,}) {
  return _then(_JwtClaimsDto(
sub: null == sub ? _self.sub : sub // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
