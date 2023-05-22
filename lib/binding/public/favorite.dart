import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/user/favorite.dart';


class FavoriteBinding extends Bindings {
  @override
  void dependencies() {

    Get.put<FavoriteController>(FavoriteController(), permanent: true);

  }
}
