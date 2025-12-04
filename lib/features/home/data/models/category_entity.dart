/// Data layer entity for Category.
/// This is the internal representation used by the data layer.
class CategoryEntity {
  final String id;
  final Map<String, String> name;
  final String image;
  final bool isFeature;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.isFeature,
  });
}
