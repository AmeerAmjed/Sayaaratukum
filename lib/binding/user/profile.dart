import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/user/profile.dart';
import 'package:sayaaratukum/services/remote/user/profile.dart';


class ProfileBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<ProfileService>(() => ProfileService());

  }
}
