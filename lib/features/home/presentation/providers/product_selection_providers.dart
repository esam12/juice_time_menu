import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:juice_time_menu/features/home/application/providers/menu_providers.dart';

/// Provider family for selected flavors of a specific product.
/// Uses family pattern for better performance and isolation.
final productFlavorsProvider = Provider.family<Map<int, Set<int>>, String>((
  ref,
  productId,
) {
  final allSelections = ref.watch(selectedFlavorsProvider);
  return allSelections[productId] ?? {};
});

/// Provider family for single flavor selection of a specific product.
/// Uses family pattern for better performance and isolation.
final productSingleFlavorProvider = Provider.family<Map<int, int?>, String>((
  ref,
  productId,
) {
  final allSelections = ref.watch(selectedSingleFlavorProvider);
  return allSelections[productId] ?? {};
});

/// Helper provider to check if a flavor is selected for a product.
final isFlavorSelectedProvider = Provider.family<bool, _FlavorSelectionParams>((
  ref,
  params,
) {
  if (params.isSingle) {
    final selections = ref.watch(productSingleFlavorProvider(params.productId));
    return selections[params.optionIndex] == params.flavorIndex;
  } else {
    final selections = ref.watch(productFlavorsProvider(params.productId));
    final selectedIndices = selections[params.optionIndex] ?? <int>{};
    return selectedIndices.contains(params.flavorIndex);
  }
});

/// Parameters for flavor selection check.
class _FlavorSelectionParams {
  final String productId;
  final int optionIndex;
  final int flavorIndex;
  final bool isSingle;

  const _FlavorSelectionParams({
    required this.productId,
    required this.optionIndex,
    required this.flavorIndex,
    required this.isSingle,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _FlavorSelectionParams &&
          runtimeType == other.runtimeType &&
          productId == other.productId &&
          optionIndex == other.optionIndex &&
          flavorIndex == other.flavorIndex &&
          isSingle == other.isSingle;

  @override
  int get hashCode =>
      productId.hashCode ^
      optionIndex.hashCode ^
      flavorIndex.hashCode ^
      isSingle.hashCode;
}
