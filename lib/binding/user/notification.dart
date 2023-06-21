import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/user/notification.dart';
import 'package:sayaaratukum/services/remote/user/notification.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationServices>(() => NotificationServices());
    Get.put<NotificationController>(NotificationController(), permanent: true);
  }
}
