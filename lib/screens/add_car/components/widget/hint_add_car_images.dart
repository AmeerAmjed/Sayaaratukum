import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class HintAddCarImages extends StatelessWidget {
  const HintAddCarImages({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Iconsax.gallery_add,
          size: 30,
        ),
        const VerticalSpace8(),
        Text(title)
      ],
    );
  }
}
