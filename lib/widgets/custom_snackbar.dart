import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/theme/color.dart';

customSnackBar(
  String message, {
  double marginBottom = .0,
  Color? backgroundColor,
  Duration duration = const Duration(seconds: 2),
  Widget? mainButton,
}) {
  Get.rawSnackbar(
    message: message,
    margin: const EdgeInsets.all(15),
    padding: const EdgeInsets.all(15),
    duration: duration,
    snackStyle: SnackStyle.FLOATING,
    borderRadius: 4,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: backgroundColor ?? ColorSystem.snackBar,
    maxWidth: Get.width,
    mainButton: mainButton,
  );
}
