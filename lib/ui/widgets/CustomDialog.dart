import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/theme//color.dart';
import 'package:sayaaratukum/ui/widgets//buttons.dart';

showCustomDialog(
  String title, {
  String? message,
  bool isDanger = false,
  String? labelButtonAction,
  VoidCallback? onPressedAction,
  VoidCallback? onCancel,
  String? titleCancel,
}) {
  Get.dialog(
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            decoration: BoxDecoration(
              color: Get.theme.backgroundColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Material(
                color: Get.theme.backgroundColor,
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      title,
                      style: Get.textTheme.labelLarge?.copyWith(
                        color: isDanger ? ColorSystem.colorDanger : null,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 15),
                    if (message != null)
                      Text(
                        message,
                        style: Get.textTheme.labelMedium,
                        textAlign: TextAlign.center,
                      ),
                    const SizedBox(height: 20),
                    //Buttons
                    Row(
                      children: [
                        Expanded(
                          child: Buttons(
                            height: 45,
                            label: L10n.cancel.tr,
                            padding: EdgeInsets.zero,
                            background: Colors.white,
                            colorOnButton: Colors.grey,
                            onPressed: () {
                              onCancel ?? Get.back();
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Buttons(
                            height: 45,
                            label: labelButtonAction ?? L10n.yes.tr,
                            padding: EdgeInsets.zero,
                            background:
                                isDanger ? ColorSystem.colorDanger : null,
                            onPressed: onPressedAction,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
