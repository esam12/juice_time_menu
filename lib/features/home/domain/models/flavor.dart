import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:juice_time_menu/features/home/domain/models/localized_text.dart';

part 'flavor.freezed.dart';
part 'flavor.g.dart';

/// Immutable domain model representing a flavor option for products.
/// Supports size-based pricing and stock availability.
@freezed
abstract class Flavor with _$Flavor {
  const factory Flavor({
    required String id,
    required LocalizedText name,
    required double price,
    @Default(true) bool inStock,
    String? image,
    Map<String, double>? priceBySize,
  }) = _Flavor;

  const Flavor._();

  factory Flavor.fromJson(Map<String, dynamic> json) => _$FlavorFromJson(json);
}
