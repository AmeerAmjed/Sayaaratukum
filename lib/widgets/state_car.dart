import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/util/constant.dart';

class StateCar extends StatelessWidget {
  const StateCar({
    Key? key,
    this.background,
    // required this.state,
  }) : super(key: key);

  // final int state;
  final Color? background;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 4,
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: background ?? Get.theme.backgroundColor,
        borderRadius: BorderRadius.circular(
          Constants.radiusSmall,
        ),
      ),
      child: Text(
        L10n.available.tr,
        style: Get.textTheme.labelMedium?.copyWith(
          overflow: TextOverflow.ellipsis,
        ),
        maxLines: 1,
      ),
    );
  }
}
