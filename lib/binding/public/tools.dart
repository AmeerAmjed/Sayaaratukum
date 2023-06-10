import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/public/category_tool.dart';
import 'package:sayaaratukum/controllers/public/filter/filter_tool.dart';
import 'package:sayaaratukum/controllers/public/tools.dart';
import 'package:sayaaratukum/services/remote/public/tools.dart';

class ToolsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ToolsServices>(() => ToolsServices());
    Get.put<ToolsController>(ToolsController(), permanent: true);
    Get.put<CategoryToolController>(CategoryToolController(), permanent: true);
    Get.put<FilterToolController>(FilterToolController(), permanent: true);

  }
}
