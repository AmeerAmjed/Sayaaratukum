import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/auth/profile.dart';


class ProfileBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<ProfileController>(() => ProfileController());

  }
}
