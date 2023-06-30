import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.label,
  }) : super(key: key);

  final VoidCallback onPressed;
  final IconData icon;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      onPressed: onPressed,
      label: Text(
        label ?? "",
        style: Get.textTheme.displayMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      icon: Icon(icon),
    );
  }
}
