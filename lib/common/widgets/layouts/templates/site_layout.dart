import 'package:flutter/material.dart';
import 'package:juice_time_menu/common/widgets/responsive/responsive_builder.dart';
import 'package:juice_time_menu/common/widgets/responsive/desktop_layout.dart';
import 'package:juice_time_menu/common/widgets/responsive/mobile_layout.dart';
import 'package:juice_time_menu/common/widgets/responsive/tablet_layout.dart';

/// Template for the overall site layout, responsive to different screen sizes
class ASiteLayout extends StatelessWidget {
  const ASiteLayout({
    super.key,
    required this.desktop,
    required this.tablet,
    required this.mobile,
    this.useLayout = true,
  });

  /// Widget for desktop layout
  final Widget desktop;

  /// Widget for tablet layout
  final Widget tablet;

  /// Widget for mobile layout
  final Widget mobile;

  /// Flag to determine whether to use the layout
  final bool useLayout;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      desktop: useLayout
          ? DesktopLayout(body: desktop)
          : desktop,
      tablet: useLayout
          ? TabletLayout(body: tablet)
          : tablet,
      mobile: useLayout
          ? MobileLayout(body: mobile)
          : mobile,
    );
  }
}
