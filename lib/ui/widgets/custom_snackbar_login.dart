import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/route/page.dart';
import 'package:sayaaratukum/ui/theme//color.dart';
import 'package:sayaaratukum/ui/widgets//custom_snackbar.dart';

snackBarToLogin(String message) {
  customSnackBar(
    message,
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
