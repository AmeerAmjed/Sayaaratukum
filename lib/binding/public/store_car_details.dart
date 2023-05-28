import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/public/store_car_details.dart';
import 'package:sayaaratukum/services/remote/public/cars.dart';

class StoreCarDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreCarDetailsController>(() => StoreCarDetailsController());
    Get.lazyPut<CarsServices>(() => CarsServices());
  }
}
