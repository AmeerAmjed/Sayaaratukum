
import 'package:flutter/material.dart';
import 'package:sayaaratukum/widgets/space.dart';

class AppBars extends StatelessWidget with PreferredSizeWidget {
  const AppBars({
    Key? key,
    this.leading,
    this.leadingWidth,
    this.actions,
    this.title,
    this.widget,
    this.hiddenBackButton = false,
  }) : super(key: key);

  final Widget? leading;
  final List<Widget>? actions;
  final String? title;
  final bool hiddenBackButton;
  final double? leadingWidth;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: AppBar(
        leadingWidth: leadingWidth,
        leading: widget ?? (hiddenBackButton ? const Space() : null),
        title: title != null
            ? Text(
                title!,
                // style: ThemeApp.secondaryXTextStyle,
              )
            : null,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
