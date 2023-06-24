import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/widgets/box.dart';
import 'package:sayaaratukum/widgets/buttons.dart';

class FavouriteCar extends StatelessWidget {
  const FavouriteCar({
    Key? key,
    this.colorBackground,
    required this.onPressed,
    this.disable = false,
    this.isFavourite = false,
    this.disableWithShowLoading = false,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final bool disable;
  final bool isFavourite;
  final Color? colorBackground;
  final bool disableWithShowLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Align(
        alignment: Alignment.topRight,
        child: Box(
          size: 40,
          child: Buttons(
            background: colorBackground ?? Get.theme.cardColor,
            colorOnButton: Get.theme.primaryColor,
            width: 30,
            height: 30,
            iconSize: 20,
            disableWithShowLoading: disableWithShowLoading,
            disable: disable,
            padding: EdgeInsets.zero,
            onPressed: onPressed,
            icon: isFavourite ? Iconsax.heart5 : Iconsax.heart,
            colorLoading: Get.theme.primaryColor,
            sizeLoading: 15,
          ),
        ),
      ),
    );
  }
}
