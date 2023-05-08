import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/user/add_car.dart';
import 'package:sayaaratukum/services/remote/user/add_car.dart';

class AddCarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCarController>(() => AddCarController());
    Get.lazyPut<AddCarService>(() => AddCarService());
  }
}
