import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:sayaaratukum/l10n/lang.dart';

class ReadMore extends StatelessWidget {
  const ReadMore({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimLines: 3,
      trimMode: TrimMode.Line,
      trimCollapsedText: L10n.showMore.tr,
      trimExpandedText: L10n.showLess.tr,
      style: Get.textTheme.labelMedium,
    );
  }
}
