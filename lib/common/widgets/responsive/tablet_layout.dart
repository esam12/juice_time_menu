import 'package:flutter/material.dart';
import 'package:juice_time_menu/common/widgets/layouts/headers/header.dart';

class TabletLayout extends StatelessWidget {
  const TabletLayout({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: const Header(), body: body);
  }
}
