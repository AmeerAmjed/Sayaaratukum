import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/user/user_cars.dart';

class UserCarsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserCarsController>(() => UserCarsController());
  }
}
