import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/domain/controllers/application.dart';
import 'package:sayaaratukum/domain/controllers/public/tools.dart';
import 'package:sayaaratukum/domain/models//tool.dart';
import 'package:sayaaratukum/ui/l10n/lang.dart';
import 'package:sayaaratukum/ui/theme/color.dart';
import 'package:sayaaratukum/ui/widgets//edite_samll_button.dart';
import 'package:sayaaratukum/ui/widgets//image_loading.dart';
import 'package:sayaaratukum/ui/widgets//loading.dart';
import 'package:sayaaratukum/ui/widgets//vertical_space.dart';
import 'package:sayaaratukum/ui/widgets/CustomDialog.dart';
import 'package:sayaaratukum/ui/widgets/bottom_sheet.dart';
import 'package:sayaaratukum/ui/widgets/button_action_bottom_sheet.dart';
import 'package:sayaaratukum/util/price.dart';

class ToolItem extends StatelessWidget {
  const ToolItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final ToolModel item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            children: [
              Card(
                child: ImageLoading(
                  imageUrl: item.imageUrl,
                ),
              ),
              if (Application.instance.isOwnerStoreTool(item.idStore))
                EditeSmallButton(
                  onPressed: () {
                    onClickToolIsOwner(item.id, Application.instance);
                    // Application.instance.tool?.value = item;
                    // Application.instance.navToAddTool(idUpdateTool: item.id);
                  },
                )
            ],
          ),
        ),
        const VerticalSpace4(),
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            currency(item.price),
            style: Get.textTheme.titleMedium,
            maxLines: 1,
          ),
        ),
        const VerticalSpace12(),
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 8),
          child: Text(
            item.name,
            style: Get.textTheme.labelMedium?.copyWith(
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 1,
          ),
        )
      ],
    );
  }
}

class BrandItemLoading extends StatelessWidget {
  const BrandItemLoading({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        children: [
          SizedBox(
            width: width,
            height: width,
            child: const Loading(),
          ),
          const Spacer()
        ],
      ),
    );
  }
}

onClickToolIsOwner(int id, controller) {
  bottomSheet(
    height: 200,
    widget: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonActionBottomSheet(
          title: L10n.tool.tr,
          icon: CupertinoIcons.hammer,
          onPressed: () {
            Get.back();
            controller.toolDetails(id);
          },
          paddingVertical: 4,
        ),
        ButtonActionBottomSheet(
          title: L10n.updateTool.tr,
          icon: Iconsax.edit,
          onPressed: () {
            Get.back();
            controller.navToAddTool(id: id);
            // Get.back();
          },
          paddingVertical: 4,
        ),
        ButtonActionBottomSheet(
          color: ColorSystem.colorDanger,
          title: L10n.deleteTool.tr,
          icon: Iconsax.trash,
          onPressed: () {
            showCustomDialog(
              L10n.deleteTool.tr,
              isDanger: true,
              message: L10n.messageDeleteTool.tr,
              labelButtonAction: L10n.deleteTool.tr,
              onPressedAction: () {
                Get.back();
                ToolsController.instance.deleteTool(id);
              },
            );
            // Get.back();
          },
          paddingVertical: 4,
        ),
      ],
    ),
  );
}