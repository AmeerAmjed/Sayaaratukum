import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/user/update/email.dart';
import 'package:sayaaratukum/data/services/remote/user/profile.dart';

class UpdateEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateEmailController>(() => UpdateEmailController());
    Get.lazyPut<ProfileService>(() => ProfileService());
  }
}
