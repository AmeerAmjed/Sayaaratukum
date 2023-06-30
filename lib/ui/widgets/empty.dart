import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/ui/widgets//appbars.dart';
import 'package:sayaaratukum/ui/widgets//vertical_space.dart';

class Empty extends StatelessWidget {
  const Empty({
    Key? key,
    required this.title,
    this.description,
    this.height,
    required this.icon,
    this.showBackButton = false,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final String? description;
  final bool showBackButton;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return showBackButton
        ? Scaffold(
            appBar: const AppBars(
                // leading: BackButtonAppBar(),
                ),
            body: screen(),
          )
        : screen();
  }

  Widget screen() {
    return Container(
      // color: Colors.red,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 1),
          Icon(
            icon,
            size: 50,
            color: Get.textTheme.labelMedium?.color,
          ),
          const VerticalSpace24(),
          Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Get.textTheme.labelLarge,
            ),
          ),
          const VerticalSpace8(),
          if (description != null)
            Center(
              child: Text(
                description!,
                style: Get.textTheme.labelSmall,
              ),
            ),
          const Spacer(flex: 2)
        ],
      ),
    );
  }
}
