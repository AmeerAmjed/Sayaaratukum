import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/application.dart';
import 'package:sayaaratukum/domain/controllers/auth/auth.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/data/services/remote/user/profile.dart';

class UpdatePhoneNumberController extends AuthController {
  static UpdatePhoneNumberController get instance => Get.find();

  late GlobalKey<FormState> formKeyUpdatePhoneNumber;
  late TextEditingController phoneNumber;

  RxBool disableSubmit = false.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() {
    var userInfo = Application.instance.user?.value;
    formKeyUpdatePhoneNumber = GlobalKey<FormState>();
    phoneNumber = TextEditingController(text: userInfo?.phoneNumber ?? "");
  }

  Future<void> updatePhoneNumber() async {
    loading(true);

    try {
      await ProfileService.instance
          .updatePhoneNumber(phoneNumber.text)
          .then((response) {
        loading(false);
        var body = response.body;
        if (response.isOk) {
          if (body[statusResponse] == success) {
            try {
              var userInfo = Application.instance.user?.value;
              userInfo?.phoneNumber = phoneNumber.text;
              Application.instance.updateUserInfo(userInfo!);
            } catch (e) {}
            showMessage(L10n.successfullyUpdatePhoneNumber.tr);
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
    phoneNumber.dispose();
    super.dispose();
  }
}
