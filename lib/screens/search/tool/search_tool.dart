import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/controllers/public/search/tool.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/tools/components/search_tool_bar.dart';
import 'package:sayaaratukum/screens/tools/components/tool_item.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/appbars.dart';
import 'package:sayaaratukum/widgets/empty.dart';
import 'package:sayaaratukum/widgets/loading.dart';

class SearchTool extends GetView<SearchToolController> {
  const SearchTool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        leading: null,
        actions: [
          const Spacer(),
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.only(top: 6),
              child: SearchToolBar(
                onSubmittedSearch: controller.searchByText,
                onPressedApplyFilter: () {
                  Get.back();
                  controller.init();
                },
              ),
            ),
          ),
        ],
      ),
      body: controller.obx(
          onLoading: const Loading(),
          onEmpty: Empty(
            title: L10n.noResult.tr,
            icon: Iconsax.clipboard_close,
          ), (state) {
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
      }),
    );
  }
}
