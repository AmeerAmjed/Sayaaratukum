import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/models/user.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/services/remote/user/profile.dart';

class ProfileController extends BaseController {
  static ProfileController get instance => Get.find();

  RxBool disableSubmit = false.obs;
  Rxn<UserModel> user = Rxn<UserModel>();

  @override
  void onInit() {
    print("loading");
    user.value = Application.instance.user?.value;
    super.onInit();
  }

  updateProfile() async {
    try {
      await ProfileService.instance.getMyProfile().then((response) async {
        var body = await response.body;
        if (response.isOk) {
          showMessage(L10n.successfullyUpdateProfile.tr);
          var user = UserModel.fromJson(body[data]);
          Application.instance.updateUserInfo(user);
        }
      });
    } on Response catch (response) {
      onError(response.body[message]);
    }
  }

  void handleClick(String value) {
    switch (value) {
      case L10n.updateProfile:
        navigateTo(RouteScreen.updateProfile);
        break;
      case L10n.updatePassword:
        navigateTo(RouteScreen.updatePassword);
        break;
      case L10n.updateEmail:
        navigateTo(RouteScreen.updateEmail);
        break;
      case L10n.updatePhoneNumber:
        navigateTo(RouteScreen.updatePhoneNumber);
        break;
    }
  }
}
