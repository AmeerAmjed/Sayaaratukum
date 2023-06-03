import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/controllers/user/my_%20subscribe_store.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/stores/components/item_stores.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/appbars.dart';
import 'package:sayaaratukum/widgets/empty.dart';
import 'package:sayaaratukum/widgets/space.dart';

import '../../widgets/loading.dart';

class MySubscribeStore extends GetView<MySubscribeStoreController> {
  const MySubscribeStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        title: L10n.mySubscribed.tr,
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.onRefresh(),
        child: controller.obx(
            onLoading: const Loading(),
            onEmpty: Empty(
              title: L10n.emptySubscribed.tr,
              description: L10n.noteEmptySubscribed.tr,
              icon: Iconsax.star,
            ), (state) {
          return GetBuilder<MySubscribeStoreController>(builder: (controller) {
            return ListView.separated(
              controller: controller.scroll,
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.spacing16,
              ),
              shrinkWrap: true,
              itemCount: controller.isLoadingMore.value
                  ? state!.length + 1
                  : state!.length,
              separatorBuilder: (context, index) => const Space(
                height: Constants.spacing4,
              ),
              itemBuilder: (context, index) {
                var isLastItem = controller.stateLastItem(index, state.length);
                if (isLastItem) {
                  return const Center(
                    child: Loading(),
                  );
                }
                return ItemStores(
                  item: state[index],
                  onTap: () {
                    controller.onClickStoreCar(state[index]);
                  },
                );
              },
            );
          });
        }),

        // NestedScrollView(
        //   headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        //     return [
        //       SliverPadding(
        //         padding: const EdgeInsets.all(20),
        //         sliver: SliverList(
        //           delegate: SliverChildListDelegate([
        //             GetBuilder<MySubscribeStoreController>(
        //                 builder: (controller) {
        //               return FilterStores(
        //                 typeActive: controller.storeTypeId.value.toTypeStore(),
        //                 onClickShowrooms: () {
        //                   controller.filterStores(StoreType.cars);
        //                 },
        //                 onClickStores: () {
        //                   controller.filterStores(StoreType.tools);
        //                 },
        //               );
        //             })
        //           ]),
        //         ),
        //       )
        //     ];
        //   },
        //   body: controller.obx(
        //       onLoading: const Loading(),
        //       onEmpty: Empty(
        //         title: L10n.emptySubscribed.tr,
        //         description: L10n.noteEmptySubscribed.tr,
        //         icon: Iconsax.star,
        //       ), (state) {
        //     return GetBuilder<MySubscribeStoreController>(
        //         builder: (controller) {
        //       return ListView.separated(
        //         controller: controller.scroll,
        //         padding: const EdgeInsets.symmetric(
        //           horizontal: Constants.spacing16,
        //         ),
        //         shrinkWrap: true,
        //         itemCount: controller.isLoadingMore.value
        //             ? state!.length + 1
        //             : state!.length,
        //         separatorBuilder: (context, index) => const Space(
        //           height: Constants.spacing4,
        //         ),
        //         itemBuilder: (context, index) {
        //           var isLastItem =
        //               controller.stateLastItem(index, state.length);
        //           if (isLastItem) {
        //             return const Center(
        //               child: Loading(),
        //             );
        //           }
        //           return ItemStores(
        //             item: state[index],
        //             onTap: () {
        //               controller.onClickStoreCar(state[index]);
        //             },
        //           );
        //         },
        //       );
        //     });
        //   }),
        // ),
      ),
    );
  }
}
