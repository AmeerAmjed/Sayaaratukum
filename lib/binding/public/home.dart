import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/public/ads.dart';
import 'package:sayaaratukum/domain/controllers/public/brand.dart';
import 'package:sayaaratukum/domain/controllers/public/brand_pin.dart';
import 'package:sayaaratukum/domain/controllers/public/cars.dart';
import 'package:sayaaratukum/domain/controllers/public/engine_powers.dart';
import 'package:sayaaratukum/domain/controllers/public/filter/filter_car.dart';
import 'package:sayaaratukum/domain/controllers/public/home.dart';
import 'package:sayaaratukum/domain/controllers/user/favorite.dart';
import 'package:sayaaratukum/domain/controllers/user/notification.dart';
import 'package:sayaaratukum/data/services/remote/public/ads.dart';
import 'package:sayaaratukum/data/services/remote/public/brand.dart';
import 'package:sayaaratukum/data/services/remote/public/cars.dart';
import 'package:sayaaratukum/data/services/remote/user/favorite.dart';
import 'package:sayaaratukum/data/services/remote/user/notification.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(), permanent: true);

    //brand
    Get.lazyPut<BrandServices>(() => BrandServices());
    Get.put<BrandController>(BrandController());

    Get.lazyPut<BrandPinController>(() => BrandPinController());
    //ads
    Get.lazyPut<AdsServices>(() => AdsServices());
    Get.lazyPut<AdsController>(() => AdsController());

    Get.lazyPut<CarsServices>(() => CarsServices());
    Get.lazyPut<CarsController>(() => CarsController());

    Get.put<EnginePowersController>(EnginePowersController(), permanent: true);

    Get.put<FavoriteController>(FavoriteController(), permanent: true);

    Get.put<FilterCarController>(FilterCarController(), permanent: true);


    Get.put<NotificationServices>(NotificationServices(), permanent: true);
    Get.put<FavoriteService>(FavoriteService(), permanent: true);
    Get.put<NotificationController>(NotificationController(), permanent: true);
  }
}
