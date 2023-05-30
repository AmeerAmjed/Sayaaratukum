import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

import 'buttons.dart';

bottomSheet({
  required Widget widget,
  Buttons? buttonAction,
  double height = 250.0,
}) {
  Get.bottomSheet(
    isDismissible: true,
    barrierColor: Colors.black26,
    Container(
      height: height,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: widget,
    ),
  );
}
