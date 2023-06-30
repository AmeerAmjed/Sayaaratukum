import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/ui/widgets//buttons.dart';
import 'package:sayaaratukum/ui/widgets//horizontal_space.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
    this.controller,
    this.suffixIcon,
    this.onChanged,
    required this.hintText,
    required this.onSubmitted,
    required this.onPressedFilter,
  }) : super(key: key);

  final String hintText;
  final Widget? suffixIcon;
  final VoidCallback onPressedFilter;
  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              onChanged: onChanged,
              controller: controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: Get.theme.cardTheme.color,
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 18.0,
                ),
                prefixIcon: const Icon(
                  Icons.search_outlined,
                  size: 32.0,
                ),
                suffixIcon: suffixIcon,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4.0),
                  ),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Get.theme.primaryColor,
                    width: 1.0,
                  ),
                ),
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              onSubmitted: onSubmitted,
            ),
          ),
          const HorizontalSpace8(),
          Buttons(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            width: 80,
            height: 45,
            icon: Iconsax.filter,
            onPressed: onPressedFilter,
            background: Get.theme.primaryColor,
          )
        ],
      ),
    );
  }
}
