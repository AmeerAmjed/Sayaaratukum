import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/controllers/public/cars.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/screens/home/components/item_car.dart';
import 'package:sayaaratukum/theme/color.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/box.dart';
import 'package:sayaaratukum/widgets/buttons.dart';
import 'package:sayaaratukum/widgets/loading.dart';
import 'package:sayaaratukum/widgets/space.dart';

class ItemsCar extends GetView<CarsController> {
  const ItemsCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(onLoading: const Loading(), (state) {
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
                controller.navigateToDetails(state[index]);
              },
              child: ItemCar(
                car: state[index],
                onPressedFavouriteCar: () {
                  if (Application.instance.isLogin) {
                  } else {
                    controller.showMessage(
                      L10n.loginToAddFavorites.tr,
                      action: TextButton(
                        onPressed: () {
                          Get.toNamed(RouteScreen.login);
                        },
                        child: Text(
                          L10n.login.tr,
                          style: TextStyle(
                            color: ColorSystem.primaryColor[600],
                          ),
                        ),
                      ),
                    );
                  }
                },
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

class FavouriteCar extends StatelessWidget {
  const FavouriteCar({
    Key? key,
    required this.onPressed,
    this.disable = false,
    this.disableWithShowLoading = false,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final bool disable;
  final bool disableWithShowLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Align(
        alignment: Alignment.topRight,
        child: Box(
          size: 40,
          child: Buttons(
            background: Colors.white,
            colorOnButton: Get.theme.primaryColor,
            width: 30,
            height: 30,
            iconSize: 20,
            disableWithShowLoading: disableWithShowLoading,
            disable: disable,
            padding: EdgeInsets.zero,
            onPressed: onPressed,
            icon: Iconsax.heart,
            colorLoading: Get.theme.primaryColor,
            sizeLoading: 15,
          ),
        ),
      ),
    );
  }
}
