import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:juice_time_menu/features/home/domain/models/flavor_option.dart';
import 'package:juice_time_menu/features/home/domain/models/localized_text.dart';

part 'product.freezed.dart';
part 'product.g.dart';

/// Immutable domain model representing a product.
/// Contains product information, pricing, images, and flavor options.
@freezed
abstract class Product with _$Product {
  const factory Product({
    required String id,
    required LocalizedText name,
    LocalizedText? description,
    required double basePrice,
    required String thumbnail,
    @Default([]) List<String> images,
    String? categoryId,
    @Default([]) List<FlavorOption> flavorOptions,
  }) = _Product;

  const Product._();

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  /// Returns the primary image URL (first image or thumbnail).
  String get primaryImage => images.isNotEmpty ? images.first : thumbnail;

  /// Returns true if product has flavor options.
  bool get hasFlavorOptions => flavorOptions.isNotEmpty;
}
