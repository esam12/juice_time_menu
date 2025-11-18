import 'package:flutter/material.dart';
import 'package:juice_time_menu/app/theme/app_sizes.dart';

class GridLayout extends StatelessWidget {
  const GridLayout({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.crossAxisCount = 2,
    this.mainAxisExtent,
    this.childAspectRatio,
    this.padding = const EdgeInsets.all(0),
    this.physics = const BouncingScrollPhysics(),
  });

  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final int crossAxisCount;
  final double? mainAxisExtent;
  final double? childAspectRatio;
  final EdgeInsetsGeometry padding;
  final ScrollPhysics physics;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: padding,
      itemCount: itemCount,
      shrinkWrap: true,
      physics: physics,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: AppSizes.gridViewSpacing,
        crossAxisSpacing: AppSizes.gridViewSpacing,
        mainAxisExtent: mainAxisExtent,
        childAspectRatio:
            childAspectRatio ?? (mainAxisExtent != null ? 0.7 : 1),
      ),
      itemBuilder: itemBuilder,
    );
  }
}
