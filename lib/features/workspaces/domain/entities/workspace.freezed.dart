// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workspace.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$L10n {

 String get ar; String get en; String get fr;
/// Create a copy of L10n
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$L10nCopyWith<L10n> get copyWith => _$L10nCopyWithImpl<L10n>(this as L10n, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is L10n&&(identical(other.ar, ar) || other.ar == ar)&&(identical(other.en, en) || other.en == en)&&(identical(other.fr, fr) || other.fr == fr));
}


@override
int get hashCode => Object.hash(runtimeType,ar,en,fr);

@override
String toString() {
  return 'L10n(ar: $ar, en: $en, fr: $fr)';
}


}

/// @nodoc
abstract mixin class $L10nCopyWith<$Res>  {
  factory $L10nCopyWith(L10n value, $Res Function(L10n) _then) = _$L10nCopyWithImpl;
@useResult
$Res call({
 String ar, String en, String fr
});




}
/// @nodoc
class _$L10nCopyWithImpl<$Res>
    implements $L10nCopyWith<$Res> {
  _$L10nCopyWithImpl(this._self, this._then);

  final L10n _self;
  final $Res Function(L10n) _then;

/// Create a copy of L10n
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ar = null,Object? en = null,Object? fr = null,}) {
  return _then(_self.copyWith(
ar: null == ar ? _self.ar : ar // ignore: cast_nullable_to_non_nullable
as String,en: null == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String,fr: null == fr ? _self.fr : fr // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [L10n].
extension L10nPatterns on L10n {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _L10n value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _L10n() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _L10n value)  $default,){
final _that = this;
switch (_that) {
case _L10n():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _L10n value)?  $default,){
final _that = this;
switch (_that) {
case _L10n() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ar,  String en,  String fr)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _L10n() when $default != null:
return $default(_that.ar,_that.en,_that.fr);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ar,  String en,  String fr)  $default,) {final _that = this;
switch (_that) {
case _L10n():
return $default(_that.ar,_that.en,_that.fr);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ar,  String en,  String fr)?  $default,) {final _that = this;
switch (_that) {
case _L10n() when $default != null:
return $default(_that.ar,_that.en,_that.fr);case _:
  return null;

}
}

}

/// @nodoc


class _L10n extends L10n {
  const _L10n({required this.ar, required this.en, required this.fr}): super._();
  

@override final  String ar;
@override final  String en;
@override final  String fr;

/// Create a copy of L10n
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$L10nCopyWith<_L10n> get copyWith => __$L10nCopyWithImpl<_L10n>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _L10n&&(identical(other.ar, ar) || other.ar == ar)&&(identical(other.en, en) || other.en == en)&&(identical(other.fr, fr) || other.fr == fr));
}


@override
int get hashCode => Object.hash(runtimeType,ar,en,fr);

@override
String toString() {
  return 'L10n(ar: $ar, en: $en, fr: $fr)';
}


}

/// @nodoc
abstract mixin class _$L10nCopyWith<$Res> implements $L10nCopyWith<$Res> {
  factory _$L10nCopyWith(_L10n value, $Res Function(_L10n) _then) = __$L10nCopyWithImpl;
@override @useResult
$Res call({
 String ar, String en, String fr
});




}
/// @nodoc
class __$L10nCopyWithImpl<$Res>
    implements _$L10nCopyWith<$Res> {
  __$L10nCopyWithImpl(this._self, this._then);

  final _L10n _self;
  final $Res Function(_L10n) _then;

/// Create a copy of L10n
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ar = null,Object? en = null,Object? fr = null,}) {
  return _then(_L10n(
ar: null == ar ? _self.ar : ar // ignore: cast_nullable_to_non_nullable
as String,en: null == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as String,fr: null == fr ? _self.fr : fr // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$ManagedQueue {

 int get id; String get mode; String get status; int get effectivePermissions; int get grantPermissions; bool get canOperate; L10n get name; L10n get description;
/// Create a copy of ManagedQueue
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManagedQueueCopyWith<ManagedQueue> get copyWith => _$ManagedQueueCopyWithImpl<ManagedQueue>(this as ManagedQueue, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagedQueue&&(identical(other.id, id) || other.id == id)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.status, status) || other.status == status)&&(identical(other.effectivePermissions, effectivePermissions) || other.effectivePermissions == effectivePermissions)&&(identical(other.grantPermissions, grantPermissions) || other.grantPermissions == grantPermissions)&&(identical(other.canOperate, canOperate) || other.canOperate == canOperate)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,id,mode,status,effectivePermissions,grantPermissions,canOperate,name,description);

@override
String toString() {
  return 'ManagedQueue(id: $id, mode: $mode, status: $status, effectivePermissions: $effectivePermissions, grantPermissions: $grantPermissions, canOperate: $canOperate, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $ManagedQueueCopyWith<$Res>  {
  factory $ManagedQueueCopyWith(ManagedQueue value, $Res Function(ManagedQueue) _then) = _$ManagedQueueCopyWithImpl;
@useResult
$Res call({
 int id, String mode, String status, int effectivePermissions, int grantPermissions, bool canOperate, L10n name, L10n description
});


$L10nCopyWith<$Res> get name;$L10nCopyWith<$Res> get description;

}
/// @nodoc
class _$ManagedQueueCopyWithImpl<$Res>
    implements $ManagedQueueCopyWith<$Res> {
  _$ManagedQueueCopyWithImpl(this._self, this._then);

  final ManagedQueue _self;
  final $Res Function(ManagedQueue) _then;

/// Create a copy of ManagedQueue
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? mode = null,Object? status = null,Object? effectivePermissions = null,Object? grantPermissions = null,Object? canOperate = null,Object? name = null,Object? description = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,effectivePermissions: null == effectivePermissions ? _self.effectivePermissions : effectivePermissions // ignore: cast_nullable_to_non_nullable
as int,grantPermissions: null == grantPermissions ? _self.grantPermissions : grantPermissions // ignore: cast_nullable_to_non_nullable
as int,canOperate: null == canOperate ? _self.canOperate : canOperate // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as L10n,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as L10n,
  ));
}
/// Create a copy of ManagedQueue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$L10nCopyWith<$Res> get name {
  
  return $L10nCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}/// Create a copy of ManagedQueue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$L10nCopyWith<$Res> get description {
  
  return $L10nCopyWith<$Res>(_self.description, (value) {
    return _then(_self.copyWith(description: value));
  });
}
}


/// Adds pattern-matching-related methods to [ManagedQueue].
extension ManagedQueuePatterns on ManagedQueue {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManagedQueue value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManagedQueue() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManagedQueue value)  $default,){
final _that = this;
switch (_that) {
case _ManagedQueue():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManagedQueue value)?  $default,){
final _that = this;
switch (_that) {
case _ManagedQueue() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String mode,  String status,  int effectivePermissions,  int grantPermissions,  bool canOperate,  L10n name,  L10n description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManagedQueue() when $default != null:
return $default(_that.id,_that.mode,_that.status,_that.effectivePermissions,_that.grantPermissions,_that.canOperate,_that.name,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String mode,  String status,  int effectivePermissions,  int grantPermissions,  bool canOperate,  L10n name,  L10n description)  $default,) {final _that = this;
switch (_that) {
case _ManagedQueue():
return $default(_that.id,_that.mode,_that.status,_that.effectivePermissions,_that.grantPermissions,_that.canOperate,_that.name,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String mode,  String status,  int effectivePermissions,  int grantPermissions,  bool canOperate,  L10n name,  L10n description)?  $default,) {final _that = this;
switch (_that) {
case _ManagedQueue() when $default != null:
return $default(_that.id,_that.mode,_that.status,_that.effectivePermissions,_that.grantPermissions,_that.canOperate,_that.name,_that.description);case _:
  return null;

}
}

}

/// @nodoc


class _ManagedQueue implements ManagedQueue {
  const _ManagedQueue({required this.id, required this.mode, required this.status, required this.effectivePermissions, required this.grantPermissions, required this.canOperate, required this.name, required this.description});
  

@override final  int id;
@override final  String mode;
@override final  String status;
@override final  int effectivePermissions;
@override final  int grantPermissions;
@override final  bool canOperate;
@override final  L10n name;
@override final  L10n description;

/// Create a copy of ManagedQueue
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManagedQueueCopyWith<_ManagedQueue> get copyWith => __$ManagedQueueCopyWithImpl<_ManagedQueue>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManagedQueue&&(identical(other.id, id) || other.id == id)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.status, status) || other.status == status)&&(identical(other.effectivePermissions, effectivePermissions) || other.effectivePermissions == effectivePermissions)&&(identical(other.grantPermissions, grantPermissions) || other.grantPermissions == grantPermissions)&&(identical(other.canOperate, canOperate) || other.canOperate == canOperate)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,id,mode,status,effectivePermissions,grantPermissions,canOperate,name,description);

@override
String toString() {
  return 'ManagedQueue(id: $id, mode: $mode, status: $status, effectivePermissions: $effectivePermissions, grantPermissions: $grantPermissions, canOperate: $canOperate, name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ManagedQueueCopyWith<$Res> implements $ManagedQueueCopyWith<$Res> {
  factory _$ManagedQueueCopyWith(_ManagedQueue value, $Res Function(_ManagedQueue) _then) = __$ManagedQueueCopyWithImpl;
@override @useResult
$Res call({
 int id, String mode, String status, int effectivePermissions, int grantPermissions, bool canOperate, L10n name, L10n description
});


@override $L10nCopyWith<$Res> get name;@override $L10nCopyWith<$Res> get description;

}
/// @nodoc
class __$ManagedQueueCopyWithImpl<$Res>
    implements _$ManagedQueueCopyWith<$Res> {
  __$ManagedQueueCopyWithImpl(this._self, this._then);

  final _ManagedQueue _self;
  final $Res Function(_ManagedQueue) _then;

/// Create a copy of ManagedQueue
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? mode = null,Object? status = null,Object? effectivePermissions = null,Object? grantPermissions = null,Object? canOperate = null,Object? name = null,Object? description = null,}) {
  return _then(_ManagedQueue(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,effectivePermissions: null == effectivePermissions ? _self.effectivePermissions : effectivePermissions // ignore: cast_nullable_to_non_nullable
as int,grantPermissions: null == grantPermissions ? _self.grantPermissions : grantPermissions // ignore: cast_nullable_to_non_nullable
as int,canOperate: null == canOperate ? _self.canOperate : canOperate // ignore: cast_nullable_to_non_nullable
as bool,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as L10n,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as L10n,
  ));
}

/// Create a copy of ManagedQueue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$L10nCopyWith<$Res> get name {
  
  return $L10nCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}/// Create a copy of ManagedQueue
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$L10nCopyWith<$Res> get description {
  
  return $L10nCopyWith<$Res>(_self.description, (value) {
    return _then(_self.copyWith(description: value));
  });
}
}

/// @nodoc
mixin _$ManagedOrganization {

 int get id; String get sector; int get subtypeId; double get latitude; double get longitude; OrgRole get role; int get orgPermissions; L10n get name; L10n get address; List<ManagedQueue> get queues;
/// Create a copy of ManagedOrganization
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManagedOrganizationCopyWith<ManagedOrganization> get copyWith => _$ManagedOrganizationCopyWithImpl<ManagedOrganization>(this as ManagedOrganization, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagedOrganization&&(identical(other.id, id) || other.id == id)&&(identical(other.sector, sector) || other.sector == sector)&&(identical(other.subtypeId, subtypeId) || other.subtypeId == subtypeId)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.role, role) || other.role == role)&&(identical(other.orgPermissions, orgPermissions) || other.orgPermissions == orgPermissions)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.queues, queues));
}


@override
int get hashCode => Object.hash(runtimeType,id,sector,subtypeId,latitude,longitude,role,orgPermissions,name,address,const DeepCollectionEquality().hash(queues));

@override
String toString() {
  return 'ManagedOrganization(id: $id, sector: $sector, subtypeId: $subtypeId, latitude: $latitude, longitude: $longitude, role: $role, orgPermissions: $orgPermissions, name: $name, address: $address, queues: $queues)';
}


}

/// @nodoc
abstract mixin class $ManagedOrganizationCopyWith<$Res>  {
  factory $ManagedOrganizationCopyWith(ManagedOrganization value, $Res Function(ManagedOrganization) _then) = _$ManagedOrganizationCopyWithImpl;
@useResult
$Res call({
 int id, String sector, int subtypeId, double latitude, double longitude, OrgRole role, int orgPermissions, L10n name, L10n address, List<ManagedQueue> queues
});


$L10nCopyWith<$Res> get name;$L10nCopyWith<$Res> get address;

}
/// @nodoc
class _$ManagedOrganizationCopyWithImpl<$Res>
    implements $ManagedOrganizationCopyWith<$Res> {
  _$ManagedOrganizationCopyWithImpl(this._self, this._then);

  final ManagedOrganization _self;
  final $Res Function(ManagedOrganization) _then;

/// Create a copy of ManagedOrganization
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sector = null,Object? subtypeId = null,Object? latitude = null,Object? longitude = null,Object? role = null,Object? orgPermissions = null,Object? name = null,Object? address = null,Object? queues = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sector: null == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as String,subtypeId: null == subtypeId ? _self.subtypeId : subtypeId // ignore: cast_nullable_to_non_nullable
as int,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as OrgRole,orgPermissions: null == orgPermissions ? _self.orgPermissions : orgPermissions // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as L10n,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as L10n,queues: null == queues ? _self.queues : queues // ignore: cast_nullable_to_non_nullable
as List<ManagedQueue>,
  ));
}
/// Create a copy of ManagedOrganization
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$L10nCopyWith<$Res> get name {
  
  return $L10nCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}/// Create a copy of ManagedOrganization
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$L10nCopyWith<$Res> get address {
  
  return $L10nCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}


/// Adds pattern-matching-related methods to [ManagedOrganization].
extension ManagedOrganizationPatterns on ManagedOrganization {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManagedOrganization value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManagedOrganization() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManagedOrganization value)  $default,){
final _that = this;
switch (_that) {
case _ManagedOrganization():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManagedOrganization value)?  $default,){
final _that = this;
switch (_that) {
case _ManagedOrganization() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String sector,  int subtypeId,  double latitude,  double longitude,  OrgRole role,  int orgPermissions,  L10n name,  L10n address,  List<ManagedQueue> queues)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManagedOrganization() when $default != null:
return $default(_that.id,_that.sector,_that.subtypeId,_that.latitude,_that.longitude,_that.role,_that.orgPermissions,_that.name,_that.address,_that.queues);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String sector,  int subtypeId,  double latitude,  double longitude,  OrgRole role,  int orgPermissions,  L10n name,  L10n address,  List<ManagedQueue> queues)  $default,) {final _that = this;
switch (_that) {
case _ManagedOrganization():
return $default(_that.id,_that.sector,_that.subtypeId,_that.latitude,_that.longitude,_that.role,_that.orgPermissions,_that.name,_that.address,_that.queues);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String sector,  int subtypeId,  double latitude,  double longitude,  OrgRole role,  int orgPermissions,  L10n name,  L10n address,  List<ManagedQueue> queues)?  $default,) {final _that = this;
switch (_that) {
case _ManagedOrganization() when $default != null:
return $default(_that.id,_that.sector,_that.subtypeId,_that.latitude,_that.longitude,_that.role,_that.orgPermissions,_that.name,_that.address,_that.queues);case _:
  return null;

}
}

}

/// @nodoc


class _ManagedOrganization implements ManagedOrganization {
  const _ManagedOrganization({required this.id, required this.sector, required this.subtypeId, required this.latitude, required this.longitude, required this.role, required this.orgPermissions, required this.name, required this.address, required final  List<ManagedQueue> queues}): _queues = queues;
  

@override final  int id;
@override final  String sector;
@override final  int subtypeId;
@override final  double latitude;
@override final  double longitude;
@override final  OrgRole role;
@override final  int orgPermissions;
@override final  L10n name;
@override final  L10n address;
 final  List<ManagedQueue> _queues;
@override List<ManagedQueue> get queues {
  if (_queues is EqualUnmodifiableListView) return _queues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_queues);
}


/// Create a copy of ManagedOrganization
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManagedOrganizationCopyWith<_ManagedOrganization> get copyWith => __$ManagedOrganizationCopyWithImpl<_ManagedOrganization>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManagedOrganization&&(identical(other.id, id) || other.id == id)&&(identical(other.sector, sector) || other.sector == sector)&&(identical(other.subtypeId, subtypeId) || other.subtypeId == subtypeId)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.role, role) || other.role == role)&&(identical(other.orgPermissions, orgPermissions) || other.orgPermissions == orgPermissions)&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other._queues, _queues));
}


@override
int get hashCode => Object.hash(runtimeType,id,sector,subtypeId,latitude,longitude,role,orgPermissions,name,address,const DeepCollectionEquality().hash(_queues));

@override
String toString() {
  return 'ManagedOrganization(id: $id, sector: $sector, subtypeId: $subtypeId, latitude: $latitude, longitude: $longitude, role: $role, orgPermissions: $orgPermissions, name: $name, address: $address, queues: $queues)';
}


}

/// @nodoc
abstract mixin class _$ManagedOrganizationCopyWith<$Res> implements $ManagedOrganizationCopyWith<$Res> {
  factory _$ManagedOrganizationCopyWith(_ManagedOrganization value, $Res Function(_ManagedOrganization) _then) = __$ManagedOrganizationCopyWithImpl;
@override @useResult
$Res call({
 int id, String sector, int subtypeId, double latitude, double longitude, OrgRole role, int orgPermissions, L10n name, L10n address, List<ManagedQueue> queues
});


@override $L10nCopyWith<$Res> get name;@override $L10nCopyWith<$Res> get address;

}
/// @nodoc
class __$ManagedOrganizationCopyWithImpl<$Res>
    implements _$ManagedOrganizationCopyWith<$Res> {
  __$ManagedOrganizationCopyWithImpl(this._self, this._then);

  final _ManagedOrganization _self;
  final $Res Function(_ManagedOrganization) _then;

/// Create a copy of ManagedOrganization
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sector = null,Object? subtypeId = null,Object? latitude = null,Object? longitude = null,Object? role = null,Object? orgPermissions = null,Object? name = null,Object? address = null,Object? queues = null,}) {
  return _then(_ManagedOrganization(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sector: null == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as String,subtypeId: null == subtypeId ? _self.subtypeId : subtypeId // ignore: cast_nullable_to_non_nullable
as int,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as OrgRole,orgPermissions: null == orgPermissions ? _self.orgPermissions : orgPermissions // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as L10n,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as L10n,queues: null == queues ? _self._queues : queues // ignore: cast_nullable_to_non_nullable
as List<ManagedQueue>,
  ));
}

/// Create a copy of ManagedOrganization
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$L10nCopyWith<$Res> get name {
  
  return $L10nCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}/// Create a copy of ManagedOrganization
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$L10nCopyWith<$Res> get address {
  
  return $L10nCopyWith<$Res>(_self.address, (value) {
    return _then(_self.copyWith(address: value));
  });
}
}

/// @nodoc
mixin _$Workspace {

 String get userId; bool get isPlatformAdmin; List<ManagedOrganization> get organizations;
/// Create a copy of Workspace
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkspaceCopyWith<Workspace> get copyWith => _$WorkspaceCopyWithImpl<Workspace>(this as Workspace, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Workspace&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isPlatformAdmin, isPlatformAdmin) || other.isPlatformAdmin == isPlatformAdmin)&&const DeepCollectionEquality().equals(other.organizations, organizations));
}


@override
int get hashCode => Object.hash(runtimeType,userId,isPlatformAdmin,const DeepCollectionEquality().hash(organizations));

@override
String toString() {
  return 'Workspace(userId: $userId, isPlatformAdmin: $isPlatformAdmin, organizations: $organizations)';
}


}

/// @nodoc
abstract mixin class $WorkspaceCopyWith<$Res>  {
  factory $WorkspaceCopyWith(Workspace value, $Res Function(Workspace) _then) = _$WorkspaceCopyWithImpl;
@useResult
$Res call({
 String userId, bool isPlatformAdmin, List<ManagedOrganization> organizations
});




}
/// @nodoc
class _$WorkspaceCopyWithImpl<$Res>
    implements $WorkspaceCopyWith<$Res> {
  _$WorkspaceCopyWithImpl(this._self, this._then);

  final Workspace _self;
  final $Res Function(Workspace) _then;

/// Create a copy of Workspace
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? isPlatformAdmin = null,Object? organizations = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,isPlatformAdmin: null == isPlatformAdmin ? _self.isPlatformAdmin : isPlatformAdmin // ignore: cast_nullable_to_non_nullable
as bool,organizations: null == organizations ? _self.organizations : organizations // ignore: cast_nullable_to_non_nullable
as List<ManagedOrganization>,
  ));
}

}


/// Adds pattern-matching-related methods to [Workspace].
extension WorkspacePatterns on Workspace {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Workspace value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Workspace() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Workspace value)  $default,){
final _that = this;
switch (_that) {
case _Workspace():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Workspace value)?  $default,){
final _that = this;
switch (_that) {
case _Workspace() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  bool isPlatformAdmin,  List<ManagedOrganization> organizations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Workspace() when $default != null:
return $default(_that.userId,_that.isPlatformAdmin,_that.organizations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  bool isPlatformAdmin,  List<ManagedOrganization> organizations)  $default,) {final _that = this;
switch (_that) {
case _Workspace():
return $default(_that.userId,_that.isPlatformAdmin,_that.organizations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  bool isPlatformAdmin,  List<ManagedOrganization> organizations)?  $default,) {final _that = this;
switch (_that) {
case _Workspace() when $default != null:
return $default(_that.userId,_that.isPlatformAdmin,_that.organizations);case _:
  return null;

}
}

}

/// @nodoc


class _Workspace implements Workspace {
  const _Workspace({required this.userId, required this.isPlatformAdmin, required final  List<ManagedOrganization> organizations}): _organizations = organizations;
  

@override final  String userId;
@override final  bool isPlatformAdmin;
 final  List<ManagedOrganization> _organizations;
@override List<ManagedOrganization> get organizations {
  if (_organizations is EqualUnmodifiableListView) return _organizations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_organizations);
}


/// Create a copy of Workspace
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkspaceCopyWith<_Workspace> get copyWith => __$WorkspaceCopyWithImpl<_Workspace>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Workspace&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isPlatformAdmin, isPlatformAdmin) || other.isPlatformAdmin == isPlatformAdmin)&&const DeepCollectionEquality().equals(other._organizations, _organizations));
}


@override
int get hashCode => Object.hash(runtimeType,userId,isPlatformAdmin,const DeepCollectionEquality().hash(_organizations));

@override
String toString() {
  return 'Workspace(userId: $userId, isPlatformAdmin: $isPlatformAdmin, organizations: $organizations)';
}


}

/// @nodoc
abstract mixin class _$WorkspaceCopyWith<$Res> implements $WorkspaceCopyWith<$Res> {
  factory _$WorkspaceCopyWith(_Workspace value, $Res Function(_Workspace) _then) = __$WorkspaceCopyWithImpl;
@override @useResult
$Res call({
 String userId, bool isPlatformAdmin, List<ManagedOrganization> organizations
});




}
/// @nodoc
class __$WorkspaceCopyWithImpl<$Res>
    implements _$WorkspaceCopyWith<$Res> {
  __$WorkspaceCopyWithImpl(this._self, this._then);

  final _Workspace _self;
  final $Res Function(_Workspace) _then;

/// Create a copy of Workspace
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? isPlatformAdmin = null,Object? organizations = null,}) {
  return _then(_Workspace(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,isPlatformAdmin: null == isPlatformAdmin ? _self.isPlatformAdmin : isPlatformAdmin // ignore: cast_nullable_to_non_nullable
as bool,organizations: null == organizations ? _self._organizations : organizations // ignore: cast_nullable_to_non_nullable
as List<ManagedOrganization>,
  ));
}


}

// dart format on
