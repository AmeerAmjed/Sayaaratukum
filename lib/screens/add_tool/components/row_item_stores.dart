import 'package:flutter/material.dart';

class RowItemStores extends StatelessWidget {
  const RowItemStores({
    Key? key,
    this.fontSize,
    this.color,
    required this.text,
    required this.style,
    required this.icon,
    required this.iconSize,
    this.paddingHIcon = .0,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final double iconSize;
  final double? fontSize;
  final double paddingHIcon;
  final TextStyle style;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: paddingHIcon,
            ),
            child: Icon(
              icon,
              size: iconSize,
              color: color ?? style.color,
            ),
          ),
          Text(
            text,
            style: style.copyWith(
              fontSize: fontSize,
              color: color ??
                  (style.color)!.withOpacity(
                    0.8,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
