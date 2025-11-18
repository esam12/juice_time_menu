import 'package:flutter/material.dart';
import 'package:juice_time_menu/app/constants/app_assets.dart';
import 'package:juice_time_menu/features/home/presentation/views/widgets/desktop/scrollable_menu.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Scrollable section
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.35,
          child: ScrollableMenu(),
        ),

        /// Large image (fixed)
        Expanded(child: Image.asset(AppAssets.products, fit: BoxFit.cover)),
      ],
    );
  }
}
