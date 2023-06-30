import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/domain/controllers/user/add_tool.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/screens/add_car/components/widget/box_add_car_images.dart';
import 'package:sayaaratukum/ui/screens/add_car/components/widget/hint_add_car_images.dart';
import 'package:sayaaratukum/ui/widgets//box.dart';
import 'package:sayaaratukum/ui/widgets//buttons.dart';
import 'package:sayaaratukum/ui/widgets//image_loading.dart';
import 'package:sayaaratukum/ui/widgets//vertical_space.dart';

class ImageTool extends StatelessWidget {
  const ImageTool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddToolController>(builder: (controller) {
      if (controller.imageTool != null) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: Card(
              child: ImageLoading(
                imageUrl: controller.imageTool ?? "",
              ),
            ),
          ),
        );
      }
      return BoxAddCarImages(
        child: controller.imagesTool.isEmpty
            ? Card(
                margin: EdgeInsets.zero,
                child: InkWell(
                  onTap: controller.selectToolImage,
                  child: HintAddCarImages(
                    title: L10n.addImageTool.tr,
                  ),
                ),
              )
            : Card(
          margin: EdgeInsets.zero,
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(L10n.imagesTool.tr),
                  ),
                  Box(
                    size: 40,
                    child: Buttons(
                      width: 40,
                      height: 20,
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        controller.selectToolImage();
                      },
                      icon: Iconsax.gallery_add,
                    ),
                  )
                ],
              ),
              Expanded(
                child: SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: GetBuilder<AddToolController>(
                      builder: (controller) {
                        return Card(
                          child: Image.file(
                            File(
                              controller.imagesTool.value,
                            ),
                          ),
                        );
                      }),
                ),
              ),
              const VerticalSpace4(),
            ],
          ),
        ),
      );
    });
  }
}
