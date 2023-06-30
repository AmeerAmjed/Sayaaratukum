import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultImage extends StatelessWidget {
  const DefaultImage({
    Key? key,
    this.sizeAlphabet,
    required this.name,
  }) : super(key: key);
  final String name;
  final double? sizeAlphabet;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        name.substring(0, 1),
        style: Get.textTheme.titleLarge?.copyWith(
          fontSize: sizeAlphabet,
          color: Get.theme.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
