import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/public/search/car.dart';
import 'package:sayaaratukum/services/remote/public/search.dart';

class SearchCarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchServices>(() => SearchServices());
    Get.lazyPut<SearchCarsController>(() => SearchCarsController());
  }
}
