import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/controllers/public/cars.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/home/components/item_car.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/button_favourite_car.dart';
import 'package:sayaaratukum/widgets/custom_snackbar_login.dart';
import 'package:sayaaratukum/widgets/error.dart';
import 'package:sayaaratukum/widgets/loading.dart';
import 'package:sayaaratukum/widgets/space.dart';

class ItemsCar extends GetView<CarsController> {
  const ItemsCar({Key? key}) : super(key: key);

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
                buttonFavouriteCar: GetBuilder<CarsController>(
                  builder: (controller) {
                    return FavouriteCar(
                      isFavourite: state[index].isFavorite,
                      disableWithShowLoading: state[index].isLoadingFavorite,
                      onPressed: () {
                        if (Application.instance.isLogin) {
                          controller.favoriteCar(state[index]);
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


