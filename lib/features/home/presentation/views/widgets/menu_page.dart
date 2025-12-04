import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:juice_time_menu/common/widgets/menu/categories_bar.dart';
import 'package:juice_time_menu/common/widgets/menu/menu_item_card.dart';
import 'package:juice_time_menu/features/home/application/providers/menu_providers.dart';

/// Menu page widget displaying categories and filtered products.
/// Uses selective listening to avoid unnecessary rebuilds.
class MenuPage extends ConsumerWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Only rebuild when filtered products change, not when categories change
    final filteredProductsAsync = ref.watch(filteredProductsProvider);
    final selectedCategoryId = ref.watch(selectedCategoryIdProvider);
    final categoriesAsync = ref.watch(categoriesProvider);

    return SingleChildScrollView(
      clipBehavior: Clip.none,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Our Categories",
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
          ),
          // Categories Bar - only rebuilds when categories change
          categoriesAsync.when(
            data: (categories) => CategoriesBar(categories: categories),
            loading: () => const SizedBox(
              height: 240,
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (error, stack) => const SizedBox(
              height: 240,
              child: Center(child: Text('Error loading categories')),
            ),
          ),
          const SizedBox(height: 40),
          // Products - only rebuilds when filtered products change
          filteredProductsAsync.when(
            data: (products) => _ProductsList(
              products: products,
              selectedCategoryId: selectedCategoryId,
            ),
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(40),
                child: CircularProgressIndicator(),
              ),
            ),
            error: (error, stack) => Center(
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Text(
                  'Error loading products',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
          ),
          const SizedBox(height: 60),
        ],
      ),
    );
  }
}

/// Pure widget for products list to avoid unnecessary rebuilds.
class _ProductsList extends StatelessWidget {
  final List<dynamic> products;
  final String selectedCategoryId;

  const _ProductsList({
    required this.products,
    required this.selectedCategoryId,
  });

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(40),
        child: Text(
          "No items found in this category.",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      );
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      transitionBuilder: (child, anim) => FadeTransition(
        opacity: anim,
        child: SlideTransition(
          position: Tween(
            begin: const Offset(0, 0.1),
            end: Offset.zero,
          ).animate(anim),
          child: child,
        ),
      ),
      child: Column(
        key: ValueKey(selectedCategoryId),
        children: [
          for (final product in products)
            MenuItemCard(
              key: ValueKey(product.id),
              product: product,
            ),
        ],
      ),
    );
  }
}
