import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/space.dart';

class DropdownList extends StatelessWidget {
  const DropdownList({
    Key? key,
    this.keyDropdownList,
    required this.items,
    required this.label,
    this.hintText,
    this.margin,
    this.onTap,
    required this.onChanged,
    this.validator,
    this.value,
    this.background,
    this.suffixIcon = const Space(),
  }) : super(key: key);

  final Key? keyDropdownList;
  final List<String> items;
  final Widget suffixIcon;
  final String label;
  final EdgeInsetsGeometry? margin;
  final String? hintText;
  final Color? background;
  final String? Function(String?)? validator;
  final Function(String?) onChanged;
  final VoidCallback? onTap;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background ?? Theme.of(context).cardColor,
      margin: margin ??
          const EdgeInsets.symmetric(
            horizontal: Constants.spacing16,
          ),
      child: DropdownButtonFormField(
        key: keyDropdownList,
        isExpanded: true,
        iconSize: 24,
        value: value,
        validator: validator,
        onTap: onTap,
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          contentPadding: const EdgeInsets.only(
            left: 16.0,
          ),

          border: const OutlineInputBorder(),
          // prefixIcon: Icon(
          //   Icons.location_on_rounded,
          //   color: Colors.grey,
          // ),

          filled: true,
          fillColor: background ?? Theme.of(context).cardColor,
          hintText: hintText,
          hintStyle: Get.textTheme.labelMedium,
          labelStyle: Get.textTheme.labelMedium,
          suffixIcon: suffixIcon,
          labelText: label,
        ),
        dropdownColor: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        onChanged: onChanged,
        items: items
            .map(
              (e) => DropdownMenuItem(
            value: e,
                child: Text(
                  e,
                  style: Get.textTheme.labelMedium,
                ),
              ),
        ).toList(),
      ),
    );
  }
}
