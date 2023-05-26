import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:sayaaratukum/theme/color.dart';
import 'package:sayaaratukum/widgets/custom_snackbar.dart';

abstract class BaseController extends GetxController with ValidatorInput {

  String message = 'message';
  String data = 'data';
  String statusResponse = 'status';
  String success = 'success';

  navigateTo(String toPage) {
    try {
      Get.toNamed(toPage);
    } catch (err) {
      print("error navigateTo $toPage");
    }
  }

  onError(
    String message, {
    Duration duration = const Duration(seconds: 1),
  }) {
    customSnackBar(
      message,
      marginBottom: .0,
      duration: duration,
      backgroundColor: ColorSystem.colorDanger,
    );
  }

  showMessage(
    String message, {
    Duration duration = const Duration(seconds: 1),
    Widget? action,
  }) {
    customSnackBar(
      message,
      marginBottom: .0,
      duration: duration,
      backgroundColor: ColorSystem.snackBar,
      mainButton: action,
    );
  }
}

mixin ValidatorInput {
  static const List<String> keyNumberPhoneIraq = ['078', '077', '075', '079'];

  static String? checkValidateIsRequired(String label, String? value) {
    if (value == null || value.isEmpty) {
      return label;
    }
    return null;
  }

  static String? checkValidateNumberPhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'رقم الهاتف مطلوب *';
    } else if (value.length != 11) {
      return 'رقم الهاتف غير صحيح يجب ان يكون 11 رقم !';
    }
    //  else if (!keyNumberPhoneIraq.contains(value.substring(0, 3))) {
    //   return 'رقم الهاتف غير صالح !';
    // }
    return null;
  }

  static String? checkValidatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة السر مطلوبة *';
    } else if (value.length <= 5) {
      return 'كلمة السر قصيرة يجب ان تكون اكثر من 6';
    } else if (value.length >= 25) {
      return 'كلمة السر طويلة يجب ان تكون اقل من 25';
    }
    return null;
  }
}
