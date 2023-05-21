import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/controllers/public/cars.dart';
import 'package:sayaaratukum/controllers/public/home.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/screens/home/components/search.dart';
import 'package:sayaaratukum/screens/home/components/title_with_view_all.dart';
import 'package:sayaaratukum/screens/home/widget/ads.dart';
import 'package:sayaaratukum/screens/home/widget/brands.dart';
import 'package:sayaaratukum/screens/home/widget/cars.dart';
import 'package:sayaaratukum/screens/profile/components/add_button.dart';
import 'package:sayaaratukum/widgets/space.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          controller: CarsController.instance.scroll,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const VerticalSpace16(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SearchBox(
                  hintText: L10n.searchCar.tr,
                  onSubmitted: (text) {},
                  onPressedFilter: () {},
                ),
              ),
              const VerticalSpace8(),
              TitleWithViewAll(
                title: L10n.brands.tr,
                onPressed: () {},
              ),
              Brands(),
              const VerticalSpace12(),
              TitleWithViewAll(
                title: L10n.adsDeals.tr,
              ),
              Ads(
                width: width,
              ),
              const VerticalSpace12(),
              TitleWithViewAll(
                title: L10n.recommended.tr,
                // onPressed: () {},
              ),
              const ItemsCar(),
            ],
          ),
        ),
      ),
      floatingActionButton: GetBuilder<Application>(
        builder: (c) {
          return Application.instance.isLogin
              ? AddButton(
                  onPressed: () => Get.toNamed(RouteScreen.addCar),
                )
              : const Space();
        },
      ),
    );
  }
}
