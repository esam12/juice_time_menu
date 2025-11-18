import 'package:flutter/material.dart';
import 'package:juice_time_menu/common/widgets/layouts/templates/site_layout.dart';
import 'package:juice_time_menu/features/home/presentation/views/widgets/desktop/desktop_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SiteLayout(
      desktop: DesktopView(),
      tablet: Container(),
      mobile: Container(),
    );
  }
}
