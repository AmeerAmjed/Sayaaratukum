import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/models/notification_model.dart';
import 'package:sayaaratukum/services/remote/user/notification.dart';

class NotificationController extends BaseController
    with StateMixin<List<NotificationModel>> {
  static NotificationController get to => Get.find();

  // var notificationsNotShow = 0.obs;
  // var notifications = <NotificationModel>[].obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() {
    // if (Application.to.isLogin) {
    //   resetValue();
    //   getNotification();
    // } else {
    //   resetValue();
    //   change(null, status: RxStatus.error());
    // }
  }

  getNotification() async {
    change(null, status: RxStatus.loading());
    try {
      await NotificationServices.instance.getAllNotification().then((data) {
        // print("database is ready $data");
        // var not = NotificationModel.listlocal(data);
        // print("database is ready $not");
        // if (not.isEmpty) {
        //   change(null, status: RxStatus.empty());
        // } else {
        //   notifications.addAll(not);
        //   not.forEach((element) {
        //     print("element ${element.isShow}");
        //   });
        //   // print("element is not show ${element.}")
        //   notificationsNotShow.value = getCountNotificationsNotShow();
        //   update();
        //   print("notifications is ready  ${notifications.value.length}");
        //   change(not, status: RxStatus.success());
        // }
      });
    } on Exception catch (response) {
      print("err NotificationController $response");
      change(null, status: RxStatus.error());
    }
  }

  setAllNotificationSeen() async {
    try {
      await NotificationServices.instance
          .setNotificationsSeen()
          .then((data) {});
    } on Exception catch (response) {
      print("err setAllNotificationSeen $response");
      change(null, status: RxStatus.error());
    }
  }
}
