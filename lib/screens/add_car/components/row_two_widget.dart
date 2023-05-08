import 'package:flutter/material.dart';
import 'package:sayaaratukum/widgets/horizontal_space.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class RowTwoWidget extends StatelessWidget {
  const RowTwoWidget({
    Key? key,
    required this.leftWidget,
    required this.rightWidget,
  }) : super(key: key);

  final Widget rightWidget;
  final Widget leftWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const VerticalSpace8(),
        Row(
          children: [
            Expanded(
              child: leftWidget,
            ),
            const HorizontalSpace8(),
            Expanded(
              child: rightWidget,
            ),
          ],
        ),
        const VerticalSpace8(),
      ],
    );
  }
}
