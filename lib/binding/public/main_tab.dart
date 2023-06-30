import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/main_tab.dart';
import 'package:sayaaratukum/domain/controllers/public/category_tool.dart';
import 'package:sayaaratukum/data/services/remote/user/engine_power_type.dart';


class MainTabBinding extends Bindings {
  @override
  void dependencies() {

    Get.put<MainTabController>(MainTabController(), permanent: true);
    Get.put<EnginePowerTypeServices>(EnginePowerTypeServices(), permanent: true);

  }
}
