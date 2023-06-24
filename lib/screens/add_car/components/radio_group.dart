import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RadioGroup extends StatelessWidget {
  const RadioGroup({
    Key? key,
    required this.label,
    required this.spacingTitle,
    required this.titleOption1,
    required this.valueOption1,
    required this.titleOption2,
    required this.valueOption2,
    required this.onChanged,
    required this.value,
  }) : super(key: key);

  final String label;
  final double spacingTitle;
  final String titleOption1;
  final String valueOption1;
  final String titleOption2;
  final String valueOption2;
  final Function(Object?)? onChanged;
  final Object value;

  @override
  Widget build(BuildContext context) {
    final styleTextOption = Get.textTheme.labelMedium?.copyWith(
      fontWeight: FontWeight.w600,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Get.textTheme.labelMedium,
            ),
            Row(
              children: [
                Flexible(
                  child: RadioListTile(
                    title: Text(
                      titleOption1,
                      style: styleTextOption,
                      maxLines: 1,
                    ),
                    value: valueOption1,
                    contentPadding: const EdgeInsets.all(0),
                    dense: true,
                    groupValue: value,
                    onChanged: onChanged,
                  ),
                ),
                Flexible(
                  child: RadioListTile(
                    enableFeedback: false,
                    title: Text(
                      titleOption2,
                      style: styleTextOption,
                    ),
                    value: valueOption2,
                    contentPadding: const EdgeInsets.all(0),
                    dense: true,
                    groupValue: value,
                    onChanged: onChanged,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
