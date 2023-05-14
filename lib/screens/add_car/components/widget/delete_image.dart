import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sayaaratukum/widgets/box.dart';
import 'package:sayaaratukum/widgets/buttons.dart';

class DeleteImageCar extends StatelessWidget {
  const DeleteImageCar({
    Key? key,
    required this.onPressed,
    this.disable = false,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final bool disable;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Align(
        alignment: Alignment.topRight,
        child: Box(
          size: 30,
          child: Buttons(
            background: Colors.black54,
            width: 30,
            height: 30,
            iconSize: 15,
            disable: disable,
            padding: EdgeInsets.zero,
            onPressed: onPressed,
            icon: CupertinoIcons.delete_simple,
          ),
        ),
      ),
    );
  }
}
