import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/controllers/user/favorite.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/favorite/components/item_favorite.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/empty.dart';
import 'package:sayaaratukum/widgets/error.dart';
import 'package:sayaaratukum/widgets/loading.dart';
import 'package:sayaaratukum/widgets/not_auth.dart';

class FavoriteScreen extends GetView<FavoriteController> {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: controller.obx(
          onLoading: const Loading(),
          onError: (e) {
            if (e == L10n.notAuth) {
              return NotAuthScreen(
                message: L10n.emptyFavorite.tr,
              );
            }
            return ErrorScreen(
              textError: e.toString(),
              onPressed: () {
                controller.init();
              },
            );
          },
          onEmpty: Empty(
            title: L10n.emptyFavorite.tr,
            icon: Iconsax.heart,
          ),
          (state) {
            return GridView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.spacingXMedium,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: size.height * 0.30,
                mainAxisSpacing: Constants.spacingXXSmall,
                crossAxisSpacing: Constants.spacingLarge,
              ),
              scrollDirection: Axis.vertical,
              itemCount: state!.length,
              itemBuilder: (_, index) {
                return InkWell(
                  onTap: () {
                    // controller.onClickItem(state[index].id.toString());
                  },
                  child: ItemFavorite(
                    // height: size.height * 0.30,
                    item: state[index],
                  ),
                );
              },
            );
          }),
    );
  }
}
