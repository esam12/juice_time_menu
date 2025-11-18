import 'package:flutter/material.dart';

class ResponsiveUtils {
  static double getCardHeight(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= 1200) return 170;  // Desktop
    if (width >= 800) return 190;   // Tablet
    return 210;                     // Mobile
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 800 &&
      MediaQuery.of(context).size.width < 1200;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 800;
}
