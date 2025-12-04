// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flavor_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FlavorOption {

 String get id; LocalizedText get label; List<Flavor> get flavors; String get type; String get selectionType; int get minSelection; int get maxSelection; bool get isRequired;
/// Create a copy of FlavorOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlavorOptionCopyWith<FlavorOption> get copyWith => _$FlavorOptionCopyWithImpl<FlavorOption>(this as FlavorOption, _$identity);

  /// Serializes this FlavorOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FlavorOption&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&const DeepCollectionEquality().equals(other.flavors, flavors)&&(identical(other.type, type) || other.type == type)&&(identical(other.selectionType, selectionType) || other.selectionType == selectionType)&&(identical(other.minSelection, minSelection) || other.minSelection == minSelection)&&(identical(other.maxSelection, maxSelection) || other.maxSelection == maxSelection)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,const DeepCollectionEquality().hash(flavors),type,selectionType,minSelection,maxSelection,isRequired);

@override
String toString() {
  return 'FlavorOption(id: $id, label: $label, flavors: $flavors, type: $type, selectionType: $selectionType, minSelection: $minSelection, maxSelection: $maxSelection, isRequired: $isRequired)';
}


}

/// @nodoc
abstract mixin class $FlavorOptionCopyWith<$Res>  {
  factory $FlavorOptionCopyWith(FlavorOption value, $Res Function(FlavorOption) _then) = _$FlavorOptionCopyWithImpl;
@useResult
$Res call({
 String id, LocalizedText label, List<Flavor> flavors, String type, String selectionType, int minSelection, int maxSelection, bool isRequired
});


$LocalizedTextCopyWith<$Res> get label;

}
/// @nodoc
class _$FlavorOptionCopyWithImpl<$Res>
    implements $FlavorOptionCopyWith<$Res> {
  _$FlavorOptionCopyWithImpl(this._self, this._then);

  final FlavorOption _self;
  final $Res Function(FlavorOption) _then;

/// Create a copy of FlavorOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? flavors = null,Object? type = null,Object? selectionType = null,Object? minSelection = null,Object? maxSelection = null,Object? isRequired = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as LocalizedText,flavors: null == flavors ? _self.flavors : flavors // ignore: cast_nullable_to_non_nullable
as List<Flavor>,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,selectionType: null == selectionType ? _self.selectionType : selectionType // ignore: cast_nullable_to_non_nullable
as String,minSelection: null == minSelection ? _self.minSelection : minSelection // ignore: cast_nullable_to_non_nullable
as int,maxSelection: null == maxSelection ? _self.maxSelection : maxSelection // ignore: cast_nullable_to_non_nullable
as int,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of FlavorOption
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get label {
  
  return $LocalizedTextCopyWith<$Res>(_self.label, (value) {
    return _then(_self.copyWith(label: value));
  });
}
}


/// Adds pattern-matching-related methods to [FlavorOption].
extension FlavorOptionPatterns on FlavorOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FlavorOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FlavorOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FlavorOption value)  $default,){
final _that = this;
switch (_that) {
case _FlavorOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FlavorOption value)?  $default,){
final _that = this;
switch (_that) {
case _FlavorOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  LocalizedText label,  List<Flavor> flavors,  String type,  String selectionType,  int minSelection,  int maxSelection,  bool isRequired)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FlavorOption() when $default != null:
return $default(_that.id,_that.label,_that.flavors,_that.type,_that.selectionType,_that.minSelection,_that.maxSelection,_that.isRequired);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  LocalizedText label,  List<Flavor> flavors,  String type,  String selectionType,  int minSelection,  int maxSelection,  bool isRequired)  $default,) {final _that = this;
switch (_that) {
case _FlavorOption():
return $default(_that.id,_that.label,_that.flavors,_that.type,_that.selectionType,_that.minSelection,_that.maxSelection,_that.isRequired);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  LocalizedText label,  List<Flavor> flavors,  String type,  String selectionType,  int minSelection,  int maxSelection,  bool isRequired)?  $default,) {final _that = this;
switch (_that) {
case _FlavorOption() when $default != null:
return $default(_that.id,_that.label,_that.flavors,_that.type,_that.selectionType,_that.minSelection,_that.maxSelection,_that.isRequired);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FlavorOption extends FlavorOption {
  const _FlavorOption({required this.id, required this.label, required final  List<Flavor> flavors, this.type = 'custom', this.selectionType = 'single', this.minSelection = 1, this.maxSelection = 1, this.isRequired = false}): _flavors = flavors,super._();
  factory _FlavorOption.fromJson(Map<String, dynamic> json) => _$FlavorOptionFromJson(json);

@override final  String id;
@override final  LocalizedText label;
 final  List<Flavor> _flavors;
@override List<Flavor> get flavors {
  if (_flavors is EqualUnmodifiableListView) return _flavors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_flavors);
}

@override@JsonKey() final  String type;
@override@JsonKey() final  String selectionType;
@override@JsonKey() final  int minSelection;
@override@JsonKey() final  int maxSelection;
@override@JsonKey() final  bool isRequired;

/// Create a copy of FlavorOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlavorOptionCopyWith<_FlavorOption> get copyWith => __$FlavorOptionCopyWithImpl<_FlavorOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlavorOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FlavorOption&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&const DeepCollectionEquality().equals(other._flavors, _flavors)&&(identical(other.type, type) || other.type == type)&&(identical(other.selectionType, selectionType) || other.selectionType == selectionType)&&(identical(other.minSelection, minSelection) || other.minSelection == minSelection)&&(identical(other.maxSelection, maxSelection) || other.maxSelection == maxSelection)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,const DeepCollectionEquality().hash(_flavors),type,selectionType,minSelection,maxSelection,isRequired);

@override
String toString() {
  return 'FlavorOption(id: $id, label: $label, flavors: $flavors, type: $type, selectionType: $selectionType, minSelection: $minSelection, maxSelection: $maxSelection, isRequired: $isRequired)';
}


}

/// @nodoc
abstract mixin class _$FlavorOptionCopyWith<$Res> implements $FlavorOptionCopyWith<$Res> {
  factory _$FlavorOptionCopyWith(_FlavorOption value, $Res Function(_FlavorOption) _then) = __$FlavorOptionCopyWithImpl;
@override @useResult
$Res call({
 String id, LocalizedText label, List<Flavor> flavors, String type, String selectionType, int minSelection, int maxSelection, bool isRequired
});


@override $LocalizedTextCopyWith<$Res> get label;

}
/// @nodoc
class __$FlavorOptionCopyWithImpl<$Res>
    implements _$FlavorOptionCopyWith<$Res> {
  __$FlavorOptionCopyWithImpl(this._self, this._then);

  final _FlavorOption _self;
  final $Res Function(_FlavorOption) _then;

/// Create a copy of FlavorOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? flavors = null,Object? type = null,Object? selectionType = null,Object? minSelection = null,Object? maxSelection = null,Object? isRequired = null,}) {
  return _then(_FlavorOption(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as LocalizedText,flavors: null == flavors ? _self._flavors : flavors // ignore: cast_nullable_to_non_nullable
as List<Flavor>,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,selectionType: null == selectionType ? _self.selectionType : selectionType // ignore: cast_nullable_to_non_nullable
as String,minSelection: null == minSelection ? _self.minSelection : minSelection // ignore: cast_nullable_to_non_nullable
as int,maxSelection: null == maxSelection ? _self.maxSelection : maxSelection // ignore: cast_nullable_to_non_nullable
as int,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of FlavorOption
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get label {
  
  return $LocalizedTextCopyWith<$Res>(_self.label, (value) {
    return _then(_self.copyWith(label: value));
  });
}
}

// dart format on
