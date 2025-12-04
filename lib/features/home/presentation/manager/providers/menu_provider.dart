import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:juice_time_menu/app/theme/app_colors.dart';
import 'package:juice_time_menu/app/theme/app_images.dart';
import 'package:juice_time_menu/features/home/data/models/category.dart';
import 'package:juice_time_menu/features/home/data/models/flavor.dart';
import 'package:juice_time_menu/features/home/data/models/flavor_option.dart';
import 'package:juice_time_menu/features/home/data/models/localize_text.dart';
import 'package:juice_time_menu/features/home/data/models/product.dart';
import 'package:riverpod/legacy.dart';

// ----------------------------------------------
// Providers (State Management)
// ----------------------------------------------

/// StateProvider لتخزين الـ ID الخاص بالصنف المختار حالياً
final selectedCategoryIdProvider = StateProvider<String>((ref) => "1");

/// Provider لتوفير اللون الأساسي للتطبيق (يُفضل وضعه في مكان مركزي)
final primaryColorProvider = Provider<Color>((ref) {
  return AppColors.primary;
});

// ----------------------------------------------
// Fake Data (لأغراض العرض - يُفضل نقلها إلى ملف data/repositories)
// ----------------------------------------------

final fakeCategories = [
  CategoryModel(
    id: "1",
    name: {"ar": "مشروبات", "en": "Drinks"},
    image: AppImages.milkshake,
    isFeature: false,
  ), // نفترض أن AppImages موجود
  CategoryModel(
    id: "2",
    name: {"ar": "ساندويشات", "en": "Sandwiches"},
    image: AppImages.milkshake,
    isFeature: false,
  ),
  CategoryModel(
    id: "3",
    name: {"ar": "عصائر", "en": "Juices"},
    image: AppImages.milkshake,
    isFeature: false,
  ),
  CategoryModel(
    id: "4",
    name: {"ar": "فطور", "en": "BREAKFAST"},
    image: AppImages.milkshake,
    isFeature: false,
  ),
  CategoryModel(
    id: "5",
    name: {"ar": "سموذي", "en": "Smoothies"},
    image: AppImages.milkshake,
    isFeature: false,
  ),
  CategoryModel(
    id: "6",
    name: {"ar": "حلويات", "en": "Desserts"},
    image: AppImages.milkshake,
    isFeature: false,
  ),
  CategoryModel(
    id: "7",
    name: {"ar": "برغر", "en": "Burgers"},
    image: AppImages.milkshake,
    isFeature: false,
  ),
  CategoryModel(
    id: "11",
    name: {"ar": "شوربات", "en": "Soups"},
    image: AppImages.milkshake,
    isFeature: false,
  ),
  CategoryModel(
    id: "12",
    name: {"ar": "مشروبات", "en": "Drinks"},
    image: AppImages.milkshake,
    isFeature: false,
  ),
];

final fakeProducts = [
  // المنتجات الحالية في كودك
  ProductModel(
    id: "1",
    categoryId: "1",
    name: LocalizedText(ar: "هوقا سيزر", en: "Huqqa Caesar"),
    basePrice: 61000,
    thumbnail: "https://picsum.photos/1024/1024?1",
    images: ["https://picsum.photos/1024/1024?1"],
    flavorOptions: [],
  ),
  ProductModel(
    id: "2",
    categoryId: "1",
    name: LocalizedText(ar: "سلطة أفوكادو", en: "Avocado Salad"),
    basePrice: 78000,
    thumbnail: "https://picsum.photos/1024/1024?2",
    images: ["https://picsum.photos/1024/1024?2"],
    flavorOptions: [],
  ),
  ProductModel(
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
  // لإظهار الـ "No Items" بشكل صحيح، سنضيف صنفاً لا يحتوي على منتجات
  // ProductModel(id: 4, categoryId: 3, ...),
];

/// Selector Provider: يقوم بتصفية المنتجات في كل مرة تتغير فيها selectedCategoryId
final filteredProductsProvider = Provider<List<ProductModel>>((ref) {
  final selectedId = ref.watch(selectedCategoryIdProvider);
  return fakeProducts.where((p) => p.categoryId == selectedId).toList();
});
