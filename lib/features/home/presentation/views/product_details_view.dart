import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:juice_time_menu/app/theme/app_colors.dart';
import 'package:juice_time_menu/features/home/application/providers/menu_providers.dart';
import 'package:juice_time_menu/features/home/domain/models/flavor.dart';
import 'package:juice_time_menu/features/home/domain/models/flavor_option.dart';
import 'package:juice_time_menu/features/home/domain/models/product.dart';
import 'package:juice_time_menu/features/home/presentation/providers/product_selection_providers.dart';

/// Product details view displaying full product information and flavor options.
/// Optimized with selective listening and pure widgets.
class ProductDetailsView extends ConsumerWidget {
  const ProductDetailsView({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = Localizations.localeOf(context).languageCode;
    final title = product.name.getByLocale(locale);
    final description = product.description?.getByLocale(locale);
    final price = product.basePrice;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final horizontalPadding = constraints.maxWidth > 900 ? 250.0 : 16.0;

          return CustomScrollView(
            slivers: [
              _ProductImageHeader(
                product: product,
                locale: locale,
                horizontalPadding: horizontalPadding,
              ),
              _ProductDetailsContent(
                product: product,
                title: title,
                description: description,
                price: price,
                horizontalPadding: horizontalPadding,
              ),
            ],
          );
        },
      ),
    );
  }
}

/// Pure widget for product image header to avoid rebuilds.
class _ProductImageHeader extends StatelessWidget {
  const _ProductImageHeader({
    required this.product,
    required this.locale,
    required this.horizontalPadding,
  });

  final Product product;
  final String locale;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: 320,
              child: Image.network(
                product.primaryImage,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) =>
                    const Center(child: Icon(Icons.error, size: 48)),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            Positioned(
              top: 16,
              left: locale == 'ar' ? null : 16,
              right: locale == 'ar' ? 16 : null,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back, color: AppColors.primary),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Pure widget for product details content.
class _ProductDetailsContent extends ConsumerWidget {
  const _ProductDetailsContent({
    required this.product,
    required this.title,
    required this.description,
    required this.price,
    required this.horizontalPadding,
  });

  final Product product;
  final String title;
  final String? description;
  final double price;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            if (description != null && description!.isNotEmpty) ...[
              Text(
                description!,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade700,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
            ],
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.08),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.attach_money_rounded, color: AppColors.primary),
                  const SizedBox(width: 8),
                  Text(
                    "${price.toStringAsFixed(0)} ₺",
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Divider(),
            if (product.hasFlavorOptions)
              _FlavorOptionsSection(
                product: product,
                locale: Localizations.localeOf(context).languageCode,
              ),
          ],
        ),
      ),
    );
  }
}

/// Pure widget for flavor options section.
class _FlavorOptionsSection extends ConsumerWidget {
  const _FlavorOptionsSection({required this.product, required this.locale});

  final Product product;
  final String locale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: product.flavorOptions.asMap().entries.map((entry) {
        final optionIndex = entry.key;
        final option = entry.value;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                option.label.getByLocale(locale),
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 8),
              ...option.flavors.asMap().entries.map((fEntry) {
                final flavorIndex = fEntry.key;
                final flavor = fEntry.value;

                return option.isSingleSelection
                    ? _SingleFlavorTile(
                        productId: product.id,
                        optionIndex: optionIndex,
                        flavorIndex: flavorIndex,
                        flavor: flavor,
                        locale: locale,
                      )
                    : _MultipleFlavorTile(
                        productId: product.id,
                        optionIndex: optionIndex,
                        flavorIndex: flavorIndex,
                        flavor: flavor,
                        option: option,
                        locale: locale,
                      );
              }),
              const SizedBox(height: 12),
              const Divider(),
            ],
          ),
        );
      }).toList(),
    );
  }
}

/// Optimized single flavor selection tile with selective listening.
class _SingleFlavorTile extends ConsumerWidget {
  const _SingleFlavorTile({
    required this.productId,
    required this.optionIndex,
    required this.flavorIndex,
    required this.flavor,
    required this.locale,
  });

  final String productId;
  final int optionIndex;
  final int flavorIndex;
  final Flavor flavor;
  final String locale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Only watch the specific product's single flavor selection
    final selectedSingle = ref.watch(productSingleFlavorProvider(productId));
    final currentValue = selectedSingle[optionIndex];

    return Theme(
      data: Theme.of(context).copyWith(
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith<Color>((
            Set<MaterialState> states,
          ) {
            if (states.contains(MaterialState.selected)) {
              return AppColors.primary;
            }
            return Colors.grey.shade400;
          }),
        ),
      ),
      child: RadioListTile<int>(
        value: flavorIndex,
        groupValue: currentValue,
        activeColor: AppColors.primary,
        onChanged: (value) {
          ref.read(selectedSingleFlavorProvider.notifier).update((state) {
            final newState = Map<String, Map<int, int?>>.from(state);
            final productState = Map<int, int?>.from(newState[productId] ?? {});
            productState[optionIndex] = value;
            newState[productId] = productState;
            return newState;
          });
        },
        title: Row(
          children: [
            Expanded(
              child: Text(
                flavor.name.getByLocale(locale),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            if (flavor.price != 0)
              Text(
                "${flavor.price.toStringAsFixed(0)} ₺",
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(color: AppColors.primary),
              ),
            if (flavor.priceBySize != null && flavor.priceBySize!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: flavor.priceBySize!.entries.map((entry) {
                    return Text(
                      "${entry.key}: ${entry.value.toStringAsFixed(0)} ₺",
                      style: Theme.of(context).textTheme.bodySmall,
                    );
                  }).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

/// Optimized multiple flavor selection tile with selective listening.
class _MultipleFlavorTile extends ConsumerWidget {
  const _MultipleFlavorTile({
    required this.productId,
    required this.optionIndex,
    required this.flavorIndex,
    required this.flavor,
    required this.option,
    required this.locale,
  });

  final String productId;
  final int optionIndex;
  final int flavorIndex;
  final Flavor flavor;
  final FlavorOption option;
  final String locale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Only watch the specific product's flavor selections
    final selectedFlavors = ref.watch(productFlavorsProvider(productId));
    final selectedIndices = selectedFlavors[optionIndex] ?? <int>{};
    final isDisabled =
        selectedIndices.length >= option.maxSelection &&
        !selectedIndices.contains(flavorIndex);

    return Theme(
      data: Theme.of(context).copyWith(
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith<Color>((
            Set<MaterialState> states,
          ) {
            if (states.contains(MaterialState.selected)) {
              return AppColors.primary;
            }
            return Colors.transparent;
          }),
          checkColor: MaterialStateProperty.all(Colors.white),
          side: BorderSide(
            color: isDisabled ? Colors.grey.shade300 : AppColors.primary,
            width: 2,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
      ),
      child: CheckboxListTile(
        value: selectedIndices.contains(flavorIndex),
        activeColor: AppColors.primary,
        checkColor: Colors.white,
        onChanged: isDisabled
            ? null
            : (value) {
                ref.read(selectedFlavorsProvider.notifier).update((state) {
                  final newState = Map<String, Map<int, Set<int>>>.from(state);
                  final productState = Map<int, Set<int>>.from(
                    newState[productId] ?? {},
                  );
                  final currentSet = Set<int>.from(
                    productState[optionIndex] ?? {},
                  );

                  if (value == true) {
                    currentSet.add(flavorIndex);
                  } else {
                    currentSet.remove(flavorIndex);
                  }

                  productState[optionIndex] = currentSet;
                  newState[productId] = productState;
                  return newState;
                });
              },
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                flavor.name.getByLocale(locale),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            if (flavor.price != 0)
              Text(
                "${flavor.price.toStringAsFixed(0)} ₺",
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(color: AppColors.primary),
              ),
          ],
        ),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
