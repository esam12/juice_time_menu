import 'package:flutter/material.dart';
import 'package:juice_time_menu/app/constants/app_assets.dart';
import 'package:juice_time_menu/common/widgets/cards/product_category_card.dart';
import 'package:juice_time_menu/common/widgets/layouts/grid/grid_layout.dart';
import 'package:juice_time_menu/core/utils/helpers/responsive_utils.dart';

class ScrollableMenu extends StatelessWidget {
  const ScrollableMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return GridLayout(
      itemCount: 10,
      mainAxisExtent: ResponsiveUtils.getCardHeight(context),
      crossAxisCount: 2,
      padding: const EdgeInsets.all(16),
      itemBuilder: (itemContext, index) {
        return ProductCategoryCard(
          title: 'Test Item',
          subtitle: 'test item for testing',
          image: AppAssets.products,
        );
      },
    );
  }
}
