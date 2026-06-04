// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workspace_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkspaceDto {

 String get userId; bool get isPlatformAdmin; List<ManagedOrganizationDto> get organizations;
/// Create a copy of WorkspaceDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkspaceDtoCopyWith<WorkspaceDto> get copyWith => _$WorkspaceDtoCopyWithImpl<WorkspaceDto>(this as WorkspaceDto, _$identity);

  /// Serializes this WorkspaceDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkspaceDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isPlatformAdmin, isPlatformAdmin) || other.isPlatformAdmin == isPlatformAdmin)&&const DeepCollectionEquality().equals(other.organizations, organizations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,isPlatformAdmin,const DeepCollectionEquality().hash(organizations));

@override
String toString() {
  return 'WorkspaceDto(userId: $userId, isPlatformAdmin: $isPlatformAdmin, organizations: $organizations)';
}


}

/// @nodoc
abstract mixin class $WorkspaceDtoCopyWith<$Res>  {
  factory $WorkspaceDtoCopyWith(WorkspaceDto value, $Res Function(WorkspaceDto) _then) = _$WorkspaceDtoCopyWithImpl;
@useResult
$Res call({
 String userId, bool isPlatformAdmin, List<ManagedOrganizationDto> organizations
});




}
/// @nodoc
class _$WorkspaceDtoCopyWithImpl<$Res>
    implements $WorkspaceDtoCopyWith<$Res> {
  _$WorkspaceDtoCopyWithImpl(this._self, this._then);

  final WorkspaceDto _self;
  final $Res Function(WorkspaceDto) _then;

/// Create a copy of WorkspaceDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? isPlatformAdmin = null,Object? organizations = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,isPlatformAdmin: null == isPlatformAdmin ? _self.isPlatformAdmin : isPlatformAdmin // ignore: cast_nullable_to_non_nullable
as bool,organizations: null == organizations ? _self.organizations : organizations // ignore: cast_nullable_to_non_nullable
as List<ManagedOrganizationDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkspaceDto].
extension WorkspaceDtoPatterns on WorkspaceDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkspaceDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkspaceDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkspaceDto value)  $default,){
final _that = this;
switch (_that) {
case _WorkspaceDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkspaceDto value)?  $default,){
final _that = this;
switch (_that) {
case _WorkspaceDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  bool isPlatformAdmin,  List<ManagedOrganizationDto> organizations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkspaceDto() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  bool isPlatformAdmin,  List<ManagedOrganizationDto> organizations)  $default,) {final _that = this;
switch (_that) {
case _WorkspaceDto():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  bool isPlatformAdmin,  List<ManagedOrganizationDto> organizations)?  $default,) {final _that = this;
switch (_that) {
case _WorkspaceDto() when $default != null:
return $default(_that.userId,_that.isPlatformAdmin,_that.organizations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkspaceDto extends WorkspaceDto {
  const _WorkspaceDto({required this.userId, required this.isPlatformAdmin, required final  List<ManagedOrganizationDto> organizations}): _organizations = organizations,super._();
  factory _WorkspaceDto.fromJson(Map<String, dynamic> json) => _$WorkspaceDtoFromJson(json);

@override final  String userId;
@override final  bool isPlatformAdmin;
 final  List<ManagedOrganizationDto> _organizations;
@override List<ManagedOrganizationDto> get organizations {
  if (_organizations is EqualUnmodifiableListView) return _organizations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_organizations);
}


/// Create a copy of WorkspaceDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkspaceDtoCopyWith<_WorkspaceDto> get copyWith => __$WorkspaceDtoCopyWithImpl<_WorkspaceDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkspaceDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkspaceDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.isPlatformAdmin, isPlatformAdmin) || other.isPlatformAdmin == isPlatformAdmin)&&const DeepCollectionEquality().equals(other._organizations, _organizations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,isPlatformAdmin,const DeepCollectionEquality().hash(_organizations));

@override
String toString() {
  return 'WorkspaceDto(userId: $userId, isPlatformAdmin: $isPlatformAdmin, organizations: $organizations)';
}


}

/// @nodoc
abstract mixin class _$WorkspaceDtoCopyWith<$Res> implements $WorkspaceDtoCopyWith<$Res> {
  factory _$WorkspaceDtoCopyWith(_WorkspaceDto value, $Res Function(_WorkspaceDto) _then) = __$WorkspaceDtoCopyWithImpl;
@override @useResult
$Res call({
 String userId, bool isPlatformAdmin, List<ManagedOrganizationDto> organizations
});




}
/// @nodoc
class __$WorkspaceDtoCopyWithImpl<$Res>
    implements _$WorkspaceDtoCopyWith<$Res> {
  __$WorkspaceDtoCopyWithImpl(this._self, this._then);

  final _WorkspaceDto _self;
  final $Res Function(_WorkspaceDto) _then;

/// Create a copy of WorkspaceDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? isPlatformAdmin = null,Object? organizations = null,}) {
  return _then(_WorkspaceDto(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,isPlatformAdmin: null == isPlatformAdmin ? _self.isPlatformAdmin : isPlatformAdmin // ignore: cast_nullable_to_non_nullable
as bool,organizations: null == organizations ? _self._organizations : organizations // ignore: cast_nullable_to_non_nullable
as List<ManagedOrganizationDto>,
  ));
}


}


/// @nodoc
mixin _$ManagedOrganizationDto {

 int get id; String get sector; int? get subtypeId; double get latitude; double get longitude; String get role; int get orgPermissions; LocalizedFieldsDto get ar; LocalizedFieldsDto get en; LocalizedFieldsDto get fr; List<ManagedQueueDto> get queues;
/// Create a copy of ManagedOrganizationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManagedOrganizationDtoCopyWith<ManagedOrganizationDto> get copyWith => _$ManagedOrganizationDtoCopyWithImpl<ManagedOrganizationDto>(this as ManagedOrganizationDto, _$identity);

  /// Serializes this ManagedOrganizationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagedOrganizationDto&&(identical(other.id, id) || other.id == id)&&(identical(other.sector, sector) || other.sector == sector)&&(identical(other.subtypeId, subtypeId) || other.subtypeId == subtypeId)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.role, role) || other.role == role)&&(identical(other.orgPermissions, orgPermissions) || other.orgPermissions == orgPermissions)&&(identical(other.ar, ar) || other.ar == ar)&&(identical(other.en, en) || other.en == en)&&(identical(other.fr, fr) || other.fr == fr)&&const DeepCollectionEquality().equals(other.queues, queues));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sector,subtypeId,latitude,longitude,role,orgPermissions,ar,en,fr,const DeepCollectionEquality().hash(queues));

@override
String toString() {
  return 'ManagedOrganizationDto(id: $id, sector: $sector, subtypeId: $subtypeId, latitude: $latitude, longitude: $longitude, role: $role, orgPermissions: $orgPermissions, ar: $ar, en: $en, fr: $fr, queues: $queues)';
}


}

/// @nodoc
abstract mixin class $ManagedOrganizationDtoCopyWith<$Res>  {
  factory $ManagedOrganizationDtoCopyWith(ManagedOrganizationDto value, $Res Function(ManagedOrganizationDto) _then) = _$ManagedOrganizationDtoCopyWithImpl;
@useResult
$Res call({
 int id, String sector, int? subtypeId, double latitude, double longitude, String role, int orgPermissions, LocalizedFieldsDto ar, LocalizedFieldsDto en, LocalizedFieldsDto fr, List<ManagedQueueDto> queues
});


$LocalizedFieldsDtoCopyWith<$Res> get ar;$LocalizedFieldsDtoCopyWith<$Res> get en;$LocalizedFieldsDtoCopyWith<$Res> get fr;

}
/// @nodoc
class _$ManagedOrganizationDtoCopyWithImpl<$Res>
    implements $ManagedOrganizationDtoCopyWith<$Res> {
  _$ManagedOrganizationDtoCopyWithImpl(this._self, this._then);

  final ManagedOrganizationDto _self;
  final $Res Function(ManagedOrganizationDto) _then;

/// Create a copy of ManagedOrganizationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sector = null,Object? subtypeId = freezed,Object? latitude = null,Object? longitude = null,Object? role = null,Object? orgPermissions = null,Object? ar = null,Object? en = null,Object? fr = null,Object? queues = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sector: null == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as String,subtypeId: freezed == subtypeId ? _self.subtypeId : subtypeId // ignore: cast_nullable_to_non_nullable
as int?,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,orgPermissions: null == orgPermissions ? _self.orgPermissions : orgPermissions // ignore: cast_nullable_to_non_nullable
as int,ar: null == ar ? _self.ar : ar // ignore: cast_nullable_to_non_nullable
as LocalizedFieldsDto,en: null == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as LocalizedFieldsDto,fr: null == fr ? _self.fr : fr // ignore: cast_nullable_to_non_nullable
as LocalizedFieldsDto,queues: null == queues ? _self.queues : queues // ignore: cast_nullable_to_non_nullable
as List<ManagedQueueDto>,
  ));
}
/// Create a copy of ManagedOrganizationDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedFieldsDtoCopyWith<$Res> get ar {
  
  return $LocalizedFieldsDtoCopyWith<$Res>(_self.ar, (value) {
    return _then(_self.copyWith(ar: value));
  });
}/// Create a copy of ManagedOrganizationDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedFieldsDtoCopyWith<$Res> get en {
  
  return $LocalizedFieldsDtoCopyWith<$Res>(_self.en, (value) {
    return _then(_self.copyWith(en: value));
  });
}/// Create a copy of ManagedOrganizationDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedFieldsDtoCopyWith<$Res> get fr {
  
  return $LocalizedFieldsDtoCopyWith<$Res>(_self.fr, (value) {
    return _then(_self.copyWith(fr: value));
  });
}
}


/// Adds pattern-matching-related methods to [ManagedOrganizationDto].
extension ManagedOrganizationDtoPatterns on ManagedOrganizationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManagedOrganizationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManagedOrganizationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManagedOrganizationDto value)  $default,){
final _that = this;
switch (_that) {
case _ManagedOrganizationDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManagedOrganizationDto value)?  $default,){
final _that = this;
switch (_that) {
case _ManagedOrganizationDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String sector,  int? subtypeId,  double latitude,  double longitude,  String role,  int orgPermissions,  LocalizedFieldsDto ar,  LocalizedFieldsDto en,  LocalizedFieldsDto fr,  List<ManagedQueueDto> queues)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManagedOrganizationDto() when $default != null:
return $default(_that.id,_that.sector,_that.subtypeId,_that.latitude,_that.longitude,_that.role,_that.orgPermissions,_that.ar,_that.en,_that.fr,_that.queues);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String sector,  int? subtypeId,  double latitude,  double longitude,  String role,  int orgPermissions,  LocalizedFieldsDto ar,  LocalizedFieldsDto en,  LocalizedFieldsDto fr,  List<ManagedQueueDto> queues)  $default,) {final _that = this;
switch (_that) {
case _ManagedOrganizationDto():
return $default(_that.id,_that.sector,_that.subtypeId,_that.latitude,_that.longitude,_that.role,_that.orgPermissions,_that.ar,_that.en,_that.fr,_that.queues);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String sector,  int? subtypeId,  double latitude,  double longitude,  String role,  int orgPermissions,  LocalizedFieldsDto ar,  LocalizedFieldsDto en,  LocalizedFieldsDto fr,  List<ManagedQueueDto> queues)?  $default,) {final _that = this;
switch (_that) {
case _ManagedOrganizationDto() when $default != null:
return $default(_that.id,_that.sector,_that.subtypeId,_that.latitude,_that.longitude,_that.role,_that.orgPermissions,_that.ar,_that.en,_that.fr,_that.queues);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManagedOrganizationDto extends ManagedOrganizationDto {
  const _ManagedOrganizationDto({required this.id, required this.sector, this.subtypeId, required this.latitude, required this.longitude, required this.role, required this.orgPermissions, required this.ar, required this.en, required this.fr, required final  List<ManagedQueueDto> queues}): _queues = queues,super._();
  factory _ManagedOrganizationDto.fromJson(Map<String, dynamic> json) => _$ManagedOrganizationDtoFromJson(json);

@override final  int id;
@override final  String sector;
@override final  int? subtypeId;
@override final  double latitude;
@override final  double longitude;
@override final  String role;
@override final  int orgPermissions;
@override final  LocalizedFieldsDto ar;
@override final  LocalizedFieldsDto en;
@override final  LocalizedFieldsDto fr;
 final  List<ManagedQueueDto> _queues;
@override List<ManagedQueueDto> get queues {
  if (_queues is EqualUnmodifiableListView) return _queues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_queues);
}


/// Create a copy of ManagedOrganizationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManagedOrganizationDtoCopyWith<_ManagedOrganizationDto> get copyWith => __$ManagedOrganizationDtoCopyWithImpl<_ManagedOrganizationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManagedOrganizationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManagedOrganizationDto&&(identical(other.id, id) || other.id == id)&&(identical(other.sector, sector) || other.sector == sector)&&(identical(other.subtypeId, subtypeId) || other.subtypeId == subtypeId)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.role, role) || other.role == role)&&(identical(other.orgPermissions, orgPermissions) || other.orgPermissions == orgPermissions)&&(identical(other.ar, ar) || other.ar == ar)&&(identical(other.en, en) || other.en == en)&&(identical(other.fr, fr) || other.fr == fr)&&const DeepCollectionEquality().equals(other._queues, _queues));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sector,subtypeId,latitude,longitude,role,orgPermissions,ar,en,fr,const DeepCollectionEquality().hash(_queues));

@override
String toString() {
  return 'ManagedOrganizationDto(id: $id, sector: $sector, subtypeId: $subtypeId, latitude: $latitude, longitude: $longitude, role: $role, orgPermissions: $orgPermissions, ar: $ar, en: $en, fr: $fr, queues: $queues)';
}


}

/// @nodoc
abstract mixin class _$ManagedOrganizationDtoCopyWith<$Res> implements $ManagedOrganizationDtoCopyWith<$Res> {
  factory _$ManagedOrganizationDtoCopyWith(_ManagedOrganizationDto value, $Res Function(_ManagedOrganizationDto) _then) = __$ManagedOrganizationDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String sector, int? subtypeId, double latitude, double longitude, String role, int orgPermissions, LocalizedFieldsDto ar, LocalizedFieldsDto en, LocalizedFieldsDto fr, List<ManagedQueueDto> queues
});


@override $LocalizedFieldsDtoCopyWith<$Res> get ar;@override $LocalizedFieldsDtoCopyWith<$Res> get en;@override $LocalizedFieldsDtoCopyWith<$Res> get fr;

}
/// @nodoc
class __$ManagedOrganizationDtoCopyWithImpl<$Res>
    implements _$ManagedOrganizationDtoCopyWith<$Res> {
  __$ManagedOrganizationDtoCopyWithImpl(this._self, this._then);

  final _ManagedOrganizationDto _self;
  final $Res Function(_ManagedOrganizationDto) _then;

/// Create a copy of ManagedOrganizationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sector = null,Object? subtypeId = freezed,Object? latitude = null,Object? longitude = null,Object? role = null,Object? orgPermissions = null,Object? ar = null,Object? en = null,Object? fr = null,Object? queues = null,}) {
  return _then(_ManagedOrganizationDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sector: null == sector ? _self.sector : sector // ignore: cast_nullable_to_non_nullable
as String,subtypeId: freezed == subtypeId ? _self.subtypeId : subtypeId // ignore: cast_nullable_to_non_nullable
as int?,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,orgPermissions: null == orgPermissions ? _self.orgPermissions : orgPermissions // ignore: cast_nullable_to_non_nullable
as int,ar: null == ar ? _self.ar : ar // ignore: cast_nullable_to_non_nullable
as LocalizedFieldsDto,en: null == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as LocalizedFieldsDto,fr: null == fr ? _self.fr : fr // ignore: cast_nullable_to_non_nullable
as LocalizedFieldsDto,queues: null == queues ? _self._queues : queues // ignore: cast_nullable_to_non_nullable
as List<ManagedQueueDto>,
  ));
}

/// Create a copy of ManagedOrganizationDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedFieldsDtoCopyWith<$Res> get ar {
  
  return $LocalizedFieldsDtoCopyWith<$Res>(_self.ar, (value) {
    return _then(_self.copyWith(ar: value));
  });
}/// Create a copy of ManagedOrganizationDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedFieldsDtoCopyWith<$Res> get en {
  
  return $LocalizedFieldsDtoCopyWith<$Res>(_self.en, (value) {
    return _then(_self.copyWith(en: value));
  });
}/// Create a copy of ManagedOrganizationDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedFieldsDtoCopyWith<$Res> get fr {
  
  return $LocalizedFieldsDtoCopyWith<$Res>(_self.fr, (value) {
    return _then(_self.copyWith(fr: value));
  });
}
}


/// @nodoc
mixin _$ManagedQueueDto {

 int get id; String get mode; String get status; int get effectivePermissions; int get grantPermissions; bool get canOperate; LocalizedFieldsDto get ar; LocalizedFieldsDto get en; LocalizedFieldsDto get fr;
/// Create a copy of ManagedQueueDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManagedQueueDtoCopyWith<ManagedQueueDto> get copyWith => _$ManagedQueueDtoCopyWithImpl<ManagedQueueDto>(this as ManagedQueueDto, _$identity);

  /// Serializes this ManagedQueueDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagedQueueDto&&(identical(other.id, id) || other.id == id)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.status, status) || other.status == status)&&(identical(other.effectivePermissions, effectivePermissions) || other.effectivePermissions == effectivePermissions)&&(identical(other.grantPermissions, grantPermissions) || other.grantPermissions == grantPermissions)&&(identical(other.canOperate, canOperate) || other.canOperate == canOperate)&&(identical(other.ar, ar) || other.ar == ar)&&(identical(other.en, en) || other.en == en)&&(identical(other.fr, fr) || other.fr == fr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mode,status,effectivePermissions,grantPermissions,canOperate,ar,en,fr);

@override
String toString() {
  return 'ManagedQueueDto(id: $id, mode: $mode, status: $status, effectivePermissions: $effectivePermissions, grantPermissions: $grantPermissions, canOperate: $canOperate, ar: $ar, en: $en, fr: $fr)';
}


}

/// @nodoc
abstract mixin class $ManagedQueueDtoCopyWith<$Res>  {
  factory $ManagedQueueDtoCopyWith(ManagedQueueDto value, $Res Function(ManagedQueueDto) _then) = _$ManagedQueueDtoCopyWithImpl;
@useResult
$Res call({
 int id, String mode, String status, int effectivePermissions, int grantPermissions, bool canOperate, LocalizedFieldsDto ar, LocalizedFieldsDto en, LocalizedFieldsDto fr
});


$LocalizedFieldsDtoCopyWith<$Res> get ar;$LocalizedFieldsDtoCopyWith<$Res> get en;$LocalizedFieldsDtoCopyWith<$Res> get fr;

}
/// @nodoc
class _$ManagedQueueDtoCopyWithImpl<$Res>
    implements $ManagedQueueDtoCopyWith<$Res> {
  _$ManagedQueueDtoCopyWithImpl(this._self, this._then);

  final ManagedQueueDto _self;
  final $Res Function(ManagedQueueDto) _then;

/// Create a copy of ManagedQueueDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? mode = null,Object? status = null,Object? effectivePermissions = null,Object? grantPermissions = null,Object? canOperate = null,Object? ar = null,Object? en = null,Object? fr = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,effectivePermissions: null == effectivePermissions ? _self.effectivePermissions : effectivePermissions // ignore: cast_nullable_to_non_nullable
as int,grantPermissions: null == grantPermissions ? _self.grantPermissions : grantPermissions // ignore: cast_nullable_to_non_nullable
as int,canOperate: null == canOperate ? _self.canOperate : canOperate // ignore: cast_nullable_to_non_nullable
as bool,ar: null == ar ? _self.ar : ar // ignore: cast_nullable_to_non_nullable
as LocalizedFieldsDto,en: null == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as LocalizedFieldsDto,fr: null == fr ? _self.fr : fr // ignore: cast_nullable_to_non_nullable
as LocalizedFieldsDto,
  ));
}
/// Create a copy of ManagedQueueDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedFieldsDtoCopyWith<$Res> get ar {
  
  return $LocalizedFieldsDtoCopyWith<$Res>(_self.ar, (value) {
    return _then(_self.copyWith(ar: value));
  });
}/// Create a copy of ManagedQueueDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedFieldsDtoCopyWith<$Res> get en {
  
  return $LocalizedFieldsDtoCopyWith<$Res>(_self.en, (value) {
    return _then(_self.copyWith(en: value));
  });
}/// Create a copy of ManagedQueueDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedFieldsDtoCopyWith<$Res> get fr {
  
  return $LocalizedFieldsDtoCopyWith<$Res>(_self.fr, (value) {
    return _then(_self.copyWith(fr: value));
  });
}
}


/// Adds pattern-matching-related methods to [ManagedQueueDto].
extension ManagedQueueDtoPatterns on ManagedQueueDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManagedQueueDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManagedQueueDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManagedQueueDto value)  $default,){
final _that = this;
switch (_that) {
case _ManagedQueueDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManagedQueueDto value)?  $default,){
final _that = this;
switch (_that) {
case _ManagedQueueDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String mode,  String status,  int effectivePermissions,  int grantPermissions,  bool canOperate,  LocalizedFieldsDto ar,  LocalizedFieldsDto en,  LocalizedFieldsDto fr)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManagedQueueDto() when $default != null:
return $default(_that.id,_that.mode,_that.status,_that.effectivePermissions,_that.grantPermissions,_that.canOperate,_that.ar,_that.en,_that.fr);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String mode,  String status,  int effectivePermissions,  int grantPermissions,  bool canOperate,  LocalizedFieldsDto ar,  LocalizedFieldsDto en,  LocalizedFieldsDto fr)  $default,) {final _that = this;
switch (_that) {
case _ManagedQueueDto():
return $default(_that.id,_that.mode,_that.status,_that.effectivePermissions,_that.grantPermissions,_that.canOperate,_that.ar,_that.en,_that.fr);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String mode,  String status,  int effectivePermissions,  int grantPermissions,  bool canOperate,  LocalizedFieldsDto ar,  LocalizedFieldsDto en,  LocalizedFieldsDto fr)?  $default,) {final _that = this;
switch (_that) {
case _ManagedQueueDto() when $default != null:
return $default(_that.id,_that.mode,_that.status,_that.effectivePermissions,_that.grantPermissions,_that.canOperate,_that.ar,_that.en,_that.fr);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManagedQueueDto extends ManagedQueueDto {
  const _ManagedQueueDto({required this.id, required this.mode, required this.status, required this.effectivePermissions, required this.grantPermissions, required this.canOperate, required this.ar, required this.en, required this.fr}): super._();
  factory _ManagedQueueDto.fromJson(Map<String, dynamic> json) => _$ManagedQueueDtoFromJson(json);

@override final  int id;
@override final  String mode;
@override final  String status;
@override final  int effectivePermissions;
@override final  int grantPermissions;
@override final  bool canOperate;
@override final  LocalizedFieldsDto ar;
@override final  LocalizedFieldsDto en;
@override final  LocalizedFieldsDto fr;

/// Create a copy of ManagedQueueDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManagedQueueDtoCopyWith<_ManagedQueueDto> get copyWith => __$ManagedQueueDtoCopyWithImpl<_ManagedQueueDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManagedQueueDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManagedQueueDto&&(identical(other.id, id) || other.id == id)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.status, status) || other.status == status)&&(identical(other.effectivePermissions, effectivePermissions) || other.effectivePermissions == effectivePermissions)&&(identical(other.grantPermissions, grantPermissions) || other.grantPermissions == grantPermissions)&&(identical(other.canOperate, canOperate) || other.canOperate == canOperate)&&(identical(other.ar, ar) || other.ar == ar)&&(identical(other.en, en) || other.en == en)&&(identical(other.fr, fr) || other.fr == fr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mode,status,effectivePermissions,grantPermissions,canOperate,ar,en,fr);

@override
String toString() {
  return 'ManagedQueueDto(id: $id, mode: $mode, status: $status, effectivePermissions: $effectivePermissions, grantPermissions: $grantPermissions, canOperate: $canOperate, ar: $ar, en: $en, fr: $fr)';
}


}

/// @nodoc
abstract mixin class _$ManagedQueueDtoCopyWith<$Res> implements $ManagedQueueDtoCopyWith<$Res> {
  factory _$ManagedQueueDtoCopyWith(_ManagedQueueDto value, $Res Function(_ManagedQueueDto) _then) = __$ManagedQueueDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String mode, String status, int effectivePermissions, int grantPermissions, bool canOperate, LocalizedFieldsDto ar, LocalizedFieldsDto en, LocalizedFieldsDto fr
});


@override $LocalizedFieldsDtoCopyWith<$Res> get ar;@override $LocalizedFieldsDtoCopyWith<$Res> get en;@override $LocalizedFieldsDtoCopyWith<$Res> get fr;

}
/// @nodoc
class __$ManagedQueueDtoCopyWithImpl<$Res>
    implements _$ManagedQueueDtoCopyWith<$Res> {
  __$ManagedQueueDtoCopyWithImpl(this._self, this._then);

  final _ManagedQueueDto _self;
  final $Res Function(_ManagedQueueDto) _then;

/// Create a copy of ManagedQueueDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? mode = null,Object? status = null,Object? effectivePermissions = null,Object? grantPermissions = null,Object? canOperate = null,Object? ar = null,Object? en = null,Object? fr = null,}) {
  return _then(_ManagedQueueDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,effectivePermissions: null == effectivePermissions ? _self.effectivePermissions : effectivePermissions // ignore: cast_nullable_to_non_nullable
as int,grantPermissions: null == grantPermissions ? _self.grantPermissions : grantPermissions // ignore: cast_nullable_to_non_nullable
as int,canOperate: null == canOperate ? _self.canOperate : canOperate // ignore: cast_nullable_to_non_nullable
as bool,ar: null == ar ? _self.ar : ar // ignore: cast_nullable_to_non_nullable
as LocalizedFieldsDto,en: null == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as LocalizedFieldsDto,fr: null == fr ? _self.fr : fr // ignore: cast_nullable_to_non_nullable
as LocalizedFieldsDto,
  ));
}

/// Create a copy of ManagedQueueDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedFieldsDtoCopyWith<$Res> get ar {
  
  return $LocalizedFieldsDtoCopyWith<$Res>(_self.ar, (value) {
    return _then(_self.copyWith(ar: value));
  });
}/// Create a copy of ManagedQueueDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedFieldsDtoCopyWith<$Res> get en {
  
  return $LocalizedFieldsDtoCopyWith<$Res>(_self.en, (value) {
    return _then(_self.copyWith(en: value));
  });
}/// Create a copy of ManagedQueueDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedFieldsDtoCopyWith<$Res> get fr {
  
  return $LocalizedFieldsDtoCopyWith<$Res>(_self.fr, (value) {
    return _then(_self.copyWith(fr: value));
  });
}
}


/// @nodoc
mixin _$LocalizedFieldsDto {

 String get name; String? get address; String? get description;
/// Create a copy of LocalizedFieldsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocalizedFieldsDtoCopyWith<LocalizedFieldsDto> get copyWith => _$LocalizedFieldsDtoCopyWithImpl<LocalizedFieldsDto>(this as LocalizedFieldsDto, _$identity);

  /// Serializes this LocalizedFieldsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocalizedFieldsDto&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,address,description);

@override
String toString() {
  return 'LocalizedFieldsDto(name: $name, address: $address, description: $description)';
}


}

/// @nodoc
abstract mixin class $LocalizedFieldsDtoCopyWith<$Res>  {
  factory $LocalizedFieldsDtoCopyWith(LocalizedFieldsDto value, $Res Function(LocalizedFieldsDto) _then) = _$LocalizedFieldsDtoCopyWithImpl;
@useResult
$Res call({
 String name, String? address, String? description
});




}
/// @nodoc
class _$LocalizedFieldsDtoCopyWithImpl<$Res>
    implements $LocalizedFieldsDtoCopyWith<$Res> {
  _$LocalizedFieldsDtoCopyWithImpl(this._self, this._then);

  final LocalizedFieldsDto _self;
  final $Res Function(LocalizedFieldsDto) _then;

/// Create a copy of LocalizedFieldsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? address = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [LocalizedFieldsDto].
extension LocalizedFieldsDtoPatterns on LocalizedFieldsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LocalizedFieldsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LocalizedFieldsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LocalizedFieldsDto value)  $default,){
final _that = this;
switch (_that) {
case _LocalizedFieldsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LocalizedFieldsDto value)?  $default,){
final _that = this;
switch (_that) {
case _LocalizedFieldsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? address,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LocalizedFieldsDto() when $default != null:
return $default(_that.name,_that.address,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? address,  String? description)  $default,) {final _that = this;
switch (_that) {
case _LocalizedFieldsDto():
return $default(_that.name,_that.address,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? address,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _LocalizedFieldsDto() when $default != null:
return $default(_that.name,_that.address,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LocalizedFieldsDto implements LocalizedFieldsDto {
  const _LocalizedFieldsDto({required this.name, this.address, this.description});
  factory _LocalizedFieldsDto.fromJson(Map<String, dynamic> json) => _$LocalizedFieldsDtoFromJson(json);

@override final  String name;
@override final  String? address;
@override final  String? description;

/// Create a copy of LocalizedFieldsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocalizedFieldsDtoCopyWith<_LocalizedFieldsDto> get copyWith => __$LocalizedFieldsDtoCopyWithImpl<_LocalizedFieldsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LocalizedFieldsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocalizedFieldsDto&&(identical(other.name, name) || other.name == name)&&(identical(other.address, address) || other.address == address)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,address,description);

@override
String toString() {
  return 'LocalizedFieldsDto(name: $name, address: $address, description: $description)';
}


}

/// @nodoc
abstract mixin class _$LocalizedFieldsDtoCopyWith<$Res> implements $LocalizedFieldsDtoCopyWith<$Res> {
  factory _$LocalizedFieldsDtoCopyWith(_LocalizedFieldsDto value, $Res Function(_LocalizedFieldsDto) _then) = __$LocalizedFieldsDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String? address, String? description
});




}
/// @nodoc
class __$LocalizedFieldsDtoCopyWithImpl<$Res>
    implements _$LocalizedFieldsDtoCopyWith<$Res> {
  __$LocalizedFieldsDtoCopyWithImpl(this._self, this._then);

  final _LocalizedFieldsDto _self;
  final $Res Function(_LocalizedFieldsDto) _then;

/// Create a copy of LocalizedFieldsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? address = freezed,Object? description = freezed,}) {
  return _then(_LocalizedFieldsDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
