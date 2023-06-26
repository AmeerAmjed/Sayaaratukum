import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/public/vin_check.dart';
import 'package:sayaaratukum/services/remote/public/vin_check.dart';

class VinCheckBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VinCheckController>(() => VinCheckController());
    Get.lazyPut<VinCheckServices>(() => VinCheckServices());
  }
}
