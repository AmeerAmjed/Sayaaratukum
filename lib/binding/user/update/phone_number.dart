import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/user/update/email.dart';
import 'package:sayaaratukum/domain/controllers/user/update/phone_number.dart';
import 'package:sayaaratukum/data/services/remote/user/profile.dart';

class UpdatePhoneNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdatePhoneNumberController>(() => UpdatePhoneNumberController());
    Get.lazyPut<ProfileService>(() => ProfileService());
  }
}
