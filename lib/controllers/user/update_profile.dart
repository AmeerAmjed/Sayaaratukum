import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/models/user.dart';
import 'package:sayaaratukum/services/remote/user/profile.dart';

class UpdateProfileController extends BaseController {
  static UpdateProfileController get instance => Get.find();

  late GlobalKey<FormState> formKey;
  late TextEditingController firstName;
  late TextEditingController lastName;

  RxBool disableSubmit = false.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() {
    var userInfo = Application.instance.user?.value;
    formKey = GlobalKey<FormState>();
    firstName = TextEditingController(text: userInfo?.firstName ?? "");
    lastName = TextEditingController(text: userInfo?.lastName ?? "");
  }

  Future<void> updateProfile() async {
    loading(true);

    try {
      await ProfileService.instance
          .updateProfile(firstName.text.trim(), lastName.text.trim())
          .then((response) {
        loading(false);
        var body = response.body;
        if (response.isOk) {
          if (body[statusResponse] == success) {
            showMessage(L10n.successfullyUpdateProfile.tr);
            var user = UserModel.fromJson(body[data]);
            Application.instance.updateUserInfo(user);
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
    firstName.dispose();
    lastName.dispose();
    super.dispose();
  }
}
