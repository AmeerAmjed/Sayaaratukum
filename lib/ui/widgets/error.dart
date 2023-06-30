import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    Key? key,
    required this.textError,
    required this.onPressed,
  }) : super(key: key);

  final String textError;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(textError)),
        IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.cached_rounded),
        )
      ],
    );
  }
}
