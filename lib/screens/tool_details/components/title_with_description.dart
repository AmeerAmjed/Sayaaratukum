import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: Get.textTheme.labelSmall,
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
