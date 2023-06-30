import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/domain/controllers/application.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/screens/profile/components/add_button.dart';
import 'package:sayaaratukum/ui/widgets//custom_snackbar_login.dart';

class AddItemToBuy extends GetView<Application> {
  const AddItemToBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Application>(
      builder: (c) {
        return controller.isLogin
            ? AddButton(
                label: controller.isStoreTool()
                    ? L10n.buyTool.tr
                    : L10n.buyYourCar.tr,
                icon: controller.isStoreTool()
                    ? CupertinoIcons.hammer
                    : Iconsax.car,
                onPressed: () {
                  if (controller.isStoreTool()) {
                    controller.navToAddTool();
                  } else {
                    controller.navToAddCar();
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
