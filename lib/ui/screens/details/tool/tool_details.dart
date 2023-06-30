import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/domain/controllers/public/details/tool_details.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/screens/details/tool/components/imaget_tool_details.dart';
import 'package:sayaaratukum/ui/screens/details/tool/components/tool_details_note.dart';
import 'package:sayaaratukum/ui/screens/details/tool/components/tool_details_specifications.dart';
import 'package:sayaaratukum/ui/screens/home/components/title_with_view_all.dart';
import 'package:sayaaratukum/util/price.dart';
import 'package:sayaaratukum/ui/widgets//bottom_info_store.dart';
import 'package:sayaaratukum/ui/widgets//error.dart';
import 'package:sayaaratukum/ui/widgets//loading.dart';
import 'package:sayaaratukum/ui/widgets//vertical_space.dart';

class ToolDetails extends GetView<ToolDetailsController> {
  const ToolDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        onLoading: Scaffold(
          appBar: AppBar(),
          body: const Loading(),
        ), onError: (error) {
      return Scaffold(
        appBar: AppBar(),
        body: ErrorScreen(
          textError: error ?? "",
          onPressed: () {
            controller.getCarById();
          },
        ),
      );
    }, (tool) {
      return Scaffold(
        appBar: AppBar(
          title: Text(tool!.name),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ImageToolDetails(
              imageUrl: tool.imageUrl,
            ),
            const VerticalSpace8(),
            Text(
              tool.name,
              style: Get.textTheme.labelLarge?.copyWith(
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
            ),
            const VerticalSpace8(),
            Text(
              currency(tool.price),
              style: Get.textTheme.titleMedium,
              maxLines: 1,
            ),
            const VerticalSpace16(),
            TitleWithViewAll(
              title: L10n.specifications.tr,
              paddingH: .0,
            ),
            const VerticalSpace4(),
            ToolDetailsSpecifications(
              tool: tool,
            ),
            if (tool.description != null)
              ToolDetailsNote(
                description: tool.description!,
              )
          ],
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            controller.navToStoreTool(tool.idStore.toString());
          },
          child: BottomInfoStore(
            nameStore: tool.store.name,
            address: tool.store.address,
            whatsappNumberPhone: tool.store.whatsappNumberPhone,
            numberPhone: tool.store.whatsappNumberPhone,
            imageUrl: tool.store.avatar,
          ),
        ),
      );
    });
  }
}
