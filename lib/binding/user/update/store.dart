import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/user/update/profile.dart';
import 'package:sayaaratukum/domain/controllers/user/update/store.dart';
import 'package:sayaaratukum/data/services/remote/public/store.dart';
import 'package:sayaaratukum/data/services/remote/user/profile.dart';

class UpdateStoreProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateStoreProfileController>(() => UpdateStoreProfileController());
    Get.lazyPut<StoreServices>(() => StoreServices());
  }
}
