import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/controllers/user/user_cars.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/components/add.dart';
import 'package:sayaaratukum/screens/search/car_by_brand/components/item_search_car.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/appbars.dart';
import 'package:sayaaratukum/widgets/bottom_sheet.dart';
import 'package:sayaaratukum/widgets/button_action_bottom_sheet.dart';
import 'package:sayaaratukum/widgets/empty.dart';
import 'package:sayaaratukum/widgets/loading.dart';
import 'package:sayaaratukum/widgets/space.dart';

class UserCars extends GetView<UserCarsController> {
  const UserCars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        title: L10n.myCars.tr,
      ),
      body: RefreshIndicator(
          onRefresh: controller.onRefresh,
          child: ListView(
            children: [
              controller.obx(
                  onLoading: const Loading(),
                  onEmpty: Empty(
                    title: L10n.notAddCarYet.tr,
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
                      onClickUserCar(state[index].id, controller);
                    },
                    onPressedFavouriteCar: () {},
                  );
                },
              );
            }),
          ],
        ),
      ),
      floatingActionButton: const AddItemToBuy(),
    );
  }
}

onClickUserCar(int id, BaseController controller) {
  bottomSheet(
    height: 200,
    widget: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonActionBottomSheet(
          title: L10n.car.tr,
          icon: Iconsax.car,
          onPressed: () {
            controller.carDetails(id);
            Get.back();
          },
          paddingVertical: 4,
        ),
        ButtonActionBottomSheet(
          title: L10n.updateCar.tr,
          icon: Iconsax.edit,
          onPressed: () {
            controller.carDetails(id);
            Get.back();
          },
          paddingVertical: 4,
        ),
      ],
    ),
  );
}