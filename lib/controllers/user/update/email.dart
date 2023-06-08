import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/controllers/auth/auth.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/services/remote/user/profile.dart';

class UpdateEmailController extends AuthController {
  static UpdateEmailController get instance => Get.find();

  late GlobalKey<FormState> formKeyUpdateEmail;
  late TextEditingController email;

  RxBool disableSubmit = false.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() {
    var userInfo = Application.instance.user?.value;
    formKeyUpdateEmail = GlobalKey<FormState>();
    email =  TextEditingController(text: userInfo?.email ?? "");
  }

  Future<void> updateEmail() async {
    loading(true);

    try {
      await ProfileService.instance.updateEmail(email.text).then((response) {
        loading(false);
        var body = response.body;
        if (response.isOk) {
          if (body[statusResponse] == success) {
            showMessage(L10n.successfullyUpdateEmail.tr);
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

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
