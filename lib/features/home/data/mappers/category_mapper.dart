import 'package:juice_time_menu/features/home/data/models/category_entity.dart';
import 'package:juice_time_menu/features/home/domain/models/category.dart';

/// Mapper for converting between CategoryEntity (data layer) and Category (domain layer).
class CategoryMapper {
  /// Converts CategoryEntity to Category domain model.
  static Category toDomain(CategoryEntity entity) {
    return Category(
      id: entity.id,
      name: entity.name,
      image: entity.image,
      isFeature: entity.isFeature,
    );
  }

  /// Converts Category domain model to CategoryEntity.
  static CategoryEntity toEntity(Category domain) {
    return CategoryEntity(
      id: domain.id,
      name: domain.name,
      image: domain.image,
      isFeature: domain.isFeature,
    );
  }
}
