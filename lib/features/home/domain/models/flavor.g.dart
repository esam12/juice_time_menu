// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flavor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Flavor _$FlavorFromJson(Map<String, dynamic> json) => _Flavor(
  id: json['id'] as String,
  name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
  price: (json['price'] as num).toDouble(),
  inStock: json['inStock'] as bool? ?? true,
  image: json['image'] as String?,
  priceBySize: (json['priceBySize'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
);

Map<String, dynamic> _$FlavorToJson(_Flavor instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'price': instance.price,
  'inStock': instance.inStock,
  'image': instance.image,
  'priceBySize': instance.priceBySize,
};
