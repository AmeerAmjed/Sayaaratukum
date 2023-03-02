import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:sayaaratukum/l10n/ar.dart';
import 'package:sayaaratukum/l10n/en.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': EnTranslations.map,
        'ar': ArTranslations.map,
      };
}

class L10n {
  static const String viewAll = "viewAll";
}
