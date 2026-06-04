// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SpecialtyTranslationDto {

 String get lang; String get name;
/// Create a copy of SpecialtyTranslationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpecialtyTranslationDtoCopyWith<SpecialtyTranslationDto> get copyWith => _$SpecialtyTranslationDtoCopyWithImpl<SpecialtyTranslationDto>(this as SpecialtyTranslationDto, _$identity);

  /// Serializes this SpecialtyTranslationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpecialtyTranslationDto&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lang,name);

@override
String toString() {
  return 'SpecialtyTranslationDto(lang: $lang, name: $name)';
}


}

/// @nodoc
abstract mixin class $SpecialtyTranslationDtoCopyWith<$Res>  {
  factory $SpecialtyTranslationDtoCopyWith(SpecialtyTranslationDto value, $Res Function(SpecialtyTranslationDto) _then) = _$SpecialtyTranslationDtoCopyWithImpl;
@useResult
$Res call({
 String lang, String name
});




}
/// @nodoc
class _$SpecialtyTranslationDtoCopyWithImpl<$Res>
    implements $SpecialtyTranslationDtoCopyWith<$Res> {
  _$SpecialtyTranslationDtoCopyWithImpl(this._self, this._then);

  final SpecialtyTranslationDto _self;
  final $Res Function(SpecialtyTranslationDto) _then;

/// Create a copy of SpecialtyTranslationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lang = null,Object? name = null,}) {
  return _then(_self.copyWith(
lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SpecialtyTranslationDto].
extension SpecialtyTranslationDtoPatterns on SpecialtyTranslationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpecialtyTranslationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpecialtyTranslationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpecialtyTranslationDto value)  $default,){
final _that = this;
switch (_that) {
case _SpecialtyTranslationDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpecialtyTranslationDto value)?  $default,){
final _that = this;
switch (_that) {
case _SpecialtyTranslationDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String lang,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpecialtyTranslationDto() when $default != null:
return $default(_that.lang,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String lang,  String name)  $default,) {final _that = this;
switch (_that) {
case _SpecialtyTranslationDto():
return $default(_that.lang,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String lang,  String name)?  $default,) {final _that = this;
switch (_that) {
case _SpecialtyTranslationDto() when $default != null:
return $default(_that.lang,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpecialtyTranslationDto implements SpecialtyTranslationDto {
  const _SpecialtyTranslationDto({required this.lang, required this.name});
  factory _SpecialtyTranslationDto.fromJson(Map<String, dynamic> json) => _$SpecialtyTranslationDtoFromJson(json);

@override final  String lang;
@override final  String name;

/// Create a copy of SpecialtyTranslationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpecialtyTranslationDtoCopyWith<_SpecialtyTranslationDto> get copyWith => __$SpecialtyTranslationDtoCopyWithImpl<_SpecialtyTranslationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpecialtyTranslationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpecialtyTranslationDto&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lang,name);

@override
String toString() {
  return 'SpecialtyTranslationDto(lang: $lang, name: $name)';
}


}

/// @nodoc
abstract mixin class _$SpecialtyTranslationDtoCopyWith<$Res> implements $SpecialtyTranslationDtoCopyWith<$Res> {
  factory _$SpecialtyTranslationDtoCopyWith(_SpecialtyTranslationDto value, $Res Function(_SpecialtyTranslationDto) _then) = __$SpecialtyTranslationDtoCopyWithImpl;
@override @useResult
$Res call({
 String lang, String name
});




}
/// @nodoc
class __$SpecialtyTranslationDtoCopyWithImpl<$Res>
    implements _$SpecialtyTranslationDtoCopyWith<$Res> {
  __$SpecialtyTranslationDtoCopyWithImpl(this._self, this._then);

  final _SpecialtyTranslationDto _self;
  final $Res Function(_SpecialtyTranslationDto) _then;

/// Create a copy of SpecialtyTranslationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lang = null,Object? name = null,}) {
  return _then(_SpecialtyTranslationDto(
lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SpecialtyDto {

 int get id; String get slug; int? get category; String? get iconUrl; List<SpecialtyTranslationDto> get translations;
/// Create a copy of SpecialtyDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SpecialtyDtoCopyWith<SpecialtyDto> get copyWith => _$SpecialtyDtoCopyWithImpl<SpecialtyDto>(this as SpecialtyDto, _$identity);

  /// Serializes this SpecialtyDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SpecialtyDto&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.category, category) || other.category == category)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&const DeepCollectionEquality().equals(other.translations, translations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,category,iconUrl,const DeepCollectionEquality().hash(translations));

@override
String toString() {
  return 'SpecialtyDto(id: $id, slug: $slug, category: $category, iconUrl: $iconUrl, translations: $translations)';
}


}

/// @nodoc
abstract mixin class $SpecialtyDtoCopyWith<$Res>  {
  factory $SpecialtyDtoCopyWith(SpecialtyDto value, $Res Function(SpecialtyDto) _then) = _$SpecialtyDtoCopyWithImpl;
@useResult
$Res call({
 int id, String slug, int? category, String? iconUrl, List<SpecialtyTranslationDto> translations
});




}
/// @nodoc
class _$SpecialtyDtoCopyWithImpl<$Res>
    implements $SpecialtyDtoCopyWith<$Res> {
  _$SpecialtyDtoCopyWithImpl(this._self, this._then);

  final SpecialtyDto _self;
  final $Res Function(SpecialtyDto) _then;

/// Create a copy of SpecialtyDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? category = freezed,Object? iconUrl = freezed,Object? translations = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as int?,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,translations: null == translations ? _self.translations : translations // ignore: cast_nullable_to_non_nullable
as List<SpecialtyTranslationDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [SpecialtyDto].
extension SpecialtyDtoPatterns on SpecialtyDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SpecialtyDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SpecialtyDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SpecialtyDto value)  $default,){
final _that = this;
switch (_that) {
case _SpecialtyDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SpecialtyDto value)?  $default,){
final _that = this;
switch (_that) {
case _SpecialtyDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String slug,  int? category,  String? iconUrl,  List<SpecialtyTranslationDto> translations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SpecialtyDto() when $default != null:
return $default(_that.id,_that.slug,_that.category,_that.iconUrl,_that.translations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String slug,  int? category,  String? iconUrl,  List<SpecialtyTranslationDto> translations)  $default,) {final _that = this;
switch (_that) {
case _SpecialtyDto():
return $default(_that.id,_that.slug,_that.category,_that.iconUrl,_that.translations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String slug,  int? category,  String? iconUrl,  List<SpecialtyTranslationDto> translations)?  $default,) {final _that = this;
switch (_that) {
case _SpecialtyDto() when $default != null:
return $default(_that.id,_that.slug,_that.category,_that.iconUrl,_that.translations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SpecialtyDto extends SpecialtyDto {
  const _SpecialtyDto({required this.id, required this.slug, this.category, this.iconUrl, final  List<SpecialtyTranslationDto> translations = const []}): _translations = translations,super._();
  factory _SpecialtyDto.fromJson(Map<String, dynamic> json) => _$SpecialtyDtoFromJson(json);

@override final  int id;
@override final  String slug;
@override final  int? category;
@override final  String? iconUrl;
 final  List<SpecialtyTranslationDto> _translations;
@override@JsonKey() List<SpecialtyTranslationDto> get translations {
  if (_translations is EqualUnmodifiableListView) return _translations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_translations);
}


/// Create a copy of SpecialtyDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SpecialtyDtoCopyWith<_SpecialtyDto> get copyWith => __$SpecialtyDtoCopyWithImpl<_SpecialtyDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SpecialtyDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SpecialtyDto&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.category, category) || other.category == category)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&const DeepCollectionEquality().equals(other._translations, _translations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,category,iconUrl,const DeepCollectionEquality().hash(_translations));

@override
String toString() {
  return 'SpecialtyDto(id: $id, slug: $slug, category: $category, iconUrl: $iconUrl, translations: $translations)';
}


}

/// @nodoc
abstract mixin class _$SpecialtyDtoCopyWith<$Res> implements $SpecialtyDtoCopyWith<$Res> {
  factory _$SpecialtyDtoCopyWith(_SpecialtyDto value, $Res Function(_SpecialtyDto) _then) = __$SpecialtyDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String slug, int? category, String? iconUrl, List<SpecialtyTranslationDto> translations
});




}
/// @nodoc
class __$SpecialtyDtoCopyWithImpl<$Res>
    implements _$SpecialtyDtoCopyWith<$Res> {
  __$SpecialtyDtoCopyWithImpl(this._self, this._then);

  final _SpecialtyDto _self;
  final $Res Function(_SpecialtyDto) _then;

/// Create a copy of SpecialtyDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? category = freezed,Object? iconUrl = freezed,Object? translations = null,}) {
  return _then(_SpecialtyDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as int?,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,translations: null == translations ? _self._translations : translations // ignore: cast_nullable_to_non_nullable
as List<SpecialtyTranslationDto>,
  ));
}


}


/// @nodoc
mixin _$OrgSubtypeTranslationDto {

 String get lang; String get name;
/// Create a copy of OrgSubtypeTranslationDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrgSubtypeTranslationDtoCopyWith<OrgSubtypeTranslationDto> get copyWith => _$OrgSubtypeTranslationDtoCopyWithImpl<OrgSubtypeTranslationDto>(this as OrgSubtypeTranslationDto, _$identity);

  /// Serializes this OrgSubtypeTranslationDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrgSubtypeTranslationDto&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lang,name);

@override
String toString() {
  return 'OrgSubtypeTranslationDto(lang: $lang, name: $name)';
}


}

/// @nodoc
abstract mixin class $OrgSubtypeTranslationDtoCopyWith<$Res>  {
  factory $OrgSubtypeTranslationDtoCopyWith(OrgSubtypeTranslationDto value, $Res Function(OrgSubtypeTranslationDto) _then) = _$OrgSubtypeTranslationDtoCopyWithImpl;
@useResult
$Res call({
 String lang, String name
});




}
/// @nodoc
class _$OrgSubtypeTranslationDtoCopyWithImpl<$Res>
    implements $OrgSubtypeTranslationDtoCopyWith<$Res> {
  _$OrgSubtypeTranslationDtoCopyWithImpl(this._self, this._then);

  final OrgSubtypeTranslationDto _self;
  final $Res Function(OrgSubtypeTranslationDto) _then;

/// Create a copy of OrgSubtypeTranslationDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lang = null,Object? name = null,}) {
  return _then(_self.copyWith(
lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OrgSubtypeTranslationDto].
extension OrgSubtypeTranslationDtoPatterns on OrgSubtypeTranslationDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrgSubtypeTranslationDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrgSubtypeTranslationDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrgSubtypeTranslationDto value)  $default,){
final _that = this;
switch (_that) {
case _OrgSubtypeTranslationDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrgSubtypeTranslationDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrgSubtypeTranslationDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String lang,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrgSubtypeTranslationDto() when $default != null:
return $default(_that.lang,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String lang,  String name)  $default,) {final _that = this;
switch (_that) {
case _OrgSubtypeTranslationDto():
return $default(_that.lang,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String lang,  String name)?  $default,) {final _that = this;
switch (_that) {
case _OrgSubtypeTranslationDto() when $default != null:
return $default(_that.lang,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrgSubtypeTranslationDto implements OrgSubtypeTranslationDto {
  const _OrgSubtypeTranslationDto({required this.lang, required this.name});
  factory _OrgSubtypeTranslationDto.fromJson(Map<String, dynamic> json) => _$OrgSubtypeTranslationDtoFromJson(json);

@override final  String lang;
@override final  String name;

/// Create a copy of OrgSubtypeTranslationDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrgSubtypeTranslationDtoCopyWith<_OrgSubtypeTranslationDto> get copyWith => __$OrgSubtypeTranslationDtoCopyWithImpl<_OrgSubtypeTranslationDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrgSubtypeTranslationDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrgSubtypeTranslationDto&&(identical(other.lang, lang) || other.lang == lang)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,lang,name);

@override
String toString() {
  return 'OrgSubtypeTranslationDto(lang: $lang, name: $name)';
}


}

/// @nodoc
abstract mixin class _$OrgSubtypeTranslationDtoCopyWith<$Res> implements $OrgSubtypeTranslationDtoCopyWith<$Res> {
  factory _$OrgSubtypeTranslationDtoCopyWith(_OrgSubtypeTranslationDto value, $Res Function(_OrgSubtypeTranslationDto) _then) = __$OrgSubtypeTranslationDtoCopyWithImpl;
@override @useResult
$Res call({
 String lang, String name
});




}
/// @nodoc
class __$OrgSubtypeTranslationDtoCopyWithImpl<$Res>
    implements _$OrgSubtypeTranslationDtoCopyWith<$Res> {
  __$OrgSubtypeTranslationDtoCopyWithImpl(this._self, this._then);

  final _OrgSubtypeTranslationDto _self;
  final $Res Function(_OrgSubtypeTranslationDto) _then;

/// Create a copy of OrgSubtypeTranslationDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lang = null,Object? name = null,}) {
  return _then(_OrgSubtypeTranslationDto(
lang: null == lang ? _self.lang : lang // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$OrgSubtypeDto {

 int get id; String get slug; List<OrgSubtypeTranslationDto> get translations;
/// Create a copy of OrgSubtypeDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrgSubtypeDtoCopyWith<OrgSubtypeDto> get copyWith => _$OrgSubtypeDtoCopyWithImpl<OrgSubtypeDto>(this as OrgSubtypeDto, _$identity);

  /// Serializes this OrgSubtypeDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrgSubtypeDto&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&const DeepCollectionEquality().equals(other.translations, translations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,const DeepCollectionEquality().hash(translations));

@override
String toString() {
  return 'OrgSubtypeDto(id: $id, slug: $slug, translations: $translations)';
}


}

/// @nodoc
abstract mixin class $OrgSubtypeDtoCopyWith<$Res>  {
  factory $OrgSubtypeDtoCopyWith(OrgSubtypeDto value, $Res Function(OrgSubtypeDto) _then) = _$OrgSubtypeDtoCopyWithImpl;
@useResult
$Res call({
 int id, String slug, List<OrgSubtypeTranslationDto> translations
});




}
/// @nodoc
class _$OrgSubtypeDtoCopyWithImpl<$Res>
    implements $OrgSubtypeDtoCopyWith<$Res> {
  _$OrgSubtypeDtoCopyWithImpl(this._self, this._then);

  final OrgSubtypeDto _self;
  final $Res Function(OrgSubtypeDto) _then;

/// Create a copy of OrgSubtypeDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? translations = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,translations: null == translations ? _self.translations : translations // ignore: cast_nullable_to_non_nullable
as List<OrgSubtypeTranslationDto>,
  ));
}

}


/// Adds pattern-matching-related methods to [OrgSubtypeDto].
extension OrgSubtypeDtoPatterns on OrgSubtypeDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrgSubtypeDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrgSubtypeDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrgSubtypeDto value)  $default,){
final _that = this;
switch (_that) {
case _OrgSubtypeDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrgSubtypeDto value)?  $default,){
final _that = this;
switch (_that) {
case _OrgSubtypeDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String slug,  List<OrgSubtypeTranslationDto> translations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrgSubtypeDto() when $default != null:
return $default(_that.id,_that.slug,_that.translations);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String slug,  List<OrgSubtypeTranslationDto> translations)  $default,) {final _that = this;
switch (_that) {
case _OrgSubtypeDto():
return $default(_that.id,_that.slug,_that.translations);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String slug,  List<OrgSubtypeTranslationDto> translations)?  $default,) {final _that = this;
switch (_that) {
case _OrgSubtypeDto() when $default != null:
return $default(_that.id,_that.slug,_that.translations);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrgSubtypeDto extends OrgSubtypeDto {
  const _OrgSubtypeDto({required this.id, required this.slug, final  List<OrgSubtypeTranslationDto> translations = const []}): _translations = translations,super._();
  factory _OrgSubtypeDto.fromJson(Map<String, dynamic> json) => _$OrgSubtypeDtoFromJson(json);

@override final  int id;
@override final  String slug;
 final  List<OrgSubtypeTranslationDto> _translations;
@override@JsonKey() List<OrgSubtypeTranslationDto> get translations {
  if (_translations is EqualUnmodifiableListView) return _translations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_translations);
}


/// Create a copy of OrgSubtypeDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrgSubtypeDtoCopyWith<_OrgSubtypeDto> get copyWith => __$OrgSubtypeDtoCopyWithImpl<_OrgSubtypeDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrgSubtypeDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrgSubtypeDto&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&const DeepCollectionEquality().equals(other._translations, _translations));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,const DeepCollectionEquality().hash(_translations));

@override
String toString() {
  return 'OrgSubtypeDto(id: $id, slug: $slug, translations: $translations)';
}


}

/// @nodoc
abstract mixin class _$OrgSubtypeDtoCopyWith<$Res> implements $OrgSubtypeDtoCopyWith<$Res> {
  factory _$OrgSubtypeDtoCopyWith(_OrgSubtypeDto value, $Res Function(_OrgSubtypeDto) _then) = __$OrgSubtypeDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, String slug, List<OrgSubtypeTranslationDto> translations
});




}
/// @nodoc
class __$OrgSubtypeDtoCopyWithImpl<$Res>
    implements _$OrgSubtypeDtoCopyWith<$Res> {
  __$OrgSubtypeDtoCopyWithImpl(this._self, this._then);

  final _OrgSubtypeDto _self;
  final $Res Function(_OrgSubtypeDto) _then;

/// Create a copy of OrgSubtypeDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? translations = null,}) {
  return _then(_OrgSubtypeDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,translations: null == translations ? _self._translations : translations // ignore: cast_nullable_to_non_nullable
as List<OrgSubtypeTranslationDto>,
  ));
}


}

// dart format on
