import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/widgets//box.dart';

class ButtonSeeAll extends StatelessWidget {
  const ButtonSeeAll({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Box(
          size: 32,
          width: 100,
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.only(top: 7),
              margin: EdgeInsets.zero,
              child: Text(
                L10n.allNotificationIsRead.tr,
                style: TextStyle(
                  fontSize: 10,
                  color: Get.theme.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )),
    );
  }
}
