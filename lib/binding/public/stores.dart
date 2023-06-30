import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/public/stores.dart';
import 'package:sayaaratukum/data/services/remote/public/store.dart';

class StoresBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StoreServices>(StoreServices(), permanent: true);

    Get.put<StoresController>(StoresController(), permanent: true);
  }
}
