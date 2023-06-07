import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sayaaratukum/util/constant.dart';

class InputAuth extends StatelessWidget {
  const InputAuth({
    Key? key,
    required this.label,
    this.hintText,
    this.prefixIcon,
    required this.controller,
    this.validator,
    this.onChanged,
    this.background,
    this.inputFormatters,
    this.readOnly = false,
    this.maxLines = 1,
    this.onTap,
    this.onFieldSubmitted,
    this.visibilityPassword = false,
    this.suffixIcon,
    this.contentPadding = Constants.spacing16,
    this.margin = const EdgeInsets.symmetric(
      horizontal: Constants.spacing16,
    ),
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final Widget? suffixIcon;
  final IconData? prefixIcon;
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
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: background ?? Theme.of(context).cardColor,
      margin: margin,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: visibilityPassword,
        controller: controller,
        readOnly: readOnly,
        maxLines: maxLines,
        onFieldSubmitted: onFieldSubmitted,
        onTap: onTap,
        style: Get.textTheme.labelMedium?.copyWith(
          fontSize: 15,
        ),
        inputFormatters: inputFormatters,
        onChanged: onChanged,
        decoration: InputDecoration(
          filled: true,
          alignLabelWithHint: true,
          fillColor: background ?? Theme.of(context).cardColor,
          // hintText: hintText,
          hintStyle: Get.textTheme.labelMedium,
          labelStyle: Get.textTheme.labelMedium,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
          labelText: label,
          floatingLabelAlignment: FloatingLabelAlignment.start,
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
