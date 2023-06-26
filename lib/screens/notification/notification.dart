import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/user/notification.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/notification/component/button_see_all.dart';
import 'package:sayaaratukum/screens/notification/component/item_notification.dart';
import 'package:sayaaratukum/widgets/appbars.dart';
import 'package:sayaaratukum/widgets/empty.dart';
import 'package:sayaaratukum/widgets/loading.dart';
import 'package:sayaaratukum/widgets/space.dart';

class Notification extends GetView<NotificationController> {
  const Notification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        title: L10n.notification.tr,
        actions: [
          GetBuilder<NotificationController>(builder: (c) {
            if (c.notificationsNotShow.value == 0) return const Space();
            return ButtonSeeAll(
              onTap: controller.setAllNotificationSeen,
            );
          }),
        ],
      ),
      body: controller.obx(
          onLoading: const Loading(),
          onEmpty: Empty(
            title: L10n.emptyNotify.tr,
            description: L10n.emptyNotifyDes.tr,
            icon: CupertinoIcons.bell_slash,
          ), (state) {
        return RefreshIndicator(
          onRefresh: controller.init,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: controller.notifications.length,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              thickness: 2,
              color: Get.theme.primaryColor.withOpacity(0.1),
            ),
            itemBuilder: (context, index) {
              return GetBuilder<NotificationController>(builder: (c) {
                return ItemNotification(
                  item: controller.notifications[index],
                  onPressedItem: () {
                    var id = controller.notifications[index].product!.id;
                    if (controller.notifications[index].type == "tool") {
                      controller.toolDetails(id);
                    } else {
                      controller.carDetails(id);
                    }
                  },
                );
              });
            },
          ),
        );
      }),
    );
  }
}
