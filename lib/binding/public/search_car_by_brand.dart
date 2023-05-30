import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/public/search_car_by_brand.dart';
import 'package:sayaaratukum/services/remote/public/search.dart';

class SearchCarByBrandIdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchServices>(() => SearchServices());
    Get.lazyPut<SearchCarByBrandController>(() => SearchCarByBrandController());
  }
}
