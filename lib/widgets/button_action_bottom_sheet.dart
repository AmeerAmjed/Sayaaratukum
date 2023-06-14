import 'package:flutter/material.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/horizontal_space.dart';

class ButtonActionBottomSheet extends StatelessWidget {
  const ButtonActionBottomSheet({
    Key? key,
    required this.title,
    this.icon,
    this.localIcon,
    this.paddingVertical = Constants.spacingXMedium,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final IconData? icon;
  final String? localIcon;
  final double paddingVertical;
  final VoidCallback onPressed;

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
          if (localIcon != null)
            SizedBox(width: 30, child: Image.asset(localIcon!)),
          if (icon != null)
            Icon(
              icon,
              color: Colors.black.withOpacity(0.1),
            ),
          const HorizontalSpace8(),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              // fontSize: Constants.spacingMedium,
              // fontWeight: FontWeight.w800,
            ),
          )
        ],
      ),
    );
  }
}
