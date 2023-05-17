import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/route/page.dart';

class AuthController extends BaseController {

  static const List<String> keyNumberPhoneIraq = [
    '075',
    '076',
    '077',
    '078',
    '079'
  ];

  skipAuth() {
    Application.instance.skipAuth();
    Get.offAllNamed(RouteScreen.mainTab);
  }

  String? checkValidateIsRequired(String? value) {
    if (value == null || value.isEmpty) {
      return L10n.isRequired.tr;
    }
    return null;
  }

  String? checkValidatePassword(String? value, {String? rePassword}) {
    if (value == null || value.isEmpty) {
      return L10n.isRequired.tr;
    } else if (value.length <= 7) {
      return L10n.passwordShort.tr;
    } else if (value.length >= 50) {
      return L10n.passwordLong.tr;
    } else if (rePassword != null) {
      if (value != rePassword) {
        return L10n.passwordNotMatch.tr;
      }
    }
    return null;
  }
}
