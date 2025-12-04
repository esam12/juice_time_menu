// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Product _$ProductFromJson(Map<String, dynamic> json) => _Product(
  id: json['id'] as String,
  name: LocalizedText.fromJson(json['name'] as Map<String, dynamic>),
  description: json['description'] == null
      ? null
      : LocalizedText.fromJson(json['description'] as Map<String, dynamic>),
  basePrice: (json['basePrice'] as num).toDouble(),
  thumbnail: json['thumbnail'] as String,
  images:
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  categoryId: json['categoryId'] as String?,
  flavorOptions:
      (json['flavorOptions'] as List<dynamic>?)
          ?.map((e) => FlavorOption.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$ProductToJson(_Product instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'basePrice': instance.basePrice,
  'thumbnail': instance.thumbnail,
  'images': instance.images,
  'categoryId': instance.categoryId,
  'flavorOptions': instance.flavorOptions,
};
