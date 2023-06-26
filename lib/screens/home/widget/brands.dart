import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/public/brand_pin.dart';
import 'package:sayaaratukum/screens/home/components/brand_item.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/loading.dart';
import 'package:sayaaratukum/widgets/space.dart';

class Brands extends GetView<BrandPinController> {
  const Brands({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(onLoading: const Loading(), (state) {
      return SizedBox(
        height: state!.isEmpty ? 0 : 100,
        width: Get.width,
        child: ListView.separated(
          controller: controller.scroll,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.spacing16,
          ),
          shrinkWrap: true,
          itemCount:
              controller.isLoadingMore.value ? state.length + 1 : state.length,
          separatorBuilder: (context, index) => const Space(
            width: Constants.spacing,
          ),
          itemBuilder: (context, index) {
            if (index >= state.length && controller.isLoadingMore.value) {
              return const BrandItemLoading(
                width: 72,
              );
            }
            return InkWell(
              onTap: () {
                controller.onBrandClicked(
                  state[index].id.toString(),
                  state[index].title,
                );
              },
              child: BrandItem(
                item: state[index],
                width: 52,
              ),
            );
          },
        ),
      );
    });
  }
}
