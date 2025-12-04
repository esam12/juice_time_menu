import 'package:freezed_annotation/freezed_annotation.dart';

part 'localized_text.freezed.dart';
part 'localized_text.g.dart';

/// Immutable domain model for localized text content.
/// Supports Arabic (ar) and English (en) locales with fallback logic.
@freezed
abstract class LocalizedText with _$LocalizedText {
  const factory LocalizedText({required String ar, required String en}) =
      _LocalizedText;

  const LocalizedText._();

  factory LocalizedText.fromJson(Map<String, dynamic> json) =>
      _$LocalizedTextFromJson(json);

  /// Returns localized text based on locale code.
  /// Falls back to English if Arabic is empty or locale is not Arabic.
  String getByLocale(String locale) {
    final localeCode = locale.split('-').first;
    if (localeCode == 'ar' && ar.isNotEmpty) {
      return ar;
    }
    return en;
  }

  /// Creates an empty LocalizedText instance.
  factory LocalizedText.empty() => const LocalizedText(ar: '', en: '');
}
