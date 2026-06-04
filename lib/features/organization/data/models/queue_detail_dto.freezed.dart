// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'queue_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QueueTranslationItemDto {

 String get name; String? get description;
/// Create a copy of QueueTranslationItemDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueueTranslationItemDtoCopyWith<QueueTranslationItemDto> get copyWith => _$QueueTranslationItemDtoCopyWithImpl<QueueTranslationItemDto>(this as QueueTranslationItemDto, _$identity);

  /// Serializes this QueueTranslationItemDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueueTranslationItemDto&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description);

@override
String toString() {
  return 'QueueTranslationItemDto(name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $QueueTranslationItemDtoCopyWith<$Res>  {
  factory $QueueTranslationItemDtoCopyWith(QueueTranslationItemDto value, $Res Function(QueueTranslationItemDto) _then) = _$QueueTranslationItemDtoCopyWithImpl;
@useResult
$Res call({
 String name, String? description
});




}
/// @nodoc
class _$QueueTranslationItemDtoCopyWithImpl<$Res>
    implements $QueueTranslationItemDtoCopyWith<$Res> {
  _$QueueTranslationItemDtoCopyWithImpl(this._self, this._then);

  final QueueTranslationItemDto _self;
  final $Res Function(QueueTranslationItemDto) _then;

/// Create a copy of QueueTranslationItemDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [QueueTranslationItemDto].
extension QueueTranslationItemDtoPatterns on QueueTranslationItemDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueueTranslationItemDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueueTranslationItemDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueueTranslationItemDto value)  $default,){
final _that = this;
switch (_that) {
case _QueueTranslationItemDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueueTranslationItemDto value)?  $default,){
final _that = this;
switch (_that) {
case _QueueTranslationItemDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueueTranslationItemDto() when $default != null:
return $default(_that.name,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String? description)  $default,) {final _that = this;
switch (_that) {
case _QueueTranslationItemDto():
return $default(_that.name,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _QueueTranslationItemDto() when $default != null:
return $default(_that.name,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QueueTranslationItemDto implements QueueTranslationItemDto {
  const _QueueTranslationItemDto({required this.name, this.description});
  factory _QueueTranslationItemDto.fromJson(Map<String, dynamic> json) => _$QueueTranslationItemDtoFromJson(json);

@override final  String name;
@override final  String? description;

/// Create a copy of QueueTranslationItemDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueueTranslationItemDtoCopyWith<_QueueTranslationItemDto> get copyWith => __$QueueTranslationItemDtoCopyWithImpl<_QueueTranslationItemDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QueueTranslationItemDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueueTranslationItemDto&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,description);

@override
String toString() {
  return 'QueueTranslationItemDto(name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class _$QueueTranslationItemDtoCopyWith<$Res> implements $QueueTranslationItemDtoCopyWith<$Res> {
  factory _$QueueTranslationItemDtoCopyWith(_QueueTranslationItemDto value, $Res Function(_QueueTranslationItemDto) _then) = __$QueueTranslationItemDtoCopyWithImpl;
@override @useResult
$Res call({
 String name, String? description
});




}
/// @nodoc
class __$QueueTranslationItemDtoCopyWithImpl<$Res>
    implements _$QueueTranslationItemDtoCopyWith<$Res> {
  __$QueueTranslationItemDtoCopyWithImpl(this._self, this._then);

  final _QueueTranslationItemDto _self;
  final $Res Function(_QueueTranslationItemDto) _then;

/// Create a copy of QueueTranslationItemDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? description = freezed,}) {
  return _then(_QueueTranslationItemDto(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$QueueDetailDto {

 int get id; int get orgId; String get mode; String get status; String get rules; int? get nextQueueId; QueueTranslationItemDto? get ar; QueueTranslationItemDto? get en; QueueTranslationItemDto? get fr;
/// Create a copy of QueueDetailDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueueDetailDtoCopyWith<QueueDetailDto> get copyWith => _$QueueDetailDtoCopyWithImpl<QueueDetailDto>(this as QueueDetailDto, _$identity);

  /// Serializes this QueueDetailDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueueDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.status, status) || other.status == status)&&(identical(other.rules, rules) || other.rules == rules)&&(identical(other.nextQueueId, nextQueueId) || other.nextQueueId == nextQueueId)&&(identical(other.ar, ar) || other.ar == ar)&&(identical(other.en, en) || other.en == en)&&(identical(other.fr, fr) || other.fr == fr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orgId,mode,status,rules,nextQueueId,ar,en,fr);

@override
String toString() {
  return 'QueueDetailDto(id: $id, orgId: $orgId, mode: $mode, status: $status, rules: $rules, nextQueueId: $nextQueueId, ar: $ar, en: $en, fr: $fr)';
}


}

/// @nodoc
abstract mixin class $QueueDetailDtoCopyWith<$Res>  {
  factory $QueueDetailDtoCopyWith(QueueDetailDto value, $Res Function(QueueDetailDto) _then) = _$QueueDetailDtoCopyWithImpl;
@useResult
$Res call({
 int id, int orgId, String mode, String status, String rules, int? nextQueueId, QueueTranslationItemDto? ar, QueueTranslationItemDto? en, QueueTranslationItemDto? fr
});


$QueueTranslationItemDtoCopyWith<$Res>? get ar;$QueueTranslationItemDtoCopyWith<$Res>? get en;$QueueTranslationItemDtoCopyWith<$Res>? get fr;

}
/// @nodoc
class _$QueueDetailDtoCopyWithImpl<$Res>
    implements $QueueDetailDtoCopyWith<$Res> {
  _$QueueDetailDtoCopyWithImpl(this._self, this._then);

  final QueueDetailDto _self;
  final $Res Function(QueueDetailDto) _then;

/// Create a copy of QueueDetailDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orgId = null,Object? mode = null,Object? status = null,Object? rules = null,Object? nextQueueId = freezed,Object? ar = freezed,Object? en = freezed,Object? fr = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as int,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,rules: null == rules ? _self.rules : rules // ignore: cast_nullable_to_non_nullable
as String,nextQueueId: freezed == nextQueueId ? _self.nextQueueId : nextQueueId // ignore: cast_nullable_to_non_nullable
as int?,ar: freezed == ar ? _self.ar : ar // ignore: cast_nullable_to_non_nullable
as QueueTranslationItemDto?,en: freezed == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as QueueTranslationItemDto?,fr: freezed == fr ? _self.fr : fr // ignore: cast_nullable_to_non_nullable
as QueueTranslationItemDto?,
  ));
}
/// Create a copy of QueueDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QueueTranslationItemDtoCopyWith<$Res>? get ar {
    if (_self.ar == null) {
    return null;
  }

  return $QueueTranslationItemDtoCopyWith<$Res>(_self.ar!, (value) {
    return _then(_self.copyWith(ar: value));
  });
}/// Create a copy of QueueDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QueueTranslationItemDtoCopyWith<$Res>? get en {
    if (_self.en == null) {
    return null;
  }

  return $QueueTranslationItemDtoCopyWith<$Res>(_self.en!, (value) {
    return _then(_self.copyWith(en: value));
  });
}/// Create a copy of QueueDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QueueTranslationItemDtoCopyWith<$Res>? get fr {
    if (_self.fr == null) {
    return null;
  }

  return $QueueTranslationItemDtoCopyWith<$Res>(_self.fr!, (value) {
    return _then(_self.copyWith(fr: value));
  });
}
}


/// Adds pattern-matching-related methods to [QueueDetailDto].
extension QueueDetailDtoPatterns on QueueDetailDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QueueDetailDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QueueDetailDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QueueDetailDto value)  $default,){
final _that = this;
switch (_that) {
case _QueueDetailDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QueueDetailDto value)?  $default,){
final _that = this;
switch (_that) {
case _QueueDetailDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int orgId,  String mode,  String status,  String rules,  int? nextQueueId,  QueueTranslationItemDto? ar,  QueueTranslationItemDto? en,  QueueTranslationItemDto? fr)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QueueDetailDto() when $default != null:
return $default(_that.id,_that.orgId,_that.mode,_that.status,_that.rules,_that.nextQueueId,_that.ar,_that.en,_that.fr);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int orgId,  String mode,  String status,  String rules,  int? nextQueueId,  QueueTranslationItemDto? ar,  QueueTranslationItemDto? en,  QueueTranslationItemDto? fr)  $default,) {final _that = this;
switch (_that) {
case _QueueDetailDto():
return $default(_that.id,_that.orgId,_that.mode,_that.status,_that.rules,_that.nextQueueId,_that.ar,_that.en,_that.fr);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int orgId,  String mode,  String status,  String rules,  int? nextQueueId,  QueueTranslationItemDto? ar,  QueueTranslationItemDto? en,  QueueTranslationItemDto? fr)?  $default,) {final _that = this;
switch (_that) {
case _QueueDetailDto() when $default != null:
return $default(_that.id,_that.orgId,_that.mode,_that.status,_that.rules,_that.nextQueueId,_that.ar,_that.en,_that.fr);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QueueDetailDto extends QueueDetailDto {
  const _QueueDetailDto({required this.id, required this.orgId, required this.mode, required this.status, required this.rules, this.nextQueueId, this.ar, this.en, this.fr}): super._();
  factory _QueueDetailDto.fromJson(Map<String, dynamic> json) => _$QueueDetailDtoFromJson(json);

@override final  int id;
@override final  int orgId;
@override final  String mode;
@override final  String status;
@override final  String rules;
@override final  int? nextQueueId;
@override final  QueueTranslationItemDto? ar;
@override final  QueueTranslationItemDto? en;
@override final  QueueTranslationItemDto? fr;

/// Create a copy of QueueDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QueueDetailDtoCopyWith<_QueueDetailDto> get copyWith => __$QueueDetailDtoCopyWithImpl<_QueueDetailDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QueueDetailDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QueueDetailDto&&(identical(other.id, id) || other.id == id)&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.mode, mode) || other.mode == mode)&&(identical(other.status, status) || other.status == status)&&(identical(other.rules, rules) || other.rules == rules)&&(identical(other.nextQueueId, nextQueueId) || other.nextQueueId == nextQueueId)&&(identical(other.ar, ar) || other.ar == ar)&&(identical(other.en, en) || other.en == en)&&(identical(other.fr, fr) || other.fr == fr));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orgId,mode,status,rules,nextQueueId,ar,en,fr);

@override
String toString() {
  return 'QueueDetailDto(id: $id, orgId: $orgId, mode: $mode, status: $status, rules: $rules, nextQueueId: $nextQueueId, ar: $ar, en: $en, fr: $fr)';
}


}

/// @nodoc
abstract mixin class _$QueueDetailDtoCopyWith<$Res> implements $QueueDetailDtoCopyWith<$Res> {
  factory _$QueueDetailDtoCopyWith(_QueueDetailDto value, $Res Function(_QueueDetailDto) _then) = __$QueueDetailDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, int orgId, String mode, String status, String rules, int? nextQueueId, QueueTranslationItemDto? ar, QueueTranslationItemDto? en, QueueTranslationItemDto? fr
});


@override $QueueTranslationItemDtoCopyWith<$Res>? get ar;@override $QueueTranslationItemDtoCopyWith<$Res>? get en;@override $QueueTranslationItemDtoCopyWith<$Res>? get fr;

}
/// @nodoc
class __$QueueDetailDtoCopyWithImpl<$Res>
    implements _$QueueDetailDtoCopyWith<$Res> {
  __$QueueDetailDtoCopyWithImpl(this._self, this._then);

  final _QueueDetailDto _self;
  final $Res Function(_QueueDetailDto) _then;

/// Create a copy of QueueDetailDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orgId = null,Object? mode = null,Object? status = null,Object? rules = null,Object? nextQueueId = freezed,Object? ar = freezed,Object? en = freezed,Object? fr = freezed,}) {
  return _then(_QueueDetailDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as int,mode: null == mode ? _self.mode : mode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,rules: null == rules ? _self.rules : rules // ignore: cast_nullable_to_non_nullable
as String,nextQueueId: freezed == nextQueueId ? _self.nextQueueId : nextQueueId // ignore: cast_nullable_to_non_nullable
as int?,ar: freezed == ar ? _self.ar : ar // ignore: cast_nullable_to_non_nullable
as QueueTranslationItemDto?,en: freezed == en ? _self.en : en // ignore: cast_nullable_to_non_nullable
as QueueTranslationItemDto?,fr: freezed == fr ? _self.fr : fr // ignore: cast_nullable_to_non_nullable
as QueueTranslationItemDto?,
  ));
}

/// Create a copy of QueueDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QueueTranslationItemDtoCopyWith<$Res>? get ar {
    if (_self.ar == null) {
    return null;
  }

  return $QueueTranslationItemDtoCopyWith<$Res>(_self.ar!, (value) {
    return _then(_self.copyWith(ar: value));
  });
}/// Create a copy of QueueDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QueueTranslationItemDtoCopyWith<$Res>? get en {
    if (_self.en == null) {
    return null;
  }

  return $QueueTranslationItemDtoCopyWith<$Res>(_self.en!, (value) {
    return _then(_self.copyWith(en: value));
  });
}/// Create a copy of QueueDetailDto
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QueueTranslationItemDtoCopyWith<$Res>? get fr {
    if (_self.fr == null) {
    return null;
  }

  return $QueueTranslationItemDtoCopyWith<$Res>(_self.fr!, (value) {
    return _then(_self.copyWith(fr: value));
  });
}
}

// dart format on
