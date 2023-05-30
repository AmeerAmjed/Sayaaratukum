import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/main_tab.dart';
import 'package:sayaaratukum/services/remote/user/engine_power_type.dart';


class MainTabBinding extends Bindings {
  @override
  void dependencies() {

    Get.put<MainTabController>(MainTabController(), permanent: true);
    Get.put<EnginePowerTypeServices>(EnginePowerTypeServices(), permanent: true);

  }
}
