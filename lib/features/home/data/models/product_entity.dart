import 'package:juice_time_menu/features/home/domain/models/flavor_option.dart';
import 'package:juice_time_menu/features/home/domain/models/localized_text.dart';

/// Data layer entity for Product.
/// This is the internal representation used by the data layer.
class ProductEntity {
  final String id;
  final LocalizedText name;
  final LocalizedText? description;
  final double basePrice;
  final String thumbnail;
  final List<String> images;
  final String? categoryId;
  final List<FlavorOption> flavorOptions;

  const ProductEntity({
    required this.id,
    required this.name,
    this.description,
    required this.basePrice,
    required this.thumbnail,
    required this.images,
    this.categoryId,
    required this.flavorOptions,
  });
}
