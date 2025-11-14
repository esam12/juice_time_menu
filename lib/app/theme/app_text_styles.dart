import 'package:flutter/material.dart';
import 'package:juice_time_menu/app/theme/app_colors.dart';

abstract class AppTextStyles {
  AppTextStyles._();

  static const TextStyle appBarTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static final TextTheme textThemeLight = TextTheme(
    titleLarge: appBarTitle,
    bodyLarge: const TextStyle(fontSize: 16),
    bodyMedium: const TextStyle(fontSize: 14),
    // يمكنك إضافة more styles مثل displayLarge, headlineMedium, labelLarge إلخ
  );

  static final TextTheme textThemeDark = TextTheme(
    titleLarge: appBarTitle.copyWith(color: Colors.white),
    bodyLarge: const TextStyle(fontSize: 16, color: Colors.white70),
    bodyMedium: const TextStyle(fontSize: 14, color: Colors.white60),
  );

  static TextStyle displayLarge(BuildContext context) {
    return Theme.of(context).textTheme.displayLarge!.copyWith(
      color: AppColors.primary,
      fontSize: getResponsiveFontSize(context, fontSize: 32),
      fontWeight: FontWeight.w900,
      fontFamily: 'NerkoOne',
    );
  }

  static TextStyle titleLarge(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge!.copyWith(
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontWeight: FontWeight.w900,
      fontFamily: 'NerkoOne',
    );
  }

  static TextStyle titleSmall(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium!.copyWith(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w500,
      fontFamily: 'NerkoOne',
    );
  }

  static TextStyle bodyMedium(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'NerkoOne',
    );
  }
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lower = fontSize * 0.80;
  double upper = fontSize * 1.20;

  return responsiveFontSize.clamp(lower, upper);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  if (width <= 400) return width / 390;
  if (width <= 800) return width / 600;
  if (width <= 1400) return width / 1100;
  return width / 1920;
}
