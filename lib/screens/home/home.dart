import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/public/brand.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/home/components/brand_item.dart';
import 'package:sayaaratukum/screens/home/components/title_with_view_all.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/loading.dart';
import 'package:sayaaratukum/widgets/space.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ListView(
        children: [
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
        ],
      ),
    );
  }
}
