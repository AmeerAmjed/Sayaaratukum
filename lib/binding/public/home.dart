import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/public/home.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {

    Get.put<HomeController>(HomeController(), permanent: true);
    Get.put<HomeController>(HomeController(), permanent: true);

  }
}
