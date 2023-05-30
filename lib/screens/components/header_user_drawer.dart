import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/screens/components/image_user.dart';
import 'package:sayaaratukum/widgets/box.dart';

class HeaderUserDrawer extends GetView<Application> {
  const HeaderUserDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Application>(builder: (controller) {
      var userInfo = controller.user?.value;
      return UserAccountsDrawerHeader(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        currentAccountPicture: const Box(
          size: 92.0,
          child: ImageUser(),
        ),
        accountName: Text(userInfo?.fullName ?? ""),
        accountEmail: Text(
          (userInfo?.phoneNumber ?? (userInfo?.email ?? "")),
        ),
        // margin: EdgeInsets.zero,
      );
    });
  }
}
