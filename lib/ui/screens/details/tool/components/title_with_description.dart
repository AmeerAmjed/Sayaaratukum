import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/ui/theme//color.dart';
import 'package:sayaaratukum/ui/widgets//vertical_space.dart';

class TitleWithDescription extends StatelessWidget {
  const TitleWithDescription({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const VerticalSpace8(),
        Text(
          title,
          style: Get.textTheme.labelSmall?.copyWith(
            color: ColorSystem.colorOptional,
          ),
        ),
        Text(
          description,
          style: Get.textTheme.labelMedium?.copyWith(
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 1,
        ),
      ],
    );
  }
}
