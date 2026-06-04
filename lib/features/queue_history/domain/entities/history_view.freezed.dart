// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryView {

/// Reservations keyed by their `yyyy-MM-dd` day. A day absent from the map
/// was loaded with zero reservations.
 Map<String, List<QueueReservation>> get byDay;/// First browsable day (previous month's 1st).
 DateTime get rangeStart;/// Last browsable day (yesterday — today belongs to the live board).
 DateTime get rangeEnd;/// Days currently being re-fetched (drives per-date spinners).
 Set<String> get refreshingDays;
/// Create a copy of HistoryView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryViewCopyWith<HistoryView> get copyWith => _$HistoryViewCopyWithImpl<HistoryView>(this as HistoryView, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryView&&const DeepCollectionEquality().equals(other.byDay, byDay)&&(identical(other.rangeStart, rangeStart) || other.rangeStart == rangeStart)&&(identical(other.rangeEnd, rangeEnd) || other.rangeEnd == rangeEnd)&&const DeepCollectionEquality().equals(other.refreshingDays, refreshingDays));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(byDay),rangeStart,rangeEnd,const DeepCollectionEquality().hash(refreshingDays));

@override
String toString() {
  return 'HistoryView(byDay: $byDay, rangeStart: $rangeStart, rangeEnd: $rangeEnd, refreshingDays: $refreshingDays)';
}


}

/// @nodoc
abstract mixin class $HistoryViewCopyWith<$Res>  {
  factory $HistoryViewCopyWith(HistoryView value, $Res Function(HistoryView) _then) = _$HistoryViewCopyWithImpl;
@useResult
$Res call({
 Map<String, List<QueueReservation>> byDay, DateTime rangeStart, DateTime rangeEnd, Set<String> refreshingDays
});




}
/// @nodoc
class _$HistoryViewCopyWithImpl<$Res>
    implements $HistoryViewCopyWith<$Res> {
  _$HistoryViewCopyWithImpl(this._self, this._then);

  final HistoryView _self;
  final $Res Function(HistoryView) _then;

/// Create a copy of HistoryView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? byDay = null,Object? rangeStart = null,Object? rangeEnd = null,Object? refreshingDays = null,}) {
  return _then(_self.copyWith(
byDay: null == byDay ? _self.byDay : byDay // ignore: cast_nullable_to_non_nullable
as Map<String, List<QueueReservation>>,rangeStart: null == rangeStart ? _self.rangeStart : rangeStart // ignore: cast_nullable_to_non_nullable
as DateTime,rangeEnd: null == rangeEnd ? _self.rangeEnd : rangeEnd // ignore: cast_nullable_to_non_nullable
as DateTime,refreshingDays: null == refreshingDays ? _self.refreshingDays : refreshingDays // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryView].
extension HistoryViewPatterns on HistoryView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryView value)  $default,){
final _that = this;
switch (_that) {
case _HistoryView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryView value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<String, List<QueueReservation>> byDay,  DateTime rangeStart,  DateTime rangeEnd,  Set<String> refreshingDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryView() when $default != null:
return $default(_that.byDay,_that.rangeStart,_that.rangeEnd,_that.refreshingDays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<String, List<QueueReservation>> byDay,  DateTime rangeStart,  DateTime rangeEnd,  Set<String> refreshingDays)  $default,) {final _that = this;
switch (_that) {
case _HistoryView():
return $default(_that.byDay,_that.rangeStart,_that.rangeEnd,_that.refreshingDays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<String, List<QueueReservation>> byDay,  DateTime rangeStart,  DateTime rangeEnd,  Set<String> refreshingDays)?  $default,) {final _that = this;
switch (_that) {
case _HistoryView() when $default != null:
return $default(_that.byDay,_that.rangeStart,_that.rangeEnd,_that.refreshingDays);case _:
  return null;

}
}

}

/// @nodoc


class _HistoryView extends HistoryView {
  const _HistoryView({required final  Map<String, List<QueueReservation>> byDay, required this.rangeStart, required this.rangeEnd, final  Set<String> refreshingDays = const <String>{}}): _byDay = byDay,_refreshingDays = refreshingDays,super._();
  

/// Reservations keyed by their `yyyy-MM-dd` day. A day absent from the map
/// was loaded with zero reservations.
 final  Map<String, List<QueueReservation>> _byDay;
/// Reservations keyed by their `yyyy-MM-dd` day. A day absent from the map
/// was loaded with zero reservations.
@override Map<String, List<QueueReservation>> get byDay {
  if (_byDay is EqualUnmodifiableMapView) return _byDay;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_byDay);
}

/// First browsable day (previous month's 1st).
@override final  DateTime rangeStart;
/// Last browsable day (yesterday — today belongs to the live board).
@override final  DateTime rangeEnd;
/// Days currently being re-fetched (drives per-date spinners).
 final  Set<String> _refreshingDays;
/// Days currently being re-fetched (drives per-date spinners).
@override@JsonKey() Set<String> get refreshingDays {
  if (_refreshingDays is EqualUnmodifiableSetView) return _refreshingDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_refreshingDays);
}


/// Create a copy of HistoryView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryViewCopyWith<_HistoryView> get copyWith => __$HistoryViewCopyWithImpl<_HistoryView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryView&&const DeepCollectionEquality().equals(other._byDay, _byDay)&&(identical(other.rangeStart, rangeStart) || other.rangeStart == rangeStart)&&(identical(other.rangeEnd, rangeEnd) || other.rangeEnd == rangeEnd)&&const DeepCollectionEquality().equals(other._refreshingDays, _refreshingDays));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_byDay),rangeStart,rangeEnd,const DeepCollectionEquality().hash(_refreshingDays));

@override
String toString() {
  return 'HistoryView(byDay: $byDay, rangeStart: $rangeStart, rangeEnd: $rangeEnd, refreshingDays: $refreshingDays)';
}


}

/// @nodoc
abstract mixin class _$HistoryViewCopyWith<$Res> implements $HistoryViewCopyWith<$Res> {
  factory _$HistoryViewCopyWith(_HistoryView value, $Res Function(_HistoryView) _then) = __$HistoryViewCopyWithImpl;
@override @useResult
$Res call({
 Map<String, List<QueueReservation>> byDay, DateTime rangeStart, DateTime rangeEnd, Set<String> refreshingDays
});




}
/// @nodoc
class __$HistoryViewCopyWithImpl<$Res>
    implements _$HistoryViewCopyWith<$Res> {
  __$HistoryViewCopyWithImpl(this._self, this._then);

  final _HistoryView _self;
  final $Res Function(_HistoryView) _then;

/// Create a copy of HistoryView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? byDay = null,Object? rangeStart = null,Object? rangeEnd = null,Object? refreshingDays = null,}) {
  return _then(_HistoryView(
byDay: null == byDay ? _self._byDay : byDay // ignore: cast_nullable_to_non_nullable
as Map<String, List<QueueReservation>>,rangeStart: null == rangeStart ? _self.rangeStart : rangeStart // ignore: cast_nullable_to_non_nullable
as DateTime,rangeEnd: null == rangeEnd ? _self.rangeEnd : rangeEnd // ignore: cast_nullable_to_non_nullable
as DateTime,refreshingDays: null == refreshingDays ? _self._refreshingDays : refreshingDays // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}


}

// dart format on
