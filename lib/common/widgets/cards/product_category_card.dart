import 'package:flutter/material.dart';
import 'package:juice_time_menu/app/theme/app_colors.dart';

class ProductCategoryCard extends StatelessWidget {
  const ProductCategoryCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final String image;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            colors: isDark
                ? [const Color(0xFF2C2C2C), const Color(0xFF1E1E1E)]
                : [AppColors.primary, const Color(0xFFEDE7FF)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// LEFT (TEXT)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.textTheme.bodyMedium!.color,
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 36,
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey.withValues(alpha: .75),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.transparent, width: 1.5),
                    ),
                    padding: EdgeInsets.all(3),
                    child: Icon(
                      Icons.arrow_forward,
                      size: 16,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            /// RIGHT (IMAGE)
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                image,
                height: 110,
                width: 110,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
