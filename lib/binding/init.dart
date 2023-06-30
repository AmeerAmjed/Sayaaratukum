import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/services/remote/pusher.dart';
import 'package:sayaaratukum/services/remote/user/favorite.dart';

class Binding {
  static init() {
    Get.put<Application>(Application(), permanent: true);
    Get.put(PusherServices(), permanent: true);
    Get.put<FavoriteService>(FavoriteService(), permanent: true);
  }
}
