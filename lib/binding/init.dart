import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/application.dart';
import 'package:sayaaratukum/data/services/remote/pusher.dart';
import 'package:sayaaratukum/data/services/remote/user/favorite.dart';

class Binding {
  static init() {
    Get.put<Application>(Application(), permanent: true);
    Get.put<PusherServices>(PusherServices(), permanent: true);
    Get.put<FavoriteService>(FavoriteService(), permanent: true);
  }
}
