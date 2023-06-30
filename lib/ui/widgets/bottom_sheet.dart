import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/ui/widgets//vertical_space.dart';

import 'buttons.dart';

bottomSheet({
  required Widget widget,
  Buttons? buttonAction,
  double height = 250.0,
}) {
  Get.bottomSheet(
    isDismissible: true,
    barrierColor: Colors.black26,
    isScrollControlled: true,
    Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Get.theme.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        // mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _dividerWidget(),
          widget,
          Spacer(),
          if (buttonAction != null) buttonAction,
          const VerticalSpace16(),
        ],
      ),
    ),
  );
}

Widget _dividerWidget() {
  return FractionallySizedBox(
    widthFactor: 0.2,
    child: Container(
      margin: const EdgeInsets.symmetric(
        vertical: 12.0,
      ),
      child: Container(
        height: 5.0,
        decoration: const BoxDecoration(
          color: Color(0xffd0d4dd),
          borderRadius: BorderRadius.all(Radius.circular(2.5)),
        ),
      ),
    ),
  );
}