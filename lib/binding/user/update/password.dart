import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/user/update/password.dart';
import 'package:sayaaratukum/services/remote/user/profile.dart';

class UpdatePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdatePasswordController>(() => UpdatePasswordController());
    Get.lazyPut<ProfileService>(() => ProfileService());
  }
}
