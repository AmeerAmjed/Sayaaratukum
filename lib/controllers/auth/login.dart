

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/models/user.dart';
import 'package:sayaaratukum/services/local/storage.dart';
import 'package:sayaaratukum/services/remote/auth/login.dart';
import 'auth.dart';

class LoginController extends AuthController with LocalStorage {
  late TextEditingController phoneNumberOrEmail;
  late TextEditingController password;
  late GlobalKey<FormState> loginFormKey ;
  RxBool visibilityPassword = true.obs;
  RxBool disableSubmit = false.obs;


  @override
  void onInit() {
    super.onInit();
    phoneNumberOrEmail = TextEditingController();
    password = TextEditingController();
    loginFormKey = GlobalKey<FormState>();
  }

  @override
  Future<void> login() async {
    loading(true);
    var userInfo = {
      "phone": phoneNumberOrEmail.text,
      "password": password.text,
    };
    try {
      await LoginServices.instance.login(userInfo).then((response) {
        loading(false);
        if (response.isOk) {
          var user = UserModel.fromJson(response.body['data']);
          var token = response.body['access_token'];
          Application.instance.login(user, token);
          // Get.offAllNamed(RoutePageApp.setUp);
        }
      });
    } on Response catch (response) {
      loading(false);
      // onError(response.body['error']);
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
    phoneNumberOrEmail.dispose();
    password.dispose();
    super.dispose();
  }
}
