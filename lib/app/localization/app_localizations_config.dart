import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:juice_time_menu/app/localization/supported_locales.dart';
import 'package:juice_time_menu/generated/l10n.dart';

class AppLocalizationsConfig {
  AppLocalizationsConfig._();

  List<Locale> supportedLoc = supportedLocales;

  static final List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ];

  /// طريقة للحصول على الترجمة الحالية بسهولة داخل الكود
  static S of(BuildContext context) {
    return S.of(context);
  }

  /// اختياري: دالة لتغيير اللغة برمجياً
  /// (إذا كنت تستخدم Provider أو Riverpod أو أي state management)
  static void changeLocale(BuildContext context, Locale locale) {
    // مثال: إذا كنت تستخدم إشارة أو notifier لتغيير اللغة
    // LocaleNotifier.of(context).setLocale(locale);
    // ثم يعاد بناء واجهة المستخدم
  }
}
