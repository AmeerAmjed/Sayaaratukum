import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/public/favorite.dart';


class FavoriteBinding extends Bindings {
  @override
  void dependencies() {

    Get.put<FavoriteController>(FavoriteController(), permanent: true);

  }
}
