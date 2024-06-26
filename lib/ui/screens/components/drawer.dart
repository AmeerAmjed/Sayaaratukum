import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/domain/controllers/application.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/route/page.dart';
import 'package:sayaaratukum/ui/screens/components/auth_option_drawer.dart';
import 'package:sayaaratukum/ui/screens/components/language.dart';
import 'package:sayaaratukum/ui/screens/components/list_title_icon.dart';
import 'package:sayaaratukum/ui/screens/components/social_media.dart';
import 'package:sayaaratukum/ui/screens/components/try_auth.dart';
import 'package:sayaaratukum/util/open_link.dart';
import 'package:sayaaratukum/util/social_media.dart';
import 'package:sayaaratukum/ui/widgets//CustomDialog.dart';
import 'package:sayaaratukum/ui/widgets//vertical_space.dart';

class DrawerApp extends GetView<Application> {
  const DrawerApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Application.instance.user?.value != null
              ? const AuthOptionDrawer()
              : const TryAuth(),
          const VerticalSpace16(),
          ListTitleIcon(
            title: L10n.vinCheck.tr,
            icon: Iconsax.shield_search,
            onTap: () {
              controller.navigateTo(RouteScreen.vinCheck);
            },
          ),
          const VerticalSpace16(),
          // ListTitleIcon(
          //   icon: Iconsax.notification,
          //   trailing: GetBuilder<Application>(
          //     builder: (state) {
          //       return CupertinoSwitch(
          //         activeColor: Get.theme.primaryColor,
          //         value: state.isNotificationActive.value,
          //         onChanged: (switchState) {
          //           state.setNotificationState = switchState;
          //         },
          //       );
          //     },
          //   ),
          //   title: L10n.notifications.tr,
          // ),
          ListTitleIcon(
            icon: Iconsax.global,
            title: L10n.language.tr,
            trailing: Text(
              controller.getLangCode.toUpperCase(),
              style: Get.textTheme.labelMedium,
            ),
            horizontalTrailingPadding: 30,
            onTap: () {
              language();
            },
          ),
          // ListTitleIcon(
          //   title: L10n.setting.tr,
          //   icon: Iconsax.setting_24,
          //   onTap: () {},
          // ),
          ListTitleIcon(
            title: L10n.privacy.tr,
            icon: Iconsax.security_safe,
            onTap: () {
              OpenLink.url(SocialMedia.privacy);
            },
          ),
          ListTitleIcon(
            title: L10n.socialMedia.tr,
            icon: Iconsax.people,
            onTap: () {
              Get.back();
              socialMedia();
            },
          ),
          const VerticalSpace16(),
          const VerticalSpace16(),
          const VerticalSpace16(),
          const VerticalSpace16(),
          const VerticalSpace16(),
          if (Application.instance.isLogin)
            ListTitleIcon(
              title: L10n.logout.tr,
              icon: Iconsax.logout,
              onTap: () {
                showCustomDialog(
                  L10n.logout.tr,
                  isDanger: true,
                  message: L10n.messageLogout.tr,
                  labelButtonAction: L10n.logout.tr,
                  onPressedAction: Application.instance.logout,
                );
              },
              color: Theme.of(context).errorColor,
            ),
        ],
      ),
    );
  }
}
