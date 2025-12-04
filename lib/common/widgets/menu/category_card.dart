import 'package:flutter/material.dart';
import 'package:juice_time_menu/app/theme/app_colors.dart';
import 'package:juice_time_menu/app/theme/app_images.dart';
import 'package:juice_time_menu/features/home/domain/models/category.dart';

/// Category card widget with hover and active states.
/// Pure widget optimized for performance.
class CategoryCard extends StatefulWidget {
  const CategoryCard({
    super.key,
    required this.category,
    required this.index,
    required this.isActive,
    required this.onTap,
    required this.primaryColor,
  });

  final Category category;
  final int index;
  final bool isActive;
  final VoidCallback onTap;
  final Color primaryColor;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final categoryName = widget.category.getNameByLocale(locale);
    final active = widget.isActive;
    final pastelColor = AppColors.getCategoryColor(widget.index);
    final cardColor = active ? widget.primaryColor : pastelColor;
    final textColor = active ? Colors.white : Colors.black87;
    final arrowIconColor = active
        ? widget.primaryColor
        : HSLColor.fromColor(pastelColor).withLightness(0.4).toColor();

    const double circleRadius = 45;
    const double cardWidth = 160;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _hovering || active ? 1.02 : 1.0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          child: SizedBox(
            width: cardWidth,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: circleRadius),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                        if (active)
                          BoxShadow(
                            color: widget.primaryColor.withOpacity(0.3),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            categoryName,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                              height: 1.1,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "Fresh & Sweet",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 11,
                              color: textColor.withOpacity(0.8),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          height: 36,
                          width: 36,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.6),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            color: arrowIconColor,
                            size: 18,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  child: Container(
                    height: circleRadius * 2,
                    width: circleRadius * 2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      image: DecorationImage(
                        image: AssetImage(widget.category.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}