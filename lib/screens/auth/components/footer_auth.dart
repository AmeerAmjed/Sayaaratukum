import 'package:flutter/material.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    Key? key,
    required this.label,
    required this.action,
  }) : super(key: key);

  final String label;
  final String action;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: label,
        children: [
          TextSpan(
            text: " $action",
            style: const TextStyle(
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
