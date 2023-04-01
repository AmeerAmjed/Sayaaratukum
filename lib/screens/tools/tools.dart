import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/public/tools.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/home/components/search.dart';
import 'package:sayaaratukum/screens/tools/components/tool_item.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/loading.dart';

class ToolsScreen extends GetView<ToolsController> {
  const ToolsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverPadding(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  SearchBox(
                    hintText: L10n.searchCar.tr,
                    onSubmitted: (text) {},
                    onPressedFilter: () {},
                  ),
                ]),
              ),
            )
          ];
        },
        body: RefreshIndicator(
          onRefresh: () => controller.onRefresh(),
          child: controller.obx(onLoading: const Loading(), (state) {
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
                      // TopAdsController.to.onClickItem(state[index].id);
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
    );
  }
}
