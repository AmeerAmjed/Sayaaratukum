import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/auth/login.dart';
import 'package:sayaaratukum/domain/controllers/public/car_details.dart';
import 'package:sayaaratukum/domain/controllers/public/details/tool_details.dart';
import 'package:sayaaratukum/data/services/remote/auth/login.dart';
import 'package:sayaaratukum/data/services/remote/public/tools.dart';

class ToolDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ToolDetailsController>(() => ToolDetailsController());
    Get.lazyPut<ToolsServices>(() => ToolsServices());
  }
}
