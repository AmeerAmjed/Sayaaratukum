import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/ui/widgets//horizontal_space.dart';

class ButtonActionBottomSheet extends StatelessWidget {
  const ButtonActionBottomSheet({
    Key? key,
    required this.title,
    this.icon,
    this.localIcon,
    this.textIcon,
    this.color,
    this.paddingVertical = Constants.spacingXMedium,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final IconData? icon;
  final String? localIcon;
  final String? textIcon;
  final double paddingVertical;
  final VoidCallback onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: paddingVertical,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          if (textIcon != null)
            Text(
              textIcon!,
              style: Get.textTheme.labelMedium?.copyWith(color: color),
            ),
          if (localIcon != null)
            SizedBox(width: 30, child: Image.asset(localIcon!)),
          if (icon != null)
            Icon(
              icon,
              color:
                  (color ?? Get.textTheme.labelMedium?.color)?.withOpacity(0.3),
            ),
          const HorizontalSpace8(),
          Text(
            title,
            style: Get.textTheme.labelMedium?.copyWith(color: color),
          )
        ],
      ),
    );
  }
}
