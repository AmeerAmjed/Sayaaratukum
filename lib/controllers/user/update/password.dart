import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/auth/auth.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/services/remote/user/profile.dart';

class UpdatePasswordController extends AuthController {
  static UpdatePasswordController get instance => Get.find();

  late GlobalKey<FormState> formKeyUpdatePassword;
  late TextEditingController password;
  late TextEditingController passwordConfirmation;

  RxBool disableSubmit = false.obs;
  RxBool visibilityPassword = true.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() {
    formKeyUpdatePassword = GlobalKey<FormState>();
    password = TextEditingController();
    passwordConfirmation = TextEditingController();
  }

  Future<void> updatePassword() async {
    loading(true);

    try {
      await ProfileService.instance
          .updatePassword(password.text, passwordConfirmation.text)
          .then((response) {
        loading(false);
        var body = response.body;
        if (response.isOk) {
          if (body[statusResponse] == success) {
            showMessage(L10n.successfullyUpdateProfile.tr);
          }
        }
      });
    } on Response catch (response) {
      loading(false);
      onError(response.body[message]);
    }
  }

  loading(bool state) {
    disableSubmit.value = state;
    update();
  }

  toggleShowPassword() {
    visibilityPassword.value = !visibilityPassword.value;
  }

  @override
  void dispose() {
    password.dispose();
    passwordConfirmation.dispose();
    super.dispose();
  }
}
