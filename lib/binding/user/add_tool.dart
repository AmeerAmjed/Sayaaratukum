import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/public/category_tool.dart';
import 'package:sayaaratukum/controllers/user/add_tool.dart';
import 'package:sayaaratukum/services/remote/user/add_tool.dart';

class AddToolBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddToolService>(() => AddToolService());
    Get.lazyPut<AddToolController>(() => AddToolController());
    Get.put<CategoryToolController>(CategoryToolController(), permanent: true);

  }
}
