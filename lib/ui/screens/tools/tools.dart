import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/domain/controllers/public/tools.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/route/page.dart';
import 'package:sayaaratukum/ui/screens/components/add.dart';
import 'package:sayaaratukum/ui/screens/tools/components/search_tool_bar.dart';
import 'package:sayaaratukum/ui/screens/tools/components/tool_item.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/ui/widgets//empty.dart';
import 'package:sayaaratukum/ui/widgets//loading.dart';

class ToolsScreen extends GetView<ToolsController> {
  const ToolsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 300);

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverPadding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  SearchToolBar(
                    onSubmittedSearch: (value) {
                      Get.back();
                      controller.navigateTo(RouteScreen.searchTool);
                    },
                    onPressedApplyFilter: () {
                      Get.back();
                      controller.navigateTo(RouteScreen.searchTool);
                    },
                  )
                  // SearchBox(
                  //   hintText: L10n.searchCar.tr,
                  //   onSubmitted: (text) {},
                  //   onPressedFilter: () {},
                  // ),
                ]),
              ),
            )
          ];
        },
        body: RefreshIndicator(
          onRefresh: () => controller.onRefresh(),
          child: controller.obx(
              onLoading: const Loading(),
              onEmpty: Empty(
                title: L10n.empty.tr,
                icon: Iconsax.clipboard_close,
              ), (state) {
            return GetBuilder<ToolsController>(builder: (controller) {
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
                  var isLastItem =
                  controller.stateLastItem(index, state.length);
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
          }),
        ),
      ),
      floatingActionButton: Obx(() {
        return AnimatedSlide(
          duration: duration,
          offset: controller.showFab.value ? Offset.zero : const Offset(0, 2),
          child: AnimatedOpacity(
            duration: duration,
            opacity: controller.showFab.value ? 1 : 0,
            child: const AddItemToBuy(),
          ),
        );
      }),
    );
  }
}
