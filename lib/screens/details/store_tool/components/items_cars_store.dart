import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/controllers/public/store/store_tool_details.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/tools/components/tool_item.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/loading.dart';

import '../../../../widgets/empty.dart';

class ItemToolsStore extends GetView<StoreToolDetailsController> {
  const ItemToolsStore({Key? key}) : super(key: key);

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
      return GetBuilder<StoreToolDetailsController>(builder: (controller) {
        return GridView.builder(
          controller: controller.scroll,
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.spacing16,
          ),
          shrinkWrap: true,
          itemCount: controller.isLoadingMore.value
              ? state!.length + 1
              : state!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: Constants.spacing8,
            crossAxisSpacing: Constants.spacing8,
          ),
          itemBuilder: (context, index) {
            var isLastItem = controller.stateLastItem(index, state.length);
            if (isLastItem) {
              return const Center(
                child: Loading(),
              );
            }
            return InkWell(
              onTap: () {
                controller.toolDetails(state[index].id);
              },
              child: ToolItem(
                item: state[index],
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
