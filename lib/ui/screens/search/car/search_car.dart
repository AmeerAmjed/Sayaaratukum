import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/domain/controllers/public/search/car.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/screens/search/car/components/search_car_bar.dart';
import 'package:sayaaratukum/ui/screens/search/car_by_brand/components/item_search_car.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/ui/widgets//appbars.dart';
import 'package:sayaaratukum/ui/widgets//empty.dart';
import 'package:sayaaratukum/ui/widgets//loading.dart';
import 'package:sayaaratukum/ui/widgets//space.dart';

class SearchCar extends GetView<SearchCarsController> {
  const SearchCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        leading: null,
        actions: [
          const Spacer(),
          Expanded(
            flex: 9,
            child: Container(
              padding: const EdgeInsets.only(top: 6),
              child: SearchCarBar(
                onSubmittedSearch: controller.searchByText,
                onPressedApplyFilter: () {
                  Get.back();
                  controller.init();
                },
              ),
            ),
          ),
        ],
      ),
      body: controller.obx(
          onLoading: const Loading(),
          onEmpty: Empty(
            title: L10n.noResult.tr,
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
