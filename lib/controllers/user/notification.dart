import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/models/notification_model.dart';
import 'package:sayaaratukum/services/remote/user/notification.dart';

class NotificationController extends BaseController
    with StateMixin<List<NotificationModel>> {
  static NotificationController get instance => Get.find();

  var notificationsNotShow = 0.obs;
  var notifications = <NotificationModel>[].obs;

  RxBool isLoadingMore = false.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  Future<void> init() async {
    if (Application.instance.isLogin) {
      // resetValue();
      await getNotification();
    } else {
      // resetValue();
      change(null, status: RxStatus.error());
    }
  }

  getNotification() async {
    change(null, status: RxStatus.loading());
    try {
      await NotificationServices.instance.getAllNotification().then((response) {
        List<NotificationModel> notifications = NotificationModel.listFromJson(
          response.body[data],
        );
        this.notifications.value = notifications.reversed.toList();
        if (notifications.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(this.notifications, status: RxStatus.success());
        }
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

  loadingMore(bool state) {
    isLoadingMore.value = state;
    update();
  }

  bool stateLastItem(int index, int length) {
    return index >= length && isLoadingMore.value;
  }
}
