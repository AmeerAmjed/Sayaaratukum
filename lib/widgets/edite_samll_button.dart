import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/widgets/box.dart';
import 'package:sayaaratukum/widgets/buttons.dart';

class EditeSmallButton extends StatelessWidget {
  const EditeSmallButton({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Align(
        alignment: Alignment.topRight,
        child: Box(
          size: 40,
          child: Buttons(
            background: Colors.white,
            colorOnButton: Get.theme.primaryColor,
            width: 30,
            height: 30,
            iconSize: 20,
            padding: EdgeInsets.zero,
            onPressed: onPressed,
            icon: Iconsax.edit,
            sizeLoading: 15,
          ),
        ),
      ),
    );
  }
}
