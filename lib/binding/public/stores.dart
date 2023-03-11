import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/public/stores.dart';

class StoresBinding extends Bindings {
  @override
  void dependencies() {

    Get.put<StoresController>(StoresController(), permanent: true);

  }
}
