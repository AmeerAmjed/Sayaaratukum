import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/theme/color.dart';
import 'package:sayaaratukum/widgets/buttons.dart';
import 'package:sayaaratukum/widgets/horizontal_space.dart';

class HeaderFilterCleaner extends StatelessWidget {
  const HeaderFilterCleaner({
    super.key,
    required this.onPressedClean,
  });

  final VoidCallback onPressedClean;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const HorizontalSpace16(),
        const HorizontalSpace8(),
        Text(
          L10n.filterBy.tr,
          style: Get.textTheme.labelLarge,
        ),
        const Spacer(),
        Buttons(
          height: 40,
          width: 150,
          iconSize: 16,
          colorOnButton: ColorSystem.colorOptional,
          background: Colors.transparent,
          label: L10n.cleanFilter.tr,
          iconRow: Iconsax.filter_remove,
          onPressed: onPressedClean,
        )
      ],
    );
  }
}
