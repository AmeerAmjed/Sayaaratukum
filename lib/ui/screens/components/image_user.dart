import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/domain/controllers/application.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/ui/widgets//default_image.dart';
import 'package:sayaaratukum/ui/widgets//image_loading.dart';

class ImageUser extends GetView<Application> {
  const ImageUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Application>(builder: (controller) {
      return controller.user?.value != null
          ? controller.user?.value?.avatar == Constants.websiteLink
              ? DefaultImage(
                  sizeAlphabet: 30,
                  name: controller.user?.value?.firstName ?? "",
                )
              : ImageLoading(
                  imageUrl: controller.user?.value?.avatar ?? "",
                )
          : const Icon(Iconsax.user);
    });
  }
}
