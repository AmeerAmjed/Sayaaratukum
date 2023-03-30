import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/public/brand.dart';
import 'package:sayaaratukum/controllers/public/home.dart';
import 'package:sayaaratukum/services/remote/public/brand.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(), permanent: true);
    Get.put<HomeController>(HomeController(), permanent: true);

    //brand
    Get.lazyPut<BrandServices>(() => BrandServices());
    Get.lazyPut<BrandController>(() => BrandController());
  }
}