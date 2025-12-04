import 'package:juice_time_menu/features/home/domain/models/category.dart';
import 'package:juice_time_menu/features/home/domain/models/product.dart';

/// Abstract repository interface for menu data operations.
/// This follows the repository pattern to abstract data sources.
abstract class MenuRepository {
  /// Fetches all categories.
  Future<List<Category>> getCategories();

  /// Fetches all products.
  Future<List<Product>> getProducts();

  /// Fetches products filtered by category ID.
  Future<List<Product>> getProductsByCategory(String categoryId);

  /// Fetches a single product by ID.
  Future<Product?> getProductById(String productId);
}
