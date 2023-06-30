import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/user/add_car.dart';
import 'package:sayaaratukum/data/services/remote/user/add_car.dart';
import 'package:sayaaratukum/data/services/remote/user/engine_power_type.dart';

class AddCarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddCarController>(() => AddCarController());
    Get.lazyPut<AddCarService>(() => AddCarService());
    Get.lazyPut<EnginePowerTypeServices>(() => EnginePowerTypeServices());
  }
}
