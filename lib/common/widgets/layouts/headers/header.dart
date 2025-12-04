import 'package:flutter/material.dart';
import 'package:juice_time_menu/app/theme/app_colors.dart';
import 'package:juice_time_menu/app/theme/app_images.dart';
import 'package:juice_time_menu/app/theme/app_text_styles.dart';
import 'package:juice_time_menu/core/utils/helpers/responsive_utils.dart';

/// Header widget with overlapping profile logo
class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  // Height of the colored banner background
  static const double _bannerHeight = 160.0;
  // Size of the circular logo
  static const double _logoSize = 100.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveUtils.isDesktop(context) ? 180.0 : 16.0,
      ),
      child: Stack(
        clipBehavior: Clip.none, // Allows the logo to hang below the banner
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: _bannerHeight,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.banner),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(
                  24,
                ), // Optional: adds curved bottom edges
              ),
            ),
          ),

          // 2. The Actual AppBar (For Title, Back Button, Actions)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              backgroundColor:
                  Colors.transparent, // Make transparent to show banner
              elevation: 0,
              centerTitle: true,
              iconTheme: const IconThemeData(
                color: AppColors.white,
              ), // Ensure back button is visible
              title: Text(
                '39eer Time',
                style: AppTextStyles.displayLarge(context).copyWith(
                  color: AppColors.white, // Force white text on colored banner
                ),
              ),
            ),
          ),

          // 3. The Overlapping Logo
          Positioned(
            // Position exactly half the logo's height below the bottom of the banner
            bottom: -(_logoSize / 2),
            child: Container(
              width: _logoSize,
              height: _logoSize,
              padding: const EdgeInsets.all(4), // Thickness of the white border
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary,
                ),
                clipBehavior: Clip.hardEdge,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(AppImages.logo, fit: BoxFit.contain),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(_bannerHeight);
}
