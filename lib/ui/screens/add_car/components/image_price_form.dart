import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/domain/controllers/user/add_car.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/screens/add_car/components/widget/box_add_car_images.dart';
import 'package:sayaaratukum/ui/screens/add_car/components/widget/delete_image.dart';
import 'package:sayaaratukum/ui/screens/add_car/components/widget/hint_add_car_images.dart';
import 'package:sayaaratukum/ui/widgets//box.dart';
import 'package:sayaaratukum/ui/widgets//buttons.dart';
import 'package:sayaaratukum/ui/widgets//image_loading.dart';
import 'package:sayaaratukum/ui/widgets//input.dart';
import 'package:sayaaratukum/ui/widgets//space.dart';
import 'package:sayaaratukum/ui/widgets//vertical_space.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/util/currency_input_formatter.dart';

class ImageWithPriceForm extends GetView<AddCarController> {
  const ImageWithPriceForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const VerticalSpace8(),
        InputAuth(
          controller: controller.price,
          label: L10n.price.tr,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CurrencyInputFormatter()
          ],
          keyboardType: TextInputType.number,
        ),
        const VerticalSpace4(),
        InputAuth(
          controller: controller.note,
          label: L10n.note.tr,
          keyboardType: TextInputType.text,
          maxLines: 5,
        ),
        const VerticalSpace4(),
        GetBuilder<AddCarController>(builder: (cont) {
          if (controller.isUpdated.value && controller.car.value != null) {
            return BoxAddCarImages(
              child: SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(L10n.imagesCar.tr),
                          Box(
                            size: 40,
                            child: Buttons(
                              width: 40,
                              height: 20,
                              padding: EdgeInsets.zero,
                              onPressed: controller.addImageCar,
                              icon: Iconsax.add,
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child:
                          GetBuilder<AddCarController>(builder: (controller) {
                        return ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.symmetric(
                            horizontal: Constants.spacing16,
                          ),
                          shrinkWrap: true,
                          itemCount: controller.car.value!.images.length,
                          separatorBuilder: (context, index) => const Space(
                            width: Constants.spacing,
                          ),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                // TopAdsController.to.onClickItem(state[index].id);
                              },
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: 200,
                                    width: 300,
                                    child: Card(
                                      child: ImageLoading(
                                        fitImage: BoxFit.contain,
                                        imageUrl: controller
                                            .car.value!.images[index].imageUrl,
                                      ),
                                    ),
                                  ),
                                  DeleteImageCar(
                                    onPressed: () {
                                      controller.onClickDeleteImage(
                                        controller.imagesCar[index],
                                      );
                                    },
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }),
                    ),
                  ],
                ),
              ),
            );
          }

          return BoxAddCarImages(
            child: cont.imagesCar.isEmpty
                ? InkWell(
                    onTap: controller.selectMultipleImages,
                    child: HintAddCarImages(
                      title: L10n.addImagesCar.tr,
                    ),
                  )
                : Column(
                    children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(L10n.imagesCar.tr),
                      Box(
                        size: 40,
                        child: Buttons(
                          width: 40,
                          height: 20,
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            controller.selectMultipleImages();
                          },
                          icon: Iconsax.add,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: GetBuilder<AddCarController>(
                        builder: (controller) {
                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(
                              horizontal: Constants.spacing16,
                            ),
                            shrinkWrap: true,
                            itemCount: controller.imagesCar.length + 1,
                            separatorBuilder: (context, index) => const Space(
                              width: Constants.spacing,
                            ),
                            itemBuilder: (context, index) {
                              // ;

                              print(
                                  "state image ${index == controller.imagesCar.length && controller.imagesCar.length < 9}");
                              print(
                                  "state image ${controller.imagesCar.length}");

                              if (index == controller.imagesCar.length) {
                                if (controller.imagesCar.length <= 10) {
                                  return InkWell(
                                    onTap: controller.selectMultipleImages,
                                    child: const Box(
                                      size: 100,
                                      child: Icon(Iconsax.add),
                                    ),
                                  );
                                } else {
                                  return const Space();
                                }
                              }
                              return InkWell(
                                onTap: () {
                                  // TopAdsController.to.onClickItem(state[index].id);
                                },
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      child: Card(
                                        child: Image.file(
                                          File(
                                            controller.imagesCar[index],
                                          ),
                                        ),
                                      ),
                                    ),
                                    DeleteImageCar(
                                      onPressed: () {
                                        controller.onClickDeleteImage(
                                          controller.imagesCar[index],
                                        );
                                      },
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        }),
                  ),
                ),
                const VerticalSpace4(),
              ],
            ),
          );
        }),
      ],
    );
  }
}
