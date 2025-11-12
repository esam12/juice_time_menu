import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:juice_time_menu/core/services/shared_preferences_service.dart';
import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();

  await SharedPreferencesService.init();

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}
