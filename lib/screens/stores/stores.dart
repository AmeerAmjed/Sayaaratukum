import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/controllers/public/stores.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/stores/components/filtter_store.dart';
import 'package:sayaaratukum/screens/stores/components/item_stores.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/empty.dart';
import 'package:sayaaratukum/widgets/error.dart';
import 'package:sayaaratukum/widgets/space.dart';

import '../../util/store_type.dart';
import '../../widgets/loading.dart';

class StoresScreen extends GetView<StoresController> {
  const StoresScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => controller.onRefresh(),
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    GetBuilder<StoresController>(builder: (controller) {
                      return FilterStores(
                        typeActive: controller.storeTypeId.value.toTypeStore(),
                        onClickShowrooms: () {
                          controller.filterStores(StoreType.cars);
                        },
                        onClickStores: () {
                          controller.filterStores(StoreType.tools);
                        },
                      );
                    })
                  ]),
                ),
              )
            ];
          },
          body: controller.obx(
              onLoading: const Loading(),
              onError: (e) => ErrorScreen(
                textError: e.toString(),
                onPressed: () {
                  controller.init();
                },
              ),
              onEmpty: Empty(
                title: L10n.empty.tr,
                icon: Iconsax.clipboard_close,
              ), (state) {
            return GetBuilder<StoresController>(builder: (controller) {
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
                  var isLastItem =
                      controller.stateLastItem(index, state.length);
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
        ),
      ),
    );
  }
}
