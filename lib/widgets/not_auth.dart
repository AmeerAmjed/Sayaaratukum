import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/widgets/buttons.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class NotAuthScreen extends StatelessWidget {
  const NotAuthScreen({
    Key? key,
    this.message,
  }) : super(key: key);

  final String? message;

  @override
  Widget build(BuildContext context) {
    return screen(context);
  }

  Widget screen(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 1),
        // Image.asset(Constant.iconTryAuth),
        const Icon(
          Iconsax.security_user,
          size: 80,
        ),
        const VerticalSpace32(),
        Center(
          child: Text(
            L10n.notAuth.tr,
            style: Get.textTheme.labelLarge,
          ),
        ),
        const VerticalSpace8(),
        if (message != null)
          Center(
            child: Text(
              message!,
              // style: Get.textTheme.labelLarge,
            ),
          ),
        const VerticalSpace8(),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Buttons(
                height: 50,
                width: double.infinity,
                fullBackground: true,
                label: L10n.register.tr,
                onPressed: () => Get.toNamed(RouteScreen.register),
              ),
              const VerticalSpace24(),
              Buttons(
                height: 50,
                width: double.infinity,
                label: L10n.login.tr,
                fullBackground: false,
                colorOnButton: Get.theme.primaryColor,
                onPressed: () => Get.toNamed(RouteScreen.login),
              ),
            ],
          ),
        ),
        const Spacer(flex: 2)
      ],
    );
  }
}
