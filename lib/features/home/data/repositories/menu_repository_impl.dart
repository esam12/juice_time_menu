import 'package:juice_time_menu/features/home/data/mappers/category_mapper.dart';
import 'package:juice_time_menu/features/home/data/mappers/product_mapper.dart';
import 'package:juice_time_menu/features/home/data/sources/menu_local_source.dart';
import 'package:juice_time_menu/features/home/domain/models/category.dart';
import 'package:juice_time_menu/features/home/domain/models/product.dart';
import 'package:juice_time_menu/features/home/data/repositories/menu_repository.dart';

/// Implementation of MenuRepository using local data source.
/// In production, this would fetch from Firebase/API.
class MenuRepositoryImpl implements MenuRepository {
  final MenuLocalSource _localSource;

  MenuRepositoryImpl(this._localSource);

  @override
  Future<List<Category>> getCategories() async {
    final data = await _localSource.getCategories();
    return data.map(CategoryMapper.toDomain).toList();
  }

  @override
  Future<List<Product>> getProducts() async {
    final data = await _localSource.getProducts();
    return data.map(ProductMapper.toDomain).toList();
  }

  @override
  Future<List<Product>> getProductsByCategory(String categoryId) async {
    final products = await getProducts();
    return products.where((p) => p.categoryId == categoryId).toList();
  }

  @override
  Future<Product?> getProductById(String productId) async {
    final products = await getProducts();
    try {
      return products.firstWhere((p) => p.id == productId);
    } catch (_) {
      return null;
    }
  }
}
