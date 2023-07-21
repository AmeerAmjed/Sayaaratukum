import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:sayaaratukum/data/services/local/storage.dart';
import 'package:sayaaratukum/data/services/remote/auth/check_code_reset_password.dart';
import 'package:sayaaratukum/domain/controllers/application.dart';
import 'package:sayaaratukum/ui/route/page.dart';
import 'package:sayaaratukum/util/constant.dart';

import 'auth.dart';

class CheckCodResetPasswordController extends AuthController with LocalStorage {
  late TextEditingController otp;
  late GlobalKey<FormState> OTPFormKey;
  late String email;

  RxBool disableSubmit = false.obs;

  @override
  void onInit() {
    super.onInit();
    otp = TextEditingController();
    OTPFormKey = GlobalKey<FormState>();
    email = Get.arguments[emailToCheckOTPKey] ?? "";
  }

  Future<void> checkOTP() async {
    _loading(true);
    var body = {
      "email": email,
      "code": otp.text.trim(),
    };
    try {
      await CheckCodResetPasswordServices.instance
          .checkOTP(body)
          .then((response) {
        _loading(false);

        if (response.isOk) {
          onSuccessValidOTP(response.body);
        }
      });
    } on Response catch (response) {
      _loading(false);
      onError(response.body["messgaes"]);
    }
  }

  onSuccessValidOTP(body) {
    var tokenUser = body[bodyToken];
    Application.instance.updateToken(tokenUser);
    Get.offAllNamed(RouteScreen.updatePassword);
  }

  _loading(bool state) {
    disableSubmit.value = state;
    update();
  }

  @override
  void dispose() {
    otp.dispose();
    super.dispose();
  }
}
