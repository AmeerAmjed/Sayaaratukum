import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/ui/widgets//horizontal_space.dart';

class ListTitleIcon extends StatelessWidget {
  const ListTitleIcon({
    Key? key,
    this.color,
    this.horizontalTrailingPadding = 8,
    this.trailing,
    required this.title,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Color? color;
  final Widget? trailing;
  final double horizontalTrailingPadding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: double.infinity,
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            const HorizontalSpace16(),
            Icon(icon, color: color ?? Get.textTheme.labelMedium?.color),
            const HorizontalSpace8(),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: color,
                    ),
              ),
            ),
            const Spacer(),
            if (trailing != null)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalTrailingPadding,
                ),
                child: trailing!,
              )
          ],
        ),
      ),
    );
  }
}
