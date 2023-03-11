import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/models/user.dart';
import 'package:sayaaratukum/services/local/storage.dart';
import 'package:sayaaratukum/services/remote/auth/login.dart';

import 'auth.dart';

class RegisterController extends AuthController with LocalStorage {
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController phoneNumber;
  late TextEditingController password;
  late GlobalKey<FormState> formKey;

  RxBool visibilityPassword = true.obs;
  RxBool disableSubmit = false.obs;

  @override
  void onInit() {
    super.onInit();
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    phoneNumber = TextEditingController();
    password = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  Future<void> register() async {
    loading(true);
    try {
      await LoginServices.instance.login(getUserInfo()).then((response) {
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

  getUserInfo() => {
    "first_name": firstName.text,
    "last_name": lastName.text,
    "email": email.text,
    "phone_number": phoneNumber.text,
    "password": password.text,
  };

  loading(bool state) {
    disableSubmit.value = state;
    update();
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    phoneNumber.dispose();
    password.dispose();
    super.dispose();
  }
}
