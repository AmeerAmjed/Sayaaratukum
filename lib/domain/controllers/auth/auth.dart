import 'package:get/get.dart';
import 'package:sayaaratukum/domain/controllers/application.dart';
import 'package:sayaaratukum/domain/controllers/controller.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/route/page.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/ui/widgets//CustomDialog.dart';

class AuthController extends BaseController {

  final String bodyToken = 'access_token';

  static const List<String> keyNumberPhoneIraq = [
    '075',
    '076',
    '077',
    '078',
    '079'
  ];

  showValidateEmail() {
    showCustomDialog(
      L10n.validateEmail.tr,
      message: L10n.confirmEmail.tr,
      labelButtonAction: L10n.ok.tr,
      onPressedAction: navToMainScreen,
      onCancel: navToMainScreen,
    );
  }

  navToMainScreen() {
    Get.offAllNamed(RouteScreen.mainTab);
  }

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

  String? checkValidateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return L10n.isRequired.tr;
    } else if (!Constants.emailRegExp.hasMatch(value)) {
      return L10n.emailIsInvalid.tr;
    }

    return null;
  }

  String? checkValidateEmailAndPhoneNumber(
    String? email,
    String? phoneNumber,
  ) {
    if ((email == null || email.isEmpty) &&
        (phoneNumber == null || phoneNumber.isEmpty)) {
      return "${L10n.email.tr} ${L10n.or.tr} ${L10n.phoneNumber.tr} ${L10n.isRequired.tr} ";
    }

    return null;
  }
}
