import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/buttons.dart';
import 'package:sayaaratukum/widgets/fake_app_bar.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const FakeAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpace8(),
          const VerticalSpace16(),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.transparent,
              alignment: Alignment.centerLeft,
              child: Image.asset(
                Constants.welcomeImage,
              ),
            ),
          ),
          const VerticalSpace8(),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.spacing16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    L10n.welcomeTitle.tr,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const VerticalSpace8(),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      L10n.welcomeDoc.tr,
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Constants.spacing16),
            child: Buttons(
              label: L10n.letStart.tr,
              width: double.infinity,
              onPressed: () {
                Get.offAndToNamed(RouteScreen.mainTab);
              },
            ),
          ),
        ],
      ),
    );
  }
}
