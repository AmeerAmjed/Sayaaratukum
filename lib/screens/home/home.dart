import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/public/cars.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/screens/components/add.dart';
import 'package:sayaaratukum/screens/home/components/title_with_view_all.dart';
import 'package:sayaaratukum/screens/home/widget/ads.dart';
import 'package:sayaaratukum/screens/home/widget/brands.dart';
import 'package:sayaaratukum/screens/home/widget/cars.dart';
import 'package:sayaaratukum/screens/search/car/components/search_car_bar.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class HomeScreen extends GetView<CarsController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    const duration = Duration(milliseconds: 300);
    return Scaffold(
      body: Container(
        child: RefreshIndicator(
          onRefresh: controller.onHomeRefresh,
          child: SingleChildScrollView(
            controller: CarsController.instance.scroll,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const VerticalSpace16(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SearchCarBar(
                    onSubmittedSearch: (value) {
                      Get.back();
                      controller.navigateTo(RouteScreen.searchCar);
                    },
                    onPressedApplyFilter: () {
                      Get.back();
                      controller.navigateTo(RouteScreen.searchCar);
                    },
                  ),
                ),
                const VerticalSpace8(),
                TitleWithViewAll(
                  title: L10n.brands.tr,
                  onPressed: () {
                    Get.toNamed(RouteScreen.viewAllBrand);
                  },
                ),
                Brands(),
                const VerticalSpace12(),
                TitleWithViewAll(
                  title: L10n.adsDeals.tr,
                ),
                Ads(
                  width: width,
                ),
                const VerticalSpace16(),
                TitleWithViewAll(
                  title: L10n.recommended.tr,
                  // onPressed: () {},
                ),
                const VerticalSpace4(),
                const ItemsCar(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Obx(() {
        return AnimatedSlide(
          duration: duration,
          offset: controller.showFab.value ? Offset.zero : const Offset(0, 2),
          child: AnimatedOpacity(
            duration: duration,
            opacity: controller.showFab.value ? 1 : 0,
            child: const AddItemToBuy(),
          ),
        );
      }),
    );
  }
}
