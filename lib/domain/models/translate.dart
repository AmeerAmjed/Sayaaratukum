import 'package:sayaaratukum/domain/models/model.dart';

class TranslateMode extends BaseModel {
  TranslateMode({
    required this.en,
    required this.defaultValue,
    required this.ar,
    required this.ku,
  });

  final String en, ar, ku, defaultValue;

  @override
  factory TranslateMode.fromJson(
    Map<String, dynamic>? data,
    String defaultValue,
  ) {
    try {
      return TranslateMode(
        defaultValue: defaultValue,
        en: data?['name_translates']['en'] ?? defaultValue,
        ar: data?['name_translates']['ar'] ?? defaultValue,
        ku: data?['name_translates']['ku'] ?? defaultValue,
      );
    } catch (err) {
      return TranslateMode(
        defaultValue: defaultValue,
        en: defaultValue,
        ar: defaultValue,
        ku: defaultValue,
      );
    }
  }

  factory TranslateMode.nullable(
    String? defaultValue,
  ) {
    return TranslateMode(
      en: defaultValue ?? "NotTranslate",
      ar: defaultValue ?? "NotTranslate",
      ku: defaultValue ?? "NotTranslate",
      defaultValue: defaultValue ?? "",
    );
  }
}
