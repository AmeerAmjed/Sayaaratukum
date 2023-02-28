import 'package:flutter/material.dart';
import 'package:sayaaratukum/util/constant.dart';

class TitleWithViewAll extends StatelessWidget {
  const TitleWithViewAll({
    Key? key,
    required this.title,
    this.onPressed,
    this.color = Colors.black,
  }) : super(key: key);

  final String title;
  final Color color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: Constants.spacingXMedium,
      ).add(
        const EdgeInsets.only(
          top: Constants.spacingMedium,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            // style: ThemeApp.secondaryTextStyle.copyWith(
            //   color: color,
            // ),
          ),
          if (onPressed != null)
            TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(
                foregroundColor: color,
              ), //ripple color
              child: Row(
                children: [
                  Text(
                    "sdf",
                    // style: ThemeApp.primaryTextStyle.copyWith(
                    //   color: color,
                    // ),
                  ),
                  const Icon(Icons.arrow_forward_rounded)
                ],
              ),
            ),
        ],
      ),
    );
  }
}
