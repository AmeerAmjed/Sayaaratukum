import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/domain/controllers/public/ads.dart';
import 'package:sayaaratukum/ui/screens/home/components/ads_item.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/ui/widgets//error.dart';
import 'package:sayaaratukum/ui/widgets//loading.dart';
import 'package:sayaaratukum/ui/widgets//space.dart';

class Ads extends GetView<AdsController> {
  const Ads({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: controller.obx(
          onError: (e) => ErrorScreen(
                textError: e.toString(),
                onPressed: () {
                  controller.init();
                },
              ),
          onLoading: const Loading(), (state) {
        return GetBuilder<AdsController>(builder: (controller) {
          return ListView.separated(
            // controller: controller.scroll,
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
              if (index >= state.length && controller.isLoadingMore.value) {
                return const AdsLoading();
              }
              return InkWell(
                onTap: () {
                  controller.onAdsClicked(state[index]);
                },
                child: AdsItem(
                  item: state[index],
                  width: width * 0.9,
                ),
              );
            },
          );
        });
      }),
    );
  }
}
