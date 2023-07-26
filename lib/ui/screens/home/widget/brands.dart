import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/domain/controllers/application.dart';
import 'package:sayaaratukum/domain/controllers/public/brand_pin.dart';
import 'package:sayaaratukum/ui/screens/home/components/brand_item.dart';
import 'package:sayaaratukum/ui/widgets//error.dart';
import 'package:sayaaratukum/ui/widgets//loading.dart';
import 'package:sayaaratukum/ui/widgets//space.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/util/translate.dart';

class Brands extends GetView<BrandPinController> {
  const Brands({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        onLoading: const Loading(),
        onError: (e) => ErrorScreen(
              textError: e.toString(),
              onPressed: () {
                controller.init();
              },
            ), (state) {
      return SizedBox(
        height: state!.isEmpty ? 0 : 100,
        width: Get.width,
        child: ListView.separated(
          // controller: controller.scroll,
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
                  translateWithId(
                    translate: state[index].title,
                    langCode: Application.instance.getLangCode,
                  ),
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
