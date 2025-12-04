import 'package:flutter/material.dart';
import 'package:juice_time_menu/features/home/presentation/views/widgets/menu_page.dart';

/// Desktop view with optimized padding for large screens.
class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Responsive padding based on screen width
        final horizontalPadding = constraints.maxWidth > 1200
            ? 180.0
            : constraints.maxWidth > 900
                ? 120.0
                : 24.0;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: 24,
          ),
          child: const MenuPage(),
        );
      },
    );
  }
}