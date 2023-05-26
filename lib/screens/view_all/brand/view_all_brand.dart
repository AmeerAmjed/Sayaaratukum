import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/controllers/public/brand.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/appbars.dart';
import 'package:sayaaratukum/widgets/empty.dart';
import 'package:sayaaratukum/widgets/image_loading.dart';
import 'package:sayaaratukum/widgets/loading.dart';

class ViewAllBrand extends GetView<BrandController> {
  const ViewAllBrand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        title: L10n.brands.tr,
      ),
      body: controller.obx(
          onLoading: const Loading(),
          onEmpty: Empty(
            title: L10n.empty.tr,
            icon: Iconsax.clipboard_close,
          ), (state) {
        return GridView.builder(
          controller: controller.scroll,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.spacing16,
          ),
          shrinkWrap: true,
          itemCount: controller.isLoadingMore.value
              ? state!.length + 1
              : state!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: Constants.spacing8,
            crossAxisSpacing: Constants.spacing8,
          ),
          itemBuilder: (context, index) {
            var isLastItem = controller.stateLastItem(index, state.length);
            if (isLastItem) {
              return const Center(
                child: Loading(),
              );
            }
            return InkWell(
              onTap: () {
                // controller.navigateToDetails(state[index]);
                // TopAdsController.to.onClickItem(state[index].id);
              },
              child: Card(
                child: ImageLoading(
                  fitImage: BoxFit.fill,
                  imageUrl: state[index].imageUrl,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
