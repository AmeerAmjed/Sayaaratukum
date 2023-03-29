import 'package:flutter/material.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/space.dart';

class InputAuth extends StatelessWidget {
  const InputAuth({
    Key? key,
    required this.label,
    this.hintText,
    required this.controller,
    required this.keyboardType,
    this.validator,
    this.background,
    this.visibilityPassword = false,
    this.suffixIcon = const Space(),
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);

  final Widget suffixIcon;
  final String label;
  final String? hintText;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final Color? background;
  final TextInputType keyboardType;
  final bool visibilityPassword;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background ?? Theme.of(context).cardColor,
      margin: const EdgeInsets.symmetric(
        horizontal: Constants.spacing16,
      ),
      child: TextFormField(
        obscureText: visibilityPassword,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: background ?? Theme.of(context).cardColor,
          hintText: hintText,
          suffixIcon: suffixIcon,
          labelText: label,
          contentPadding: const EdgeInsets.all(
            Constants.spacing16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            // borderSide: BorderSide.,
          ),
        ),
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        validator: validator,
      ),
    );
  }
}
