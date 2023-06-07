import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/user/update_profile.dart';
import 'package:sayaaratukum/services/remote/user/profile.dart';

class UpdateProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateProfileController>(() => UpdateProfileController());
    Get.lazyPut<ProfileService>(() => ProfileService());
  }
}
