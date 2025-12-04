import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:juice_time_menu/app/theme/app_colors.dart';
import 'package:juice_time_menu/common/widgets/menu/category_card.dart';
import 'package:juice_time_menu/features/home/application/providers/menu_providers.dart';
import 'package:juice_time_menu/features/home/domain/models/category.dart';

/// Horizontal scrollable categories bar.
/// Uses const constructors and memoization for performance.
class CategoriesBar extends ConsumerWidget {
  const CategoriesBar({super.key, required this.categories});

  final List<Category> categories;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedId = ref.watch(selectedCategoryIdProvider);

    return SizedBox(
      height: 240,
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
        ),
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: categories.length,
          separatorBuilder: (_, __) => const SizedBox(width: 20),
          itemBuilder: (context, index) {
            final category = categories[index];
            return CategoryCard(
              key: ValueKey(category.id),
              category: category,
              index: index,
              isActive: selectedId == category.id,
              onTap: () {
                ref.read(selectedCategoryIdProvider.notifier).state =
                    category.id;
              },
              primaryColor: AppColors.primary,
            );
          },
        ),
      ),
    );
  }
}
