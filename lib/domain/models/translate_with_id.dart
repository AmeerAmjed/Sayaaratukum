import 'package:sayaaratukum/domain/models/model.dart';

class TranslateWithIdMode extends BaseModel {
  TranslateWithIdMode({
    required this.id,
    required this.en,
    required this.defaultValue,
    required this.ar,
    required this.ku,
  });

  final String en, ar, ku, defaultValue;
  final int id;

  @override
  factory TranslateWithIdMode.fromJson(
    Map<String, dynamic>? data,
    String defaultValue,
    int id,
  ) {
    try {
      return TranslateWithIdMode(
        id: id,
        defaultValue: defaultValue,
        en: data?['name_translates']['en'] ?? defaultValue,
        ar: data?['name_translates']['ar'] ?? defaultValue,
        ku: data?['name_translates']['ku'] ?? defaultValue,
      );
    } catch (err) {
      return TranslateWithIdMode(
        id: id,
        defaultValue: defaultValue,
        en: defaultValue,
        ar: defaultValue,
        ku: defaultValue,
      );
    }
  }

  factory TranslateWithIdMode.nullable(
    String? defaultValue,
    int id,
  ) {
    return TranslateWithIdMode(
      en: defaultValue ?? "NotTranslate",
      ar: defaultValue ?? "NotTranslate",
      ku: defaultValue ?? "NotTranslate",
      defaultValue: defaultValue ?? "",
      id: id,
    );
  }
}
