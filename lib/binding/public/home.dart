import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/public/ads.dart';
import 'package:sayaaratukum/controllers/public/brand.dart';
import 'package:sayaaratukum/controllers/public/cars.dart';
import 'package:sayaaratukum/controllers/public/home.dart';
import 'package:sayaaratukum/services/remote/public/ads.dart';
import 'package:sayaaratukum/services/remote/public/brand.dart';
import 'package:sayaaratukum/services/remote/public/cars.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(), permanent: true);

    //brand
    Get.lazyPut<BrandServices>(() => BrandServices());
    Get.lazyPut<BrandController>(() => BrandController());
    //ads
    Get.lazyPut<AdsServices>(() => AdsServices());
    Get.lazyPut<AdsController>(() => AdsController());

    Get.lazyPut<CarsServices>(() => CarsServices());
    Get.lazyPut<CarsController>(() => CarsController());
  }
}
