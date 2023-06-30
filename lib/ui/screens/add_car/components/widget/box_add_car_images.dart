import 'package:flutter/material.dart';
import 'package:sayaaratukum/util/constant.dart';

class BoxAddCarImages extends StatelessWidget {
  const BoxAddCarImages({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: Constants.spacing16,
      ),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(4),
        border: const Border.fromBorderSide(
          BorderSide(
            color: Colors.black,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
      ),
      child: child,
    );
  }
}
