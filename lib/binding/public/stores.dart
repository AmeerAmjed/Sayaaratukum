import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/public/stores.dart';
import 'package:sayaaratukum/services/remote/public/store.dart';

class StoresBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StoreServices>(StoreServices(), permanent: true);

    Get.put<StoresController>(StoresController(), permanent: true);
  }
}
