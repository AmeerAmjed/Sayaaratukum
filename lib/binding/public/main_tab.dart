import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/main_tab.dart';


class MainTabBinding extends Bindings {
  @override
  void dependencies() {

    Get.put<MainTabController>(MainTabController(), permanent: true);

  }
}
