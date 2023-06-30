import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/user/update/password.dart';
import 'package:sayaaratukum/data/services/remote/user/profile.dart';

class UpdatePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdatePasswordController>(() => UpdatePasswordController());
    Get.lazyPut<ProfileService>(() => ProfileService());
  }
}
