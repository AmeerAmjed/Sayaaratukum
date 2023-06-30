import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/user/my_%20subscribe_store.dart';
import 'package:sayaaratukum/data/services/remote/user/my_%20subscribe_store.dart';

class MySubscribeStoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MySubscribeStoreServices>(() => MySubscribeStoreServices());
    Get.lazyPut<MySubscribeStoreController>(() => MySubscribeStoreController());
  }
}
