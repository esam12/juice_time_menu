import 'package:flutter/material.dart';
import 'package:juice_time_menu/common/widgets/layouts/templates/site_layout.dart';
import 'package:juice_time_menu/features/home/presentation/views/widgets/desktop/desktop_view.dart';

/// Home view with responsive layout.
/// Uses SiteLayout for consistent responsive behavior.
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SiteLayout(
      desktop: DesktopView(),
      tablet: DesktopView(),
      mobile: DesktopView(),
    );
  }
}