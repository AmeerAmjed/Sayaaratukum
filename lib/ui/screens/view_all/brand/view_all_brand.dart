import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/domain/controllers/application.dart';
import 'package:sayaaratukum/domain/controllers/public/brand.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/widgets//appbars.dart';
import 'package:sayaaratukum/ui/widgets//empty.dart';
import 'package:sayaaratukum/ui/widgets//image_loading.dart';
import 'package:sayaaratukum/ui/widgets//loading.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/util/translate.dart';

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
            crossAxisCount: 3,
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
                controller.onBrandClicked(
                  state[index].id.toString(),
                  translateWithId(
                    translate: state[index].title,
                    langCode: Application.instance.getLangCode,
                  ),
                );
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
