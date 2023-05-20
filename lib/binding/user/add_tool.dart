import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/user/add_tool.dart';
import 'package:sayaaratukum/services/remote/user/add_tool.dart';

class AddToolBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddToolController>(() => AddToolController());
    Get.lazyPut<AddToolService>(() => AddToolService());
  }
}
