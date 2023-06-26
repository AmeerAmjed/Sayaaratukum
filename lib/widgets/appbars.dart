
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/widgets/space.dart';

class AppBars extends StatelessWidget with PreferredSizeWidget {
  const AppBars({
    Key? key,
    this.leading,
    this.leadingWidth,
    this.actions,
    this.title,
    this.widget,
    this.widgetAction,
    this.hiddenBackButton = false,
  }) : super(key: key);

  final Widget? leading;
  final List<Widget>? actions;
  final String? title;
  final bool hiddenBackButton;
  final double? leadingWidth;
  final Widget? widget;
  final Widget? widgetAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        leadingWidth: leadingWidth,
        leading: widget ?? (hiddenBackButton ? const Space() : null),
        title: title != null
            ? Text(
          title!,
                style: Get.textTheme.labelLarge,
              )
            : (widgetAction),
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
