import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/public/category_tool.dart';
import 'package:sayaaratukum/domain/controllers/user/add_tool.dart';
import 'package:sayaaratukum/data/services/remote/public/tools.dart';
import 'package:sayaaratukum/data/services/remote/user/add_tool.dart';

class AddToolBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddToolService>(() => AddToolService());
    Get.lazyPut<ToolsServices>(() => ToolsServices());
    Get.lazyPut<AddToolController>(() => AddToolController());
    Get.put<CategoryToolController>(CategoryToolController(), permanent: true);

  }
}
