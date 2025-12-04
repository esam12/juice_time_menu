import 'package:juice_time_menu/features/home/data/models/product_entity.dart';
import 'package:juice_time_menu/features/home/domain/models/product.dart';

/// Mapper for converting between ProductEntity (data layer) and Product (domain layer).
class ProductMapper {
  /// Converts ProductEntity to Product domain model.
  static Product toDomain(ProductEntity entity) {
    return Product(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      basePrice: entity.basePrice,
      thumbnail: entity.thumbnail,
      images: entity.images,
      categoryId: entity.categoryId,
      flavorOptions: entity.flavorOptions,
    );
  }

  /// Converts Product domain model to ProductEntity.
  static ProductEntity toEntity(Product domain) {
    return ProductEntity(
      id: domain.id,
      name: domain.name,
      description: domain.description,
      basePrice: domain.basePrice,
      thumbnail: domain.thumbnail,
      images: domain.images,
      categoryId: domain.categoryId,
      flavorOptions: domain.flavorOptions,
    );
  }
}
