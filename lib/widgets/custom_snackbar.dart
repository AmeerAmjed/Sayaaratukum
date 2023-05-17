import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/util/constant.dart';

customSnackBar(
  String title,
  String message, {
  double marginBottom = 100.0,
  Color? backgroundColor,
  Duration duration = const Duration(seconds: 1),
}) {
  Get.snackbar(
    title,
    message,
    margin: EdgeInsets.only(bottom: marginBottom),
    // padding: const EdgeInsets.only(
    //   top: Constant.spacingMedium,
    // ),
    duration: duration,
    snackStyle: SnackStyle.GROUNDED,
    borderRadius: Constants.zero,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: backgroundColor ?? Get.theme.secondaryHeaderColor,
  );
}
