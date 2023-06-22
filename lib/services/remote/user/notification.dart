import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/services/api.dart';
import 'package:sayaaratukum/services/remote/service.dart';

class NotificationServices extends BaseService {
  static NotificationServices get instance => Get.find();

  Future<Response> getAllNotification() async {
    try {
      Response response = await get(ApiEndpoint.notification);

      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error NotificationServices getAllNotification $e");
      return Future.error(e);
    }
  }

  Future<Response> setNotificationsSeen() async {
    try {
      Response response = await post(ApiEndpoint.notificationsSeen, {});
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error NotificationServices setNotificationsSeen $e");
      return Future.error(e);
    }
  }
}
