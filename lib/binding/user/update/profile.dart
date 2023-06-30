import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/user/update/profile.dart';
import 'package:sayaaratukum/data/services/remote/user/profile.dart';

class UpdateProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateProfileController>(() => UpdateProfileController());
    Get.lazyPut<ProfileService>(() => ProfileService());
  }
}
