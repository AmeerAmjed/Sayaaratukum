import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/auth/login.dart';
import 'package:sayaaratukum/domain/controllers/public/car_details.dart';
import 'package:sayaaratukum/data/services/remote/auth/login.dart';

class CarDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarDetailsController>(() => CarDetailsController());
  }
}
