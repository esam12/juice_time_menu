import 'package:flutter/material.dart';
import 'package:juice_time_menu/generated/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).app_title)),
      body: Center(child: Text(S.of(context).app_title)),
    );
  }
}
