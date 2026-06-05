// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppSettings {

/// ISO 639-1 language code the user prefers: `'en'`, `'fr'`, or `'ar'`.
 String get primaryLanguage;/// Full preferred order used by [L10n.displayWith] when falling back.
/// Always contains exactly the three supported codes.
 List<String> get languageFallback;/// `'light'` | `'dark'` | `'system'`
 String get themeMode;/// Named accent-colour preset: `'blue'` (default) | `'teal'` | `'green'`
/// | `'purple'` | `'orange'`
 String get accentColor;/// Font-family name passed to [ThemeData.fontFamily].
/// Empty string means the Material default.
 String get fontFamily;
/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppSettingsCopyWith<AppSettings> get copyWith => _$AppSettingsCopyWithImpl<AppSettings>(this as AppSettings, _$identity);

  /// Serializes this AppSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppSettings&&(identical(other.primaryLanguage, primaryLanguage) || other.primaryLanguage == primaryLanguage)&&const DeepCollectionEquality().equals(other.languageFallback, languageFallback)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.accentColor, accentColor) || other.accentColor == accentColor)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,primaryLanguage,const DeepCollectionEquality().hash(languageFallback),themeMode,accentColor,fontFamily);

@override
String toString() {
  return 'AppSettings(primaryLanguage: $primaryLanguage, languageFallback: $languageFallback, themeMode: $themeMode, accentColor: $accentColor, fontFamily: $fontFamily)';
}


}

/// @nodoc
abstract mixin class $AppSettingsCopyWith<$Res>  {
  factory $AppSettingsCopyWith(AppSettings value, $Res Function(AppSettings) _then) = _$AppSettingsCopyWithImpl;
@useResult
$Res call({
 String primaryLanguage, List<String> languageFallback, String themeMode, String accentColor, String fontFamily
});




}
/// @nodoc
class _$AppSettingsCopyWithImpl<$Res>
    implements $AppSettingsCopyWith<$Res> {
  _$AppSettingsCopyWithImpl(this._self, this._then);

  final AppSettings _self;
  final $Res Function(AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? primaryLanguage = null,Object? languageFallback = null,Object? themeMode = null,Object? accentColor = null,Object? fontFamily = null,}) {
  return _then(_self.copyWith(
primaryLanguage: null == primaryLanguage ? _self.primaryLanguage : primaryLanguage // ignore: cast_nullable_to_non_nullable
as String,languageFallback: null == languageFallback ? _self.languageFallback : languageFallback // ignore: cast_nullable_to_non_nullable
as List<String>,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as String,accentColor: null == accentColor ? _self.accentColor : accentColor // ignore: cast_nullable_to_non_nullable
as String,fontFamily: null == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AppSettings].
extension AppSettingsPatterns on AppSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppSettings value)  $default,){
final _that = this;
switch (_that) {
case _AppSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppSettings value)?  $default,){
final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String primaryLanguage,  List<String> languageFallback,  String themeMode,  String accentColor,  String fontFamily)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.primaryLanguage,_that.languageFallback,_that.themeMode,_that.accentColor,_that.fontFamily);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String primaryLanguage,  List<String> languageFallback,  String themeMode,  String accentColor,  String fontFamily)  $default,) {final _that = this;
switch (_that) {
case _AppSettings():
return $default(_that.primaryLanguage,_that.languageFallback,_that.themeMode,_that.accentColor,_that.fontFamily);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String primaryLanguage,  List<String> languageFallback,  String themeMode,  String accentColor,  String fontFamily)?  $default,) {final _that = this;
switch (_that) {
case _AppSettings() when $default != null:
return $default(_that.primaryLanguage,_that.languageFallback,_that.themeMode,_that.accentColor,_that.fontFamily);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppSettings extends AppSettings {
  const _AppSettings({this.primaryLanguage = 'en', final  List<String> languageFallback = const ['en', 'fr', 'ar'], this.themeMode = 'light', this.accentColor = 'blue', this.fontFamily = ''}): _languageFallback = languageFallback,super._();
  factory _AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);

/// ISO 639-1 language code the user prefers: `'en'`, `'fr'`, or `'ar'`.
@override@JsonKey() final  String primaryLanguage;
/// Full preferred order used by [L10n.displayWith] when falling back.
/// Always contains exactly the three supported codes.
 final  List<String> _languageFallback;
/// Full preferred order used by [L10n.displayWith] when falling back.
/// Always contains exactly the three supported codes.
@override@JsonKey() List<String> get languageFallback {
  if (_languageFallback is EqualUnmodifiableListView) return _languageFallback;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_languageFallback);
}

/// `'light'` | `'dark'` | `'system'`
@override@JsonKey() final  String themeMode;
/// Named accent-colour preset: `'blue'` (default) | `'teal'` | `'green'`
/// | `'purple'` | `'orange'`
@override@JsonKey() final  String accentColor;
/// Font-family name passed to [ThemeData.fontFamily].
/// Empty string means the Material default.
@override@JsonKey() final  String fontFamily;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppSettingsCopyWith<_AppSettings> get copyWith => __$AppSettingsCopyWithImpl<_AppSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppSettings&&(identical(other.primaryLanguage, primaryLanguage) || other.primaryLanguage == primaryLanguage)&&const DeepCollectionEquality().equals(other._languageFallback, _languageFallback)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.accentColor, accentColor) || other.accentColor == accentColor)&&(identical(other.fontFamily, fontFamily) || other.fontFamily == fontFamily));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,primaryLanguage,const DeepCollectionEquality().hash(_languageFallback),themeMode,accentColor,fontFamily);

@override
String toString() {
  return 'AppSettings(primaryLanguage: $primaryLanguage, languageFallback: $languageFallback, themeMode: $themeMode, accentColor: $accentColor, fontFamily: $fontFamily)';
}


}

/// @nodoc
abstract mixin class _$AppSettingsCopyWith<$Res> implements $AppSettingsCopyWith<$Res> {
  factory _$AppSettingsCopyWith(_AppSettings value, $Res Function(_AppSettings) _then) = __$AppSettingsCopyWithImpl;
@override @useResult
$Res call({
 String primaryLanguage, List<String> languageFallback, String themeMode, String accentColor, String fontFamily
});




}
/// @nodoc
class __$AppSettingsCopyWithImpl<$Res>
    implements _$AppSettingsCopyWith<$Res> {
  __$AppSettingsCopyWithImpl(this._self, this._then);

  final _AppSettings _self;
  final $Res Function(_AppSettings) _then;

/// Create a copy of AppSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? primaryLanguage = null,Object? languageFallback = null,Object? themeMode = null,Object? accentColor = null,Object? fontFamily = null,}) {
  return _then(_AppSettings(
primaryLanguage: null == primaryLanguage ? _self.primaryLanguage : primaryLanguage // ignore: cast_nullable_to_non_nullable
as String,languageFallback: null == languageFallback ? _self._languageFallback : languageFallback // ignore: cast_nullable_to_non_nullable
as List<String>,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as String,accentColor: null == accentColor ? _self.accentColor : accentColor // ignore: cast_nullable_to_non_nullable
as String,fontFamily: null == fontFamily ? _self.fontFamily : fontFamily // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
