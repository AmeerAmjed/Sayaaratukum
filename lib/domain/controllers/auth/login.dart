import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:sayaaratukum/data/services/local/storage.dart';
import 'package:sayaaratukum/data/services/remote/auth/login.dart';
import 'package:sayaaratukum/domain/controllers/application.dart';
import 'package:sayaaratukum/domain/models//user.dart';
import 'package:sayaaratukum/ui/l10n/lang.dart';
import 'package:sayaaratukum/ui/route/page.dart';
import 'package:sayaaratukum/util/constant.dart';

import 'auth.dart';

class LoginController extends AuthController with LocalStorage {
  late TextEditingController emailOrNumberPhone;
  late TextEditingController email;
  late TextEditingController password;
  late GlobalKey<FormState> loginFormKey;
  late GlobalKey<FormState> resetPasswordFormKey;

  RxBool visibilityPassword = true.obs;
  RxBool disableSubmit = false.obs;
  RxBool disableSubmitResetPassword = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailOrNumberPhone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    loginFormKey = GlobalKey<FormState>();
    resetPasswordFormKey = GlobalKey<FormState>();
  }

  Future<void> login() async {
    loading(true);
    var userInfo = {
      "username": emailOrNumberPhone.text,
      "password": password.text,
    };
    try {
      await LoginServices.instance.login(userInfo).then((response) {
        loading(false);
        var body = response.body;
        if (response.isOk) {
          if (body[statusResponse] == success) {
            var user = UserModel.fromJson(body[data]);
            var tokenUser = body[bodyToken];
            Application.instance.login(user, tokenUser);

            if (!user.isEmailVerified && user.email != null) {
              showValidateEmail();
            } else {
              navToMainScreen();
            }
          }
        }
      });
    } on Response catch (response) {
      loading(false);
      onError(response.body[message]);
    }
  }

  Future<void> resetPassword() async {
    loadingResetPassword(true);
    var body = {"email": email.text.trim()};
    try {
      await LoginServices.instance.resetPassword(body).then((response) {
        loadingResetPassword(false);
        if (response.isOk) {
          Get.back();
          showMessage(L10n.emailSendedToRestPassword.tr);
          navToCheckOTP(email.text.trim());
        }
      });
    } on Response catch (response) {
      loadingResetPassword(false);
      onError(response.body[message]);
    }
  }

  navToCheckOTP(String email) {
    Get.offAllNamed(
      RouteScreen.checkOTPResetPassword,
      arguments: {emailToCheckOTPKey: email},
    );
  }

  toggle() {
    visibilityPassword.value = !visibilityPassword.value;
  }

  loading(bool state) {
    disableSubmit.value = state;
    update();
  }

  loadingResetPassword(bool state) {
    disableSubmitResetPassword.value = state;
    update();
  }

  @override
  void dispose() {
    emailOrNumberPhone.dispose();
    password.dispose();
    email.dispose();
    super.dispose();
  }
}
