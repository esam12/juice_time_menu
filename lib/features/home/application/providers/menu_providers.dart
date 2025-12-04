import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:juice_time_menu/features/home/data/repositories/menu_repository_impl.dart';
import 'package:juice_time_menu/features/home/data/sources/menu_local_source.dart';
import 'package:juice_time_menu/features/home/domain/models/category.dart';
import 'package:juice_time_menu/features/home/domain/models/product.dart';
import 'package:juice_time_menu/features/home/data/repositories/menu_repository.dart';
import 'package:riverpod/legacy.dart';

/// Provider for MenuRepository instance.
/// Uses dependency injection pattern for testability.
final menuRepositoryProvider = Provider<MenuRepository>((ref) {
  return MenuRepositoryImpl(MenuLocalSource());
});

/// Provider for all categories.
/// Uses AsyncValue for loading/error states.
/// Caches result to avoid unnecessary rebuilds.
final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  final repository = ref.watch(menuRepositoryProvider);
  return repository.getCategories();
});

/// Provider for all products.
/// Caches result to avoid unnecessary rebuilds.
final productsProvider = FutureProvider<List<Product>>((ref) async {
  final repository = ref.watch(menuRepositoryProvider);
  return repository.getProducts();
});

/// State provider for selected category ID.
/// Uses String type for category selection state.
final selectedCategoryIdProvider = StateProvider<String>((ref) => "1");

/// Computed provider for filtered products by selected category.
/// Uses select() to only rebuild when selectedCategoryId changes,
/// not when products list changes (unless category changes).
final filteredProductsProvider = Provider<AsyncValue<List<Product>>>((ref) {
  final selectedCategoryId = ref.watch(selectedCategoryIdProvider);
  final productsAsync = ref.watch(productsProvider);

  return productsAsync.whenData((products) {
    return products.where((p) => p.categoryId == selectedCategoryId).toList();
  });
});

/// Provider for managing selected flavors for all products.
/// Key structure: productId -> optionIndex -> Set of flavor indices
final selectedFlavorsProvider = StateProvider<Map<String, Map<int, Set<int>>>>(
  (ref) => {},
);

/// Provider for managing single selection flavors for all products.
/// Key structure: productId -> optionIndex -> selected flavor index
final selectedSingleFlavorProvider = StateProvider<Map<String, Map<int, int?>>>(
  (ref) => {},
);
