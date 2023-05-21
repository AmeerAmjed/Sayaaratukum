import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/public/category_tool.dart';
import 'package:sayaaratukum/services/remote/public/category_tool.dart';

class CategoryToolBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryToolService>(() => CategoryToolService());
    Get.put<CategoryToolController>(CategoryToolController(), permanent: true);
  }
}
