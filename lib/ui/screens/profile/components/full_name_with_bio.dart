import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/ui/widgets//vertical_space.dart';

class FullNameWithBio extends StatelessWidget {
  const FullNameWithBio({
    Key? key,
    required this.fullName,
    required this.bio,
  }) : super(key: key);

  final String fullName, bio;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            fullName,
            style: Get.textTheme.labelLarge,
          ),
          const VerticalSpace8(),
          Text(
            bio,
            style: Get.textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}
