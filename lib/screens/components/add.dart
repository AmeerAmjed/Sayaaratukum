import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/screens/profile/components/add_button.dart';
import 'package:sayaaratukum/widgets/custom_snackbar_login.dart';

class AddItemToBuy extends StatelessWidget {
  const AddItemToBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Application>(
      builder: (c) {
        return Application.instance.isLogin
            ? AddButton(
                label: Application.instance.isStoreTool()
                    ? L10n.buyTool.tr
                    : L10n.buyYourCar.tr,
                icon: Application.instance.isStoreTool()
                    ? CupertinoIcons.hammer
                    : Iconsax.car,
                onPressed: () {
                  if (Application.instance.isStoreTool()) {
                    Application.instance.navToAddTool();
                  } else {
                    Get.toNamed(RouteScreen.addCar);
                  }
                },
              )
            : AddButton(
                label: L10n.buyYourCar.tr,
                icon: Iconsax.car,
                onPressed: () {
                  snackBarToLogin(L10n.loginToBuy.tr,);
                },
              );
      },
    );
  }
}
