import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/public/store/store_car_details.dart';
import 'package:sayaaratukum/controllers/public/store/store_car_info_details.dart';
import 'package:sayaaratukum/controllers/public/store/store_tool_details.dart';
import 'package:sayaaratukum/controllers/public/store/store_tool_info_details.dart';
import 'package:sayaaratukum/services/remote/public/cars.dart';
import 'package:sayaaratukum/services/remote/public/store.dart';
import 'package:sayaaratukum/services/remote/public/tools.dart';

class StoreToolDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreToolDetailsController>(() => StoreToolDetailsController());
    Get.lazyPut<InfoStoreToolDetails>(() => InfoStoreToolDetails());
    Get.lazyPut<ToolsServices>(() => ToolsServices());
    Get.lazyPut<StoreServices>(() => StoreServices());
  }
}
