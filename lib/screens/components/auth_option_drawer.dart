import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/screens/components/header_user_drawer.dart';
import 'package:sayaaratukum/screens/components/list_title_icon.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class AuthOptionDrawer extends GetView<Application> {
  const AuthOptionDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeaderUserDrawer(),
        const VerticalSpace16(),
        ListTitleIcon(
          title: L10n.myProfile.tr,
          icon: Iconsax.user,
          onTap: () => Get.toNamed(RouteScreen.profile),
        ),
        if (controller.isUserStore)
          ListTitleIcon(
            title: L10n.myStore.tr,
            icon: Iconsax.shop,
            onTap: () {
              var user = controller.user?.value;
              if (user != null && user.myStoreId != -1) {
                if (user.role?.id == 2 && user.roleType == "tools") {
                  controller.storeTools(user.myStoreId.toString());
                }
              }
            },
          ),

        ListTitleIcon(
          title: L10n.myCars.tr,
          icon: Iconsax.car,
          onTap: () => Get.toNamed(RouteScreen.userCars),
        ),
        ListTitleIcon(
          title: L10n.mySubscribed.tr,
          icon: Iconsax.star,
          onTap: () => Get.toNamed(RouteScreen.mySubscribeStore),
        ),
        const VerticalSpace16(),
      ],
    );
  }
}
