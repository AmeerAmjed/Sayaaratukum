import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/components/auth_option_drawer.dart';
import 'package:sayaaratukum/screens/components/list_title_icon.dart';
import 'package:sayaaratukum/screens/components/try_auth.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class DrawerApp extends GetView<Application> {
  const DrawerApp({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Application.instance.user?.value != null
              ? const AuthOptionDrawer()
              : const TryAuth(),
          const VerticalSpace8(),
          ListTitleIcon(
            title: L10n.setting.tr,
            icon: Iconsax.setting_24,
            onTap: () {},
          ),
          ListTitleIcon(
            title: L10n.privacy.tr,
            icon: Iconsax.security_safe,
            onTap: () {},
          ),
          ListTitleIcon(
            title: L10n.socialMedia.tr,
            icon: Iconsax.people,
            onTap: () {},
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
              onTap: () {},
              color: Theme.of(context).errorColor,
            ),
        ],
      ),
    );
  }
}
