import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/controllers/user/notification.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/notification/component/item_notification.dart';
import 'package:sayaaratukum/widgets/empty.dart';
import 'package:sayaaratukum/widgets/loading.dart';

class Notification extends GetView<NotificationController> {
  const Notification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(L10n.notification.tr),
      ),
      body: controller.obx(
          onLoading: const Loading(),
          onEmpty: Empty(
            title: L10n.noResult.tr,
            icon: Iconsax.clipboard_close,
          ), (state) {
        return RefreshIndicator(
          onRefresh: controller.init,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: controller.isLoadingMore.value
                ? state!.length + 1
                : state!.length,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              thickness: 2,
              color: Get.theme.primaryColor.withOpacity(0.1),
            ),
            itemBuilder: (context, index) {
              if (index >= state.length && controller.isLoadingMore.value) {
                return const Loading();
              }

              return ItemNotification(
                item: state[index],
                onPressedItem: () {
                  controller.carDetails(state[index].id);
                },
              );
            },
          ),
        );
      }),
    );
  }
}
