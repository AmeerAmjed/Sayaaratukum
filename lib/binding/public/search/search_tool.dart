import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/public/search/car.dart';
import 'package:sayaaratukum/domain/controllers/public/search/tool.dart';
import 'package:sayaaratukum/data/services/remote/public/search.dart';

class SearchToolBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchServices>(() => SearchServices());
    Get.lazyPut<SearchToolController>(() => SearchToolController());
  }
}
