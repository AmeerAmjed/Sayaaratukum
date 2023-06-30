import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/util/constant.dart';

class TitleWithViewAll extends StatelessWidget {
  const TitleWithViewAll({
    Key? key,
    required this.title,
    this.onPressed,
    this.paddingH = Constants.spacing16,
    this.color = Colors.black,
  }) : super(key: key);

  final String title;
  final Color color;
  final double paddingH;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: paddingH,
      )

      //     .add(
      //   const EdgeInsets.only(
      //     top: Constants.spacing16,
      //   ),
      // )
      ,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          if (onPressed != null)
            TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                foregroundColor: color,
              ), //ripple color
              child: Text(
                L10n.viewAll.tr,
                style: Theme.of(context).textTheme.caption?.copyWith(
                      color: Get.textTheme.labelMedium?.color,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}
