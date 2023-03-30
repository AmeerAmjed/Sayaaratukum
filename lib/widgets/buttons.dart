import 'package:flutter/material.dart';
import 'package:sayaaratukum/widgets/padding_start.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    Key? key,
    this.label,
    this.icon,
    this.background,
    this.onPressed,
    this.height = 56.0,
    this.width = 30.0,
    this.disable = false,
    this.fullBackground = true,
    // this.colorIcon = ThemeApp.primaryColor,
  }) : super(key: key);

  final String? label;
  final double height;
  final double width;
  final bool disable;
  final bool fullBackground;
  final Color? background;
  final VoidCallback? onPressed;
  final IconData? icon;

  // final Color colorIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: spacingH16(),
      margin: EdgeInsets.zero,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          elevation: MaterialStateProperty.all(0.0),
          backgroundColor: MaterialStateProperty.all(
            fullBackground
                ? (background ??
                    ((disable || onPressed == null)
                        ? Theme.of(context).primaryColor.withOpacity(0.8)
                        : Theme.of(context).primaryColor))
                : Colors.transparent,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(
                Radius.circular(4.0),
              ),
              side: fullBackground
                  ? const BorderSide(color: Colors.transparent)
                  : BorderSide(
                      color: Theme.of(context).primaryColor,
                      width: 1,
                      style: BorderStyle.solid,
                    ),
            ),
          ),
        ),
        onPressed: disable ? null : onPressed,
        child: icon == null
            ? disable
                ? const SizedBox(
                    height: 30.0,
                    width: 30.0,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Text(
          label!,
                    style: Theme.of(context).textTheme.displayMedium,
                  )
            : Icon(
                icon,
                // color: colorIcon,
              ),
      ),
    );
  }
}