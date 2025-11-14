import 'package:flutter/material.dart';
import 'package:juice_time_menu/common/widgets/layouts/headers/header.dart';

class DesktopLayout extends StatelessWidget {
  const DesktopLayout({super.key, this.body});

  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: const Header(), body: body);
  }
}
