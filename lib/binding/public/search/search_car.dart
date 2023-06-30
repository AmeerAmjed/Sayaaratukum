import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/public/search/car.dart';
import 'package:sayaaratukum/data/services/remote/public/search.dart';

class SearchCarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchServices>(() => SearchServices());
    Get.lazyPut<SearchCarsController>(() => SearchCarsController());
  }
}
