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
  static const String brands = "Brands";

  static const home = 'Home';
  static const spareParts = 'spareParts';
  static const stores = 'store';
  static const favorite = 'favorite';

  static const myProfile = 'myProfile';
  static const setting = 'setting';
  static const privacy = 'privacy';
  static const socialMedia = 'socialMedia';
  static const logout = 'logout';
}
