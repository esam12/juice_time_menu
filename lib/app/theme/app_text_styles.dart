import 'package:flutter/material.dart';

class AppTextStyles {
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
}
