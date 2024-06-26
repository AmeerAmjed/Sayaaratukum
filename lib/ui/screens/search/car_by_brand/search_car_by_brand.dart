import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/domain/controllers/public/search_car_by_brand.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/screens/search/car_by_brand/components/item_search_car.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/ui/widgets//appbars.dart';
import 'package:sayaaratukum/ui/widgets//empty.dart';
import 'package:sayaaratukum/ui/widgets//loading.dart';
import 'package:sayaaratukum/ui/widgets//space.dart';

class SearchCarByBrand extends GetView<SearchCarByBrandController> {
  const SearchCarByBrand({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        title: controller.nameBrand,
      ),
      body: controller.obx(
          onLoading: const Loading(),
          onEmpty: Empty(
            title: L10n.empty.tr,
            icon: Iconsax.clipboard_close,
          ), (state) {
        return ListView.separated(
          controller: controller.scroll,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.spacing16,
            vertical: Constants.spacing8,
          ),
          shrinkWrap: true,
          itemCount: controller.isLoadingMore.value
              ? state!.length + 1
              : state!.length,
          separatorBuilder: (context, index) => const Space(
            height: Constants.spacing8,
          ),
          itemBuilder: (context, index) {
            if (index >= state.length && controller.isLoadingMore.value) {
              return const Loading();
            }

            return ItemSearchCar(
              car: state[index],
              onPressedItem: () {
                controller.carDetails(state[index].id);
              },
              onPressedFavouriteCar: () {},
            );
          },
        );
      }),
    );
  }
}
