import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/application.dart';
import 'package:sayaaratukum/domain/controllers/controller.dart';
import 'package:sayaaratukum/domain/models//notification_model.dart';
import 'package:sayaaratukum/data/services/remote/user/notification.dart';

class NotificationController extends BaseController
    with StateMixin<List<NotificationModel>> {
  static NotificationController get instance => Get.find();

  var notificationsNotShow = 0.obs;
  var notifications = <NotificationModel>[].obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {
    if (Application.instance.isLogin) {
      resetValue();
      await getNotification();
    } else {
      resetValue();
      change(null, status: RxStatus.error());
    }
  }

  resetValue() {
    notificationsNotShow.value = 0;
    notifications.value = [];
  }

  getNotification() async {
    change(null, status: RxStatus.loading());
    try {
      await NotificationServices.instance.getAllNotification().then((response) {
        List<NotificationModel> notifications = NotificationModel.listFromJson(
          response.body[data],
        );
        this.notifications.value = notifications.reversed.toList();
        notificationsNotShow.value = getCountNotificationsNotShow();
        update();
        if (notifications.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(this.notifications, status: RxStatus.success());
        }
      });
    } on Response catch (response) {
      print("err NotificationController $response");
      change(null, status: RxStatus.error());
    }
  }

  setAllNotificationSeen() async {
    try {
      await NotificationServices.instance.setNotificationsSeen().then((data) {
        updateNotificationSeen();
      });
    } on Response catch (response) {
      print("err setAllNotificationSeen $response");
    }
  }

  int getCountNotificationsNotShow() {
    var count = 0;
    for (var notification in notifications) {
      if (!notification.isRead) {
        count++;
      }
    }
    return count;
  }

  updateNotificationSeen() {
    for (var element in notifications) {
      element.isRead = true;
    }
    notificationsNotShow.value = 0;

    update();
  }
}
