import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/public/search_car.dart';
import 'package:sayaaratukum/services/remote/public/search.dart';

class SearchCarByBrandIdBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchServices>(() => SearchServices());
    Get.lazyPut<SearchCarController>(() => SearchCarController());
  }
}
