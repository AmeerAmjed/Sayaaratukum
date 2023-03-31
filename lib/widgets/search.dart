import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
    required this.width,
    required this.hintText,
    required this.onSubmitted,
  }) : super(key: key);

  final double width;
  final String hintText;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 4, right: 10),
          width: width,
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
                borderSide: BorderSide(
                  width: 1.0,
                  color: Colors.transparent,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
              ),
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            onSubmitted: onSubmitted,
          ),
        ),
      ],
    );
  }
}
