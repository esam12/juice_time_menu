import 'package:juice_time_menu/app/theme/app_images.dart';
import 'package:juice_time_menu/features/home/data/models/category_entity.dart';
import 'package:juice_time_menu/features/home/data/models/product_entity.dart';
import 'package:juice_time_menu/features/home/domain/models/flavor.dart';
import 'package:juice_time_menu/features/home/domain/models/flavor_option.dart';
import 'package:juice_time_menu/features/home/domain/models/localized_text.dart';

/// Local data source for menu data.
/// Currently uses mock data. In production, this would use Firebase/API.
class MenuLocalSource {
  /// Simulates async data fetch.
  Future<List<CategoryEntity>> getCategories() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _mockCategories;
  }

  /// Simulates async data fetch.
  Future<List<ProductEntity>> getProducts() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return _mockProducts;
  }

  static final List<CategoryEntity> _mockCategories = [
    CategoryEntity(
      id: "1",
      name: {"ar": "مشروبات", "en": "Drinks"},
      image: AppImages.milkshake,
      isFeature: false,
    ),
    CategoryEntity(
      id: "2",
      name: {"ar": "ساندويشات", "en": "Sandwiches"},
      image: AppImages.milkshake,
      isFeature: false,
    ),
    CategoryEntity(
      id: "3",
      name: {"ar": "عصائر", "en": "Juices"},
      image: AppImages.milkshake,
      isFeature: false,
    ),
    CategoryEntity(
      id: "4",
      name: {"ar": "فطور", "en": "BREAKFAST"},
      image: AppImages.milkshake,
      isFeature: false,
    ),
    CategoryEntity(
      id: "5",
      name: {"ar": "سموذي", "en": "Smoothies"},
      image: AppImages.milkshake,
      isFeature: false,
    ),
    CategoryEntity(
      id: "6",
      name: {"ar": "حلويات", "en": "Desserts"},
      image: AppImages.milkshake,
      isFeature: false,
    ),
    CategoryEntity(
      id: "7",
      name: {"ar": "برغر", "en": "Burgers"},
      image: AppImages.milkshake,
      isFeature: false,
    ),
    CategoryEntity(
      id: "11",
      name: {"ar": "شوربات", "en": "Soups"},
      image: AppImages.milkshake,
      isFeature: false,
    ),
  ];

  static final List<ProductEntity> _mockProducts = [
    ProductEntity(
      id: "1",
      categoryId: "1",
      name: LocalizedText(ar: "هوقا سيزر", en: "Huqqa Caesar"),
      basePrice: 61000,
      thumbnail: "https://picsum.photos/1024/1024?1",
      images: ["https://picsum.photos/1024/1024?1"],
      flavorOptions: [],
    ),
    ProductEntity(
      id: "2",
      categoryId: "1",
      name: LocalizedText(ar: "سلطة أفوكادو", en: "Avocado Salad"),
      basePrice: 78000,
      thumbnail: "https://picsum.photos/1024/1024?2",
      images: ["https://picsum.photos/1024/1024?2"],
      flavorOptions: [],
    ),
    ProductEntity(
      id: "3",
      categoryId: "2",
      name: LocalizedText(ar: "ساندويش دجاج", en: "Chicken Sandwich"),
      basePrice: 35000,
      thumbnail: "https://picsum.photos/1024/1024?3",
      images: ["https://picsum.photos/1024/1024?3"],
      description: LocalizedText(ar: "ساندويش دجاج", en: "Chicken Sandwich"),
      flavorOptions: [
        FlavorOption(
          id: "1",
          label: LocalizedText(ar: "دجاج", en: "Chicken"),
          flavors: [
            Flavor(
              id: "1",
              name: LocalizedText(ar: "دجاج", en: "Chicken"),
              price: 35000,
              inStock: true,
              image: "https://picsum.photos/1024/1024?3",
            ),
            Flavor(
              id: "2",
              name: LocalizedText(ar: "بيض", en: "Egg"),
              price: 10000,
              inStock: true,
              image: "https://picsum.photos/1024/1024?3",
            ),
          ],
        ),
        FlavorOption(
          id: "2",
          label: LocalizedText(ar: "بيض", en: "Egg"),
          selectionType: 'multiple',
          minSelection: 1,
          maxSelection: 2,
          isRequired: true,
          flavors: [
            Flavor(
              id: "1",
              name: LocalizedText(ar: "بيض", en: "Egg"),
              price: 10000,
              inStock: true,
              image: "https://picsum.photos/1024/1024?3",
            ),
            Flavor(
              id: "2",
              name: LocalizedText(ar: "بيض", en: "Egg"),
              price: 10000,
              inStock: true,
              image: "https://picsum.photos/1024/1024?3",
            ),
            Flavor(
              id: "3",
              name: LocalizedText(ar: "بيض", en: "Egg"),
              price: 10000,
              inStock: true,
              image: "https://picsum.photos/1024/1024?3",
            ),
            Flavor(
              id: "4",
              name: LocalizedText(ar: "بيض", en: "Egg"),
              price: 10000,
              inStock: true,
              image: "https://picsum.photos/1024/1024?3",
            ),
          ],
        ),
      ],
    ),
  ];
}
