import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:juice_time_menu/app/localization/app_localizations_config.dart';
import 'package:juice_time_menu/app/localization/locale_notifier.dart';
import 'package:juice_time_menu/generated/l10n.dart';
import 'router.dart';
import 'theme/app_theme.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      locale: locale,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: AppLocalizationsConfig.localizationsDelegates,
      onGenerateTitle: (context) => S.of(context).app_title,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}
