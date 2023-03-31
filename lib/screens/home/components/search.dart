import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/widgets/buttons.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
    required this.hintText,
    required this.onSubmitted,
    required this.onPressedFilter,
  }) : super(key: key);

  final String hintText;
  final VoidCallback onPressedFilter;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(top: 4, right: 10),
            child: TextField(
              onChanged: (value) {},
              decoration: InputDecoration(
                filled: true,
                fillColor: Get.theme.cardColor,
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.subtitle1,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 15.0,
                ),
                prefixIcon: const Icon(
                  Icons.search_outlined,
                  size: 32.0,
                ),
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
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1.0,
                  ),
                ),
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              onSubmitted: onSubmitted,
            ),
          ),
        ),
        Buttons(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          width: 80,
          height: 50,
          icon: Iconsax.filter,
          onPressed: onPressedFilter,
          background: Get.theme.primaryColor,
        )
      ],
    );
  }
}
