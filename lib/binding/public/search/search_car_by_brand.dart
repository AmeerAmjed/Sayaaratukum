import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/public/search_car_by_brand.dart';
import 'package:sayaaratukum/data/services/remote/public/search.dart';

class SearchCarByBrandIdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchServices>(() => SearchServices());
    Get.lazyPut<SearchCarByBrandController>(() => SearchCarByBrandController());
  }
}
