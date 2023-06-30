import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({
    super.key,
    required this.titles,
    required this.onSelected,
  });

  final List<String> titles;
  final Function(String?) onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: onSelected,
      itemBuilder: (BuildContext context) {
        return titles.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(
              choice.tr,
              style: Get.textTheme.labelMedium,
            ),
          );
        }).toList();
      },
    );
  }
}
