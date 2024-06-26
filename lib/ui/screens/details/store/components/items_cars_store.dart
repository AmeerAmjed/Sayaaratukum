import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/domain/controllers/application.dart';
import 'package:sayaaratukum/domain/controllers/public/cars.dart';
import 'package:sayaaratukum/domain/controllers/public/store/store_car_details.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/screens/details/user_cars/user_cars.dart';
import 'package:sayaaratukum/ui/screens/home/components/item_car.dart';
import 'package:sayaaratukum/ui/widgets//button_favourite_car.dart';
import 'package:sayaaratukum/ui/widgets//custom_snackbar_login.dart';
import 'package:sayaaratukum/ui/widgets//loading.dart';
import 'package:sayaaratukum/ui/widgets//space.dart';
import 'package:sayaaratukum/util/constant.dart';

import '../../../../widgets/empty.dart';

class ItemCarsStore extends GetView<StoreCarDetailsController> {
  const ItemCarsStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return controller.obx(
        onLoading: const Loading(),
        onEmpty: Empty(
          title: L10n.empty.tr,
          icon: Iconsax.clipboard_close,
          height: height - 300,
        ), (state) {
      return GetBuilder<CarsController>(builder: (controller) {
        return ListView.separated(
          controller: ScrollController(),
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.spacing16,
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
              return const _ItemLoadingCar();
            }
            return InkWell(
              onTap: () {
                controller.carDetails(state[index].id);
              },
              child: ItemCar(
                car: state[index],
                buttonFavouriteCar: GetBuilder<StoreCarDetailsController>(
                  builder: (controller) {
                    var storeIdUser =
                        Application.instance.user!.value!.myStoreId;
                    var isOwnerCar = state[index].owner.id == storeIdUser;
                    return FavouriteCar(
                      isFavourite: state[index].isFavorite,
                      disableWithShowLoading: state[index].isLoadingFavorite,
                      icon: isOwnerCar ? Iconsax.more : null,
                      onPressed: () {
                        if (Application.instance.isLogin) {
                          if (isOwnerCar) {
                            onClickUserCar(state[index].id, controller);
                          } else {
                            controller.favoriteCar(state[index]);
                          }
                        } else {
                          snackBarToLogin(L10n.loginToAddFavorites.tr);
                        }
                      },
                    );
                  },
                ),
              ),
            );
          },
        );
      });
    });
  }
}

class _ItemLoadingCar extends StatelessWidget {
  const _ItemLoadingCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: Loading(),
      ),
    );
  }
}
