import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/widgets/appbars.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class Empty extends StatelessWidget {
  const Empty({
    Key? key,
    required this.title,
    this.description,
    // this.imageAsset = Constant.iconEmptyCart,
    this.showBackButton = false,
  }) : super(key: key);

  // final String imageAsset;
  final String title;
  final String? description;
  final bool showBackButton;

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 1),
        const Icon(
          Iconsax.clipboard_close,
          size: 50,
        ),
        const VerticalSpace24(),
        Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
          ),
        ),
        const VerticalSpace8(),
        if (description != null)
          Center(
            child: Text(
              description!,
              // style: ThemeApp.primaryTextStyle,
            ),
          ),
        const Spacer(flex: 2)
      ],
    );
  }
}
