import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/data/services/remote/public/store.dart';
import 'package:sayaaratukum/data/services/remote/public/tools.dart';
import 'package:sayaaratukum/domain/controllers/public/store/store_tool_details.dart';
import 'package:sayaaratukum/domain/controllers/public/store/store_tool_info_details.dart';

class StoreToolDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreToolDetailsController>(() => StoreToolDetailsController());
    Get.lazyPut<InfoStoreToolDetails>(() => InfoStoreToolDetails());
    Get.lazyPut<ToolsServices>(() => ToolsServices());
    Get.lazyPut<StoreServices>(() => StoreServices());
  }
}
