import 'package:flutter/material.dart';
import 'package:sayaaratukum/util/constant.dart';

class Box extends StatelessWidget {
  const Box({
    Key? key,
    this.height,
    this.width,
    this.size,
    required this.child,
  }) : super(key: key);

  final double? size;
  final double? height;
  final double? width;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? size,
      height: height ?? size,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          Constants.radiusSmall,
        ),
      ),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: child,
      ),
    );
  }
}
