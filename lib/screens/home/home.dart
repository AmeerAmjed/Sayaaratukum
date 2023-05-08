import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/public/brand.dart';
import 'package:sayaaratukum/controllers/public/home.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/screens/home/components/brand_item.dart';
import 'package:sayaaratukum/screens/home/components/search.dart';
import 'package:sayaaratukum/screens/home/components/title_with_view_all.dart';
import 'package:sayaaratukum/screens/home/widget/ads.dart';
import 'package:sayaaratukum/screens/profile/components/add_button.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/loading.dart';
import 'package:sayaaratukum/widgets/space.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
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
          SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: BrandController.instance.obx(onLoading: const Loading(),
                (state) {
              return GetBuilder<BrandController>(builder: (controller) {
                return ListView.separated(
                  controller: BrandController.instance.scroll,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                    horizontal: Constants.spacing16,
                  ),
                  shrinkWrap: true,
                  itemCount: controller.isLoadingMore.value
                      ? state!.length + 1
                      : state!.length,
                  separatorBuilder: (context, index) => const Space(
                    width: Constants.spacing,
                  ),
                  itemBuilder: (context, index) {
                    if (index >= state.length &&
                        controller.isLoadingMore.value) {
                      return const BrandItemLoading(
                        width: 72,
                      );
                    }
                    return InkWell(
                      onTap: () {
                        // TopAdsController.to.onClickItem(state[index].id);
                      },
                      child: BrandItem(
                        item: state[index],
                        width: 72,
                      ),
                    );
                  },
                );
              });
            }),
          ),
          const VerticalSpace12(),
          TitleWithViewAll(
            title: L10n.adsDeals.tr,
          ),
          Ads(
            width: width,
          )
        ],
      ),
      floatingActionButton: AddButton(
        onPressed: () {
          Get.toNamed(RouteScreen.addCar);
        },
      ),
    );
  }
}
