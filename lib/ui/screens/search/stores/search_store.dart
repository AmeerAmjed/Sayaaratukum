import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/domain/controllers/public/search/stores.dart';
import 'package:sayaaratukum/ui/l10n/lang.dart';
import 'package:sayaaratukum/ui/screens/stores/components/item_stores.dart';
import 'package:sayaaratukum/ui/screens/stores/components/search_stores.dart';
import 'package:sayaaratukum/ui/widgets/appbars.dart';
import 'package:sayaaratukum/ui/widgets/empty.dart';
import 'package:sayaaratukum/ui/widgets/loading.dart';
import 'package:sayaaratukum/ui/widgets/space.dart';
import 'package:sayaaratukum/ui/widgets/error.dart';
import 'package:sayaaratukum/util/constant.dart';


class SearchStores extends GetView<SearchStoresController> {
  const SearchStores({Key? key}) : super(key: key);

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
              child: SearchBoxStores(
                onSubmittedSearch: (text) {
                  controller.init();
                },
              ),
            ),
          ),
        ],
      ),
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
        return GetBuilder<SearchStoresController>(builder: (controller) {
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
                  // controller.onClickStoreCar(state[index]);
                },
              );
            },
          );
        });
      }),
    );
  }
}
