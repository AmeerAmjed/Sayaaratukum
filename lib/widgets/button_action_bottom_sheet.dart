import 'package:flutter/material.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/horizontal_space.dart';

class ButtonActionBottomSheet extends StatelessWidget {
  const ButtonActionBottomSheet({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(
          Constants.spacingXMedium,
        ),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.black.withOpacity(0.1),
          ),
          const HorizontalSpace8(),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Tajawal',
              color: Colors.black,
              // fontSize: Constants.spacingMedium,
              fontWeight: FontWeight.w800,
            ),
          )
        ],
      ),
    );
  }
}
