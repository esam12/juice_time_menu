class LocalizedText {
  final String ar;
  final String en;

  const LocalizedText({
    required this.ar,
    required this.en,
  });

  factory LocalizedText.empty() =>
      const LocalizedText(ar: '', en: '');

  factory LocalizedText.fromJson(Map<String, dynamic>? json) {
    if (json == null) return LocalizedText.empty();
    return LocalizedText(
      ar: json['ar'] ?? '',
      en: json['en'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'ar': ar,
        'en': en,
      };

  String getByLocale(String locale) {
    switch (locale.split('-').first) {
      case 'ar':
        return ar.isNotEmpty ? ar : en;
      default:
        return en;
    }
  }
}
