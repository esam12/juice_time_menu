import 'package:flutter/material.dart';
import 'package:juice_time_menu/app/theme/app_colors.dart';
import 'package:juice_time_menu/app/theme/app_images.dart';
import 'package:juice_time_menu/app/theme/app_sizes.dart';
import 'package:juice_time_menu/app/theme/app_text_styles.dart';

/// Header widget for the application
class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        // border: Border(bottom: BorderSide(color: AppColors.grey, width: 1)),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.md,
        vertical: AppSizes.sm,
      ),
      child: AppBar(
        /// Search Field
        title: Text('39eer Time', style: AppTextStyles.displayLarge(context)),
        centerTitle: true,
        elevation: 0,

        /// Mobile Menu
        // leading: const LanguageDropdown(),

        /// Actions
        actions: [
          // Avatar
          Container(
            width: 80,
            height: 80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
            child: Image.asset(AppImages.logo),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 15);
}
