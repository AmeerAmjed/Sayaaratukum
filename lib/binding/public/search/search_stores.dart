import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/public/search/stores.dart';

class SearchStoresBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchStoresController>(() => SearchStoresController());
  }
}
