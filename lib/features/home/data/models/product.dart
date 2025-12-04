import 'package:juice_time_menu/features/home/data/models/flavor_option.dart';
import 'package:juice_time_menu/features/home/data/models/localize_text.dart';

class ProductModel {
  final String id;
  final LocalizedText name;
  final LocalizedText? description;

  final double basePrice;

  final String thumbnail;
  final List<String> images;

  final String? categoryId;

  final List<FlavorOption> flavorOptions;

  const ProductModel({
    required this.id,
    required this.name,
    this.description,
    required this.basePrice,
    required this.thumbnail,
    this.images = const [],
    this.categoryId,
    this.flavorOptions = const [],
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'].toString(),
      name: LocalizedText.fromJson(json['name']),
      description: json['description'] != null
          ? LocalizedText.fromJson(json['description'])
          : null,
      basePrice: (json['basePrice'] ?? 0).toDouble(),
      thumbnail: json['thumbnail'],
      images: (json['images'] as List?)?.map((e) => e.toString()).toList() ?? [],
      categoryId: json['categoryId']?.toString(),
      flavorOptions: (json['flavorOptions'] as List?)
              ?.map((e) => FlavorOption.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name.toJson(),
        'description': description?.toJson(),
        'basePrice': basePrice,
        'thumbnail': thumbnail,
        'images': images,
        'categoryId': categoryId,
        'flavorOptions': flavorOptions.map((e) => e.toJson()).toList(),
      };
}
