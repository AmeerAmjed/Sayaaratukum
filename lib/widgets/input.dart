import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/space.dart';

class InputAuth extends StatelessWidget {
  const InputAuth({
    Key? key,
    required this.label,
    this.hintText,
    required this.controller,
    this.validator,
    this.background,
    this.readOnly = false,
    this.maxLines = 1,
    this.onTap,
    this.visibilityPassword = false,
    this.suffixIcon = const Space(),
    this.contentPadding = Constants.spacing16,
    this.margin = const EdgeInsets.symmetric(
      horizontal: Constants.spacing16,
    ),
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final Widget suffixIcon;
  final String label;
  final String? hintText;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final Color? background;
  final bool readOnly;
  final int maxLines;

  final VoidCallback? onTap;
  final TextInputType keyboardType;
  final bool visibilityPassword;
  final EdgeInsets margin;
  final double contentPadding;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background ?? Theme.of(context).cardColor,
      margin: margin,
      child: TextFormField(
        obscureText: visibilityPassword,
        controller: controller,
        readOnly: readOnly,
        maxLines: maxLines,
        onTap: onTap,
        style: Get.textTheme.labelMedium?.copyWith(
          fontSize: 15,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: background ?? Theme.of(context).cardColor,
          hintText: hintText,
          hintStyle: Get.textTheme.labelMedium,
          labelStyle: Get.textTheme.labelMedium,
          suffixIcon: suffixIcon,
          labelText: label,
          contentPadding: EdgeInsets.all(
            contentPadding,
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
