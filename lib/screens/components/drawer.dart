import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/components/list_title_icon.dart';
import 'package:sayaaratukum/widgets/box.dart';
import 'package:sayaaratukum/widgets/image_loading.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class DrawerApp extends StatelessWidget {
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
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            currentAccountPicture: const Box(
              size: 92.0,
              child: ImageLoading(
                imageUrl:
                    "https://avatars.githubusercontent.com/u/45900975?v=4",
              ),
            ),
            accountName: Text("ameeeerea"),
            accountEmail: Text("ameeeerea"),
            // margin: EdgeInsets.zero,
          ),
          const VerticalSpace16(),
          ListTitleIcon(
            title: L10n.myProfile.tr,
            icon: Iconsax.user,
            onTap: () {},
          ),
          ListTitleIcon(
            title: L10n.favorite.tr,
            icon: Iconsax.heart,
            onTap: () {},
          ),
          const VerticalSpace16(),
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
