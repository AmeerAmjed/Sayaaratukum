import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/public/car_details.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/details/car/components/car_details_specifications.dart';
import 'package:sayaaratukum/screens/details/car/components/indication.dart';
import 'package:sayaaratukum/screens/details/tool/components/tool_details_note.dart';
import 'package:sayaaratukum/screens/home/components/title_with_view_all.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/util/price.dart';
import 'package:sayaaratukum/util/share.dart';
import 'package:sayaaratukum/widgets/bottom_info_store.dart';
import 'package:sayaaratukum/widgets/box.dart';
import 'package:sayaaratukum/widgets/error.dart';
import 'package:sayaaratukum/widgets/image_full_screen.dart';
import 'package:sayaaratukum/widgets/image_loading.dart';
import 'package:sayaaratukum/widgets/loading.dart';
import 'package:sayaaratukum/widgets/state_car.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class CarDetails extends GetView<CarDetailsController> {
  const CarDetails({
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
    }, (car) {
      return Scaffold(
        appBar: AppBar(
          title: Text(car!.name),
          actions: [
            IconButton(
              onPressed: () {
                onClickShare(context, "${Constants.baseUrl}car/${car.id}");
              },
              icon: const Icon(
                CupertinoIcons.share,
              ),
            )
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: controller.onPageIndex,
                    itemCount: car.images.length,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          showImageFullScreen(
                            context,
                            car.images[index].imageUrl,
                          );
                        },
                        child: Box(
                          child: ImageLoading(
                            fitImage: BoxFit.contain,
                            imageUrl: car.images[index].imageUrl,
                          ),
                        ),
                      );
                    },
                  ),
                  if (car.images.length > 1)
                    IndicatorImageCar(
                      children: List.generate(
                        car.images.length,
                            (index) => Obx(() {
                          return Container(
                            padding: const EdgeInsets.all(8.0),
                            margin: const EdgeInsets.all(4),
                            height: 6.0,
                            width: controller.onPageIndex.value == index
                                ? 27.0
                                : 15.0,
                            decoration: BoxDecoration(
                              color: controller.onPageIndex.value == index
                                  ? Get.theme.primaryColor
                                  : Get.theme.primaryColor.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        }),
                      ),
                    ),
                  if (car.images.length > 1)
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            // GetBuilder<CarDetailsController>(
                            //     builder: (controller) {
                            //       return IconButton(
                            //         onPressed: controller.onPageIndex.value != 0
                            //             ? (controller.backward)
                            //             : null,
                            //         icon: const Icon(
                            //           Icons.arrow_back_ios_new_rounded,
                            //         ),
                            //       );
                            //       return ButtonSlideImage(
                            //         icon: Icons.arrow_back_ios_new_rounded,
                            //         onPressed: controller.onPageIndex.value > 0
                            //             ? (controller.backward)
                            //             : null,
                            //       );
                            //     }),
                            // GetBuilder<CarDetailsController>(builder: (con) {
                            //   return IconButton(
                            //     splashColor: Colors.red,
                            //     hoverColor: Colors.red,
                            //     onPressed: con.onPageIndex.value <
                            //         car.images.length - 1
                            //         ? (con.forward)
                            //         : null,
                            //     icon: const Icon(
                            //       Icons.arrow_forward_ios_rounded,
                            //     ),
                            //   );
                            //   return ButtonSlideImage(
                            //     icon: Icons.arrow_forward_ios_rounded,
                            //     onPressed: con.onPageIndex.value <
                            //         car.images.length - 1
                            //         ? (con.forward)
                            //         : null,
                            //   );
                            // }),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const VerticalSpace8(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    car.name,
                    style: Get.textTheme.labelLarge?.copyWith(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                  ),
                ),
                if (car.isAvailable) StateCar(background: Get.theme.cardColor)
              ],
            ),
            const VerticalSpace8(),
            Text(
              currency(car.price),
              style: Get.textTheme.titleMedium,
              maxLines: 1,
            ),
            const VerticalSpace16(),
            TitleWithViewAll(
              title: L10n.specifications.tr,
              paddingH: .0,
            ),
            const VerticalSpace4(),
            CarDetailsSpecifications(
              car: car,
            ),
            if (car.notes != null)
              ToolDetailsNote(
                description: car.notes!,
              )
          ],
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            if (car.ownerType == "store") {
              controller.navToStoreCar(car.owner.id.toString());
            }
          },
          child: BottomInfoStore(
            nameStore: car.owner.name,
            address: "${car.gov}, ${car.city} ${car.closerPoint ?? ""} ",
            whatsappNumberPhone: car.owner.phoneNumber,
            numberPhone: car.owner.phoneNumber,
            imageUrl: car.owner.avatar,
          ),
        ),
      );
    });
  }
}
