

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/models/user.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/services/local/storage.dart';
import 'package:sayaaratukum/services/remote/auth/login.dart';

import 'auth.dart';

class LoginController extends AuthController with LocalStorage {
  late TextEditingController emailOrNumberPhone;
  late TextEditingController password;
  late GlobalKey<FormState> loginFormKey;

  RxBool visibilityPassword = true.obs;
  RxBool disableSubmit = false.obs;

  @override
  void onInit() {
    super.onInit();
    emailOrNumberPhone = TextEditingController();
    password = TextEditingController();
    loginFormKey = GlobalKey<FormState>();
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
          }
          Get.offAllNamed(RouteScreen.mainTab);
        }
      });
    } on Response catch (response) {
      loading(false);
      onError("error", response.body[message]);
    }
  }

  toggle() {
    visibilityPassword.value = !visibilityPassword.value;
  }

  loading(bool state) {
    disableSubmit.value = state;
    update();
  }
  @override
  void dispose() {
    emailOrNumberPhone.dispose();
    password.dispose();
    super.dispose();
  }
}
