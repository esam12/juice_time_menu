import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color.fromARGB(255, 192, 165, 171),
    scaffoldBackgroundColor: Colors.white,
    textTheme: AppTextStyles.textThemeLight,
    appBarTheme: AppBarTheme(
      // backgroundColor: const Color.fromARGB(255, 247, 196, 208),
      titleTextStyle: AppTextStyles.appBarTitle.copyWith(color: Colors.white),
      iconTheme: const IconThemeData(color: Colors.white),
      elevation: 0,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: Colors.black,
    textTheme: AppTextStyles.textThemeDark,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      titleTextStyle: AppTextStyles.appBarTitle.copyWith(color: Colors.white),
      iconTheme: const IconThemeData(color: Colors.white),
    ),
  );
}
