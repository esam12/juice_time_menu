import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

/// Immutable domain model representing a product category.
@freezed
abstract class Category with _$Category {
  
  const Category._();

  const factory Category({
    required String id,
    required Map<String, String> name,
    required String image,
    @Default(false) bool isFeature,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  /// Returns localized category name based on locale code.
  String getNameByLocale(String locale) {
    final localeCode = locale.split('-').first;
    return name[localeCode] ?? name['en'] ?? name.values.first;
  }

  /// Creates an empty Category instance.
  factory Category.empty() =>
      const Category(id: '', name: {}, image: '', isFeature: false);
}
