import 'package:flutter/material.dart';
import 'package:juice_time_menu/core/services/shared_preferences_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'supported_locales.dart';

part 'locale_notifier.g.dart';

@riverpod
class LocaleNotifier extends _$LocaleNotifier {
  static const String _languageCodeKey = 'language_code';

  @override
  Locale build() {
    // عند البناء، حاول قراءة اللغة المحفوظة
    final code = SharedPreferencesService.getString(_languageCodeKey);
    if (code != null && supportedLocales.any((loc) => loc.languageCode == code)) {
      return Locale(code);
    }
    return supportedLocales.first;
  }

  Future<void> changeLocale(Locale locale) async {
    if (!supportedLocales.contains(locale)) return;
    state = locale;
    await SharedPreferencesService.setString(_languageCodeKey, locale.languageCode);
  }
}
