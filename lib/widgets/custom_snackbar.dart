import 'package:flutter/material.dart';
import 'package:get/get.dart';

customSnackBar(
  String message, {
  double marginBottom = 100.0,
  Color? backgroundColor,
  Duration duration = const Duration(minutes: 1),
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
    backgroundColor: backgroundColor ?? Get.theme.secondaryHeaderColor,
    maxWidth: Get.width,
    mainButton: mainButton,
  );
}
