import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/auth/login.dart';
import 'package:sayaaratukum/controllers/public/car_details.dart';
import 'package:sayaaratukum/services/remote/auth/login.dart';

class CarDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CarDetailsController>(() => CarDetailsController());
  }
}
