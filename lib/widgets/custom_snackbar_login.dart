import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/theme/color.dart';
import 'package:sayaaratukum/widgets/custom_snackbar.dart';

snackBarToLogin() {
  customSnackBar(
    L10n.loginToAddFavorites.tr,
    mainButton: TextButton(
      onPressed: () {
        Get.toNamed(RouteScreen.login);
      },
      child: Text(
        L10n.login.tr,
        style: TextStyle(
          color: ColorSystem.primaryColor[600],
        ),
      ),
    ),
  );
}
