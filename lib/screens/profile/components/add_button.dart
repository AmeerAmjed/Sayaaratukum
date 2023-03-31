import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      onPressed: onPressed,
      child: const Icon(
        Iconsax.add,
      ),
    );
  }
}
