import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/public/tools.dart';

class ToolsBinding extends Bindings {
  @override
  void dependencies() {

    Get.put<ToolsController>(ToolsController(), permanent: true);

  }
}
