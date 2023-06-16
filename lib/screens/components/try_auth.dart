import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/buttons.dart';

import '../../controllers/main_tab.dart';

class TryAuth extends StatelessWidget {
  const TryAuth({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 92,
          color: Theme.of(context).primaryColor,
          padding: const EdgeInsets.all(
            Constants.spacingSmall,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Buttons(
                  label: L10n.login.tr,
                  onPressed: () {
                    MainTabController.instance.resetRoute();
                    Get.toNamed(RouteScreen.login);
                  },
                ),
              ),
              const VerticalDivider(
                thickness: 1.0,
                indent: 30.0,
                endIndent: 30.0,
                color: Colors.white,
              ),
              Expanded(
                child: Buttons(
                  label: L10n.register.tr,
                  onPressed: () {
                    MainTabController.instance.resetRoute();
                    Get.toNamed(RouteScreen.register);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
