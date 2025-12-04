// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flavor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Flavor {

 String get id; LocalizedText get name; double get price; bool get inStock; String? get image; Map<String, double>? get priceBySize;
/// Create a copy of Flavor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FlavorCopyWith<Flavor> get copyWith => _$FlavorCopyWithImpl<Flavor>(this as Flavor, _$identity);

  /// Serializes this Flavor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Flavor&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.inStock, inStock) || other.inStock == inStock)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other.priceBySize, priceBySize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price,inStock,image,const DeepCollectionEquality().hash(priceBySize));

@override
String toString() {
  return 'Flavor(id: $id, name: $name, price: $price, inStock: $inStock, image: $image, priceBySize: $priceBySize)';
}


}

/// @nodoc
abstract mixin class $FlavorCopyWith<$Res>  {
  factory $FlavorCopyWith(Flavor value, $Res Function(Flavor) _then) = _$FlavorCopyWithImpl;
@useResult
$Res call({
 String id, LocalizedText name, double price, bool inStock, String? image, Map<String, double>? priceBySize
});


$LocalizedTextCopyWith<$Res> get name;

}
/// @nodoc
class _$FlavorCopyWithImpl<$Res>
    implements $FlavorCopyWith<$Res> {
  _$FlavorCopyWithImpl(this._self, this._then);

  final Flavor _self;
  final $Res Function(Flavor) _then;

/// Create a copy of Flavor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? price = null,Object? inStock = null,Object? image = freezed,Object? priceBySize = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as LocalizedText,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,inStock: null == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,priceBySize: freezed == priceBySize ? _self.priceBySize : priceBySize // ignore: cast_nullable_to_non_nullable
as Map<String, double>?,
  ));
}
/// Create a copy of Flavor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get name {
  
  return $LocalizedTextCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}
}


/// Adds pattern-matching-related methods to [Flavor].
extension FlavorPatterns on Flavor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Flavor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Flavor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Flavor value)  $default,){
final _that = this;
switch (_that) {
case _Flavor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Flavor value)?  $default,){
final _that = this;
switch (_that) {
case _Flavor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  LocalizedText name,  double price,  bool inStock,  String? image,  Map<String, double>? priceBySize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Flavor() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.inStock,_that.image,_that.priceBySize);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  LocalizedText name,  double price,  bool inStock,  String? image,  Map<String, double>? priceBySize)  $default,) {final _that = this;
switch (_that) {
case _Flavor():
return $default(_that.id,_that.name,_that.price,_that.inStock,_that.image,_that.priceBySize);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  LocalizedText name,  double price,  bool inStock,  String? image,  Map<String, double>? priceBySize)?  $default,) {final _that = this;
switch (_that) {
case _Flavor() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.inStock,_that.image,_that.priceBySize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Flavor extends Flavor {
  const _Flavor({required this.id, required this.name, required this.price, this.inStock = true, this.image, final  Map<String, double>? priceBySize}): _priceBySize = priceBySize,super._();
  factory _Flavor.fromJson(Map<String, dynamic> json) => _$FlavorFromJson(json);

@override final  String id;
@override final  LocalizedText name;
@override final  double price;
@override@JsonKey() final  bool inStock;
@override final  String? image;
 final  Map<String, double>? _priceBySize;
@override Map<String, double>? get priceBySize {
  final value = _priceBySize;
  if (value == null) return null;
  if (_priceBySize is EqualUnmodifiableMapView) return _priceBySize;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of Flavor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FlavorCopyWith<_Flavor> get copyWith => __$FlavorCopyWithImpl<_Flavor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FlavorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Flavor&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.inStock, inStock) || other.inStock == inStock)&&(identical(other.image, image) || other.image == image)&&const DeepCollectionEquality().equals(other._priceBySize, _priceBySize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price,inStock,image,const DeepCollectionEquality().hash(_priceBySize));

@override
String toString() {
  return 'Flavor(id: $id, name: $name, price: $price, inStock: $inStock, image: $image, priceBySize: $priceBySize)';
}


}

/// @nodoc
abstract mixin class _$FlavorCopyWith<$Res> implements $FlavorCopyWith<$Res> {
  factory _$FlavorCopyWith(_Flavor value, $Res Function(_Flavor) _then) = __$FlavorCopyWithImpl;
@override @useResult
$Res call({
 String id, LocalizedText name, double price, bool inStock, String? image, Map<String, double>? priceBySize
});


@override $LocalizedTextCopyWith<$Res> get name;

}
/// @nodoc
class __$FlavorCopyWithImpl<$Res>
    implements _$FlavorCopyWith<$Res> {
  __$FlavorCopyWithImpl(this._self, this._then);

  final _Flavor _self;
  final $Res Function(_Flavor) _then;

/// Create a copy of Flavor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? price = null,Object? inStock = null,Object? image = freezed,Object? priceBySize = freezed,}) {
  return _then(_Flavor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as LocalizedText,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,inStock: null == inStock ? _self.inStock : inStock // ignore: cast_nullable_to_non_nullable
as bool,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,priceBySize: freezed == priceBySize ? _self._priceBySize : priceBySize // ignore: cast_nullable_to_non_nullable
as Map<String, double>?,
  ));
}

/// Create a copy of Flavor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocalizedTextCopyWith<$Res> get name {
  
  return $LocalizedTextCopyWith<$Res>(_self.name, (value) {
    return _then(_self.copyWith(name: value));
  });
}
}

// dart format on
