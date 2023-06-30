import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/application.dart';
import 'package:sayaaratukum/domain/controllers/auth/auth.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/domain/models//user.dart';
import 'package:sayaaratukum/data/services/remote/user/profile.dart';

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
            updateProfile();
          }
        }
      });
    } on Response catch (response) {
      loading(false);
      onError(response.body[message]);
    }
  }

  updateProfile() async {
    try {
      await ProfileService.instance.getMyProfile().then((response) async {
        var body = await response.body;
        if (response.isOk) {
          showMessage(L10n.successfullyUpdateEmail.tr);
          var user = UserModel.fromJson(body[data]);
          Application.instance.updateUserInfo(user);
        }
      });
    } on Response catch (response) {
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
