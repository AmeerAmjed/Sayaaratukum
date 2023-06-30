import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:sayaaratukum/domain/controllers/application.dart';
import 'package:sayaaratukum/domain/controllers/user/notification.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/route/page.dart';
import 'package:sayaaratukum/ui/theme//color.dart';
import 'package:sayaaratukum/ui/widgets//box.dart';
import 'package:sayaaratukum/ui/widgets//custom_snackbar_login.dart';
import 'package:sayaaratukum/ui/widgets//space.dart';

class MyNotification extends GetView<NotificationController> {
  const MyNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        alignment: const Alignment(0.9, 0.9),
        children: <Widget>[
          Box(
            size: 38,
            child: Center(
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  if (Application.instance.isLogin) {
                    controller.navigateTo(RouteScreen.notification);
                  } else {
                    snackBarToLogin(L10n.loginToShowNotification.tr);
                  }
                },
                icon: const Icon(CupertinoIcons.bell, size: 18),
              ),
            ),
          ),
          GetBuilder<NotificationController>(builder: (controller) {
            if (controller.notificationsNotShow.value > 0) {
              return Positioned(
                top: 12,
                right: 10,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorSystem.colorDanger,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    controller.notificationsNotShow.value.toString(),
                    style: Get.theme.textTheme.labelSmall?.copyWith(
                      fontSize: 6.6,
                    ),
                  ),
                ),
              );
            }
            return const Space();
          })
        ],
      ),
    );
  }
}
