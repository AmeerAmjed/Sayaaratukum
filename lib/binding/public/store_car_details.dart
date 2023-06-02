import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/public/store/store_car_details.dart';
import 'package:sayaaratukum/controllers/public/store/store_car_info_details.dart';
import 'package:sayaaratukum/services/remote/public/cars.dart';
import 'package:sayaaratukum/services/remote/public/store.dart';

class StoreCarDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreCarDetailsController>(() => StoreCarDetailsController());
    Get.lazyPut<InfoStoreCarDetails>(() => InfoStoreCarDetails());
    Get.lazyPut<CarsServices>(() => CarsServices());
    Get.lazyPut<StoreServices>(() => StoreServices());
  }
}
