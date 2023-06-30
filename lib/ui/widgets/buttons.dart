import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sayaaratukum/ui/widgets//padding_start.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    Key? key,
    this.label,
    this.icon,
    this.iconSize,
    this.colorOnButton,
    this.padding,
    this.iconRow,
    this.background,
    this.onPressed,
    this.colorLoading,
    this.radiusLoading,
    this.height = 56.0,
    this.width = 30.0,
    this.sizeLoading = 30.0,
    this.disableWithShowLoading = false,
    this.disable = false,
    this.fullBackground = true,
    // this.colorIcon = ThemeApp.primaryColor,
  }) : super(key: key);

  final String? label;
  final double height;
  final double width;
  final bool disableWithShowLoading;
  final bool disable;
  final bool fullBackground;
  final Color? background;
  final VoidCallback? onPressed;
  final IconData? icon;
  final double? iconSize;
  final IconData? iconRow;
  final Color? colorOnButton;
  final Color? colorLoading;
  final double sizeLoading;
  final double? radiusLoading;
  final EdgeInsetsGeometry? padding;

  // strokeWidth
  // final Color colorIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding ?? spacingH16(),
      margin: EdgeInsets.zero,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          elevation: MaterialStateProperty.all(0.0),
          backgroundColor: MaterialStateProperty.all(
            fullBackground
                ? (background ??
                    ((disableWithShowLoading || onPressed == null)
                        ? Theme.of(context).primaryColor.withOpacity(0.8)
                        : Theme.of(context).primaryColor))
                : Colors.transparent,
          ),
          overlayColor: background == Colors.transparent
              ? MaterialStateProperty.all<Color>(Colors.black.withOpacity(0.07))
              : null,
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
        onPressed: disable ? null : (disableWithShowLoading ? null : onPressed),
        child: disableWithShowLoading
            ? SizedBox(
                height: sizeLoading,
                width: sizeLoading,
                child: CupertinoActivityIndicator(
                  color: colorLoading ?? Colors.white,
                  radius: radiusLoading ?? 10,
                ),
              )
            : icon != null
                ? Icon(
                    icon,
                    size: iconSize,
                    color: colorOnButton,
                  )
                : iconRow == null
                    ? Text(
                        label!,
                        maxLines: 1,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  color: colorOnButton,
                                ),
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            child: Icon(
                              iconRow,
                              size: iconSize,
                              color: colorOnButton,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              label!,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(color: colorOnButton),
                              maxLines: 1,
                            ),
                          )
                        ],
                      )
        ,
      ),
    );
  }
}
