import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonSlideImage extends StatelessWidget {
  const ButtonSlideImage({
    Key? key,
    required this.icon,
    this.backgroundColor = Colors.white,
    this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final Color backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: .0,
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      mini: true,
      child: Icon(
        icon,
        color: Get.theme.primaryColor,
      ),
    );
  }
}
