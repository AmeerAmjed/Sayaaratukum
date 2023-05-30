import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/public/ads.dart';
import 'package:sayaaratukum/controllers/public/brand.dart';
import 'package:sayaaratukum/controllers/public/cars.dart';
import 'package:sayaaratukum/controllers/public/engine_powers.dart';
import 'package:sayaaratukum/controllers/public/home.dart';
import 'package:sayaaratukum/controllers/public/filter/filter_car.dart';
import 'package:sayaaratukum/controllers/public/search_car_by_brand.dart';
import 'package:sayaaratukum/controllers/user/favorite.dart';
import 'package:sayaaratukum/services/remote/public/ads.dart';
import 'package:sayaaratukum/services/remote/public/brand.dart';
import 'package:sayaaratukum/services/remote/public/cars.dart';
import 'package:sayaaratukum/services/remote/public/search.dart';
import 'package:sayaaratukum/services/remote/user/engine_power_type.dart';
import 'package:sayaaratukum/services/remote/user/favorite.dart';

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

    Get.put<EnginePowersController>(EnginePowersController(), permanent: true);

    Get.lazyPut<FavoriteService>(() => FavoriteService());
    Get.put<FavoriteController>(FavoriteController(), permanent: true);
    // Get.put<SearchCarController>(SearchCarController(), permanent: true);

    Get.put<FilterCarController>(FilterCarController(), permanent: true);

    // Get.lazyPut<SearchServices>(() => SearchServices());
  }
}
