import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/public/car_details.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/models/car.dart';
import 'package:sayaaratukum/screens/details/car/components/button_slide_image.dart';
import 'package:sayaaratukum/screens/details/car/components/car_details_specifications.dart';
import 'package:sayaaratukum/screens/details/car/components/indication.dart';
import 'package:sayaaratukum/screens/home/components/title_with_view_all.dart';
import 'package:sayaaratukum/screens/tool_details/components/tool_details_note.dart';
import 'package:sayaaratukum/util/price.dart';
import 'package:sayaaratukum/widgets/bottom_info_store.dart';
import 'package:sayaaratukum/widgets/box.dart';
import 'package:sayaaratukum/widgets/image_full_screen.dart';
import 'package:sayaaratukum/widgets/image_loading.dart';
import 'package:sayaaratukum/widgets/state_car.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class CarDetails extends GetView<CarDetailsController> {
  const CarDetails({
    Key? key,
    required this.car,
  }) : super(key: key);

  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(car.name),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
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
                        showImageFullScreen(context, car.images[index]);
                      },
                      child: Box(
                        child: ImageLoading(
                          fitImage: BoxFit.contain,
                          imageUrl: car.images[index],
                        ),
                      ),
                    );
                  },
                ),
                IndicatorImageCar(
                  children: List.generate(
                    car.images.length,
                    (index) => Obx(() {
                      return Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: const EdgeInsets.all(4),
                        height: 6.0,
                        width:
                            controller.onPageIndex.value == index ? 27.0 : 15.0,
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
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GetBuilder<CarDetailsController>(builder: (con) {
                          return ButtonSlideImage(
                            icon: Icons.arrow_back_ios_new_rounded,
                            onPressed: con.onPageIndex.value != 0
                                ? (con.backward)
                                : null,
                          );
                        }),
                        GetBuilder<CarDetailsController>(builder: (con) {
                          return ButtonSlideImage(
                            icon: Icons.arrow_forward_ios_rounded,
                            onPressed:
                            con.onPageIndex.value < car.images.length - 1
                                    ? (con.forward)
                                    : null,
                          );
                        }),
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
              if (car.isAvailable)
                const StateCar(
                  background: Colors.white,
                )
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
      bottomNavigationBar: BottomInfoStore(
        nameStore: car.owner.name,
        address: "${car.gov}, ${car.city} ${car.closerPoint ?? ""} ",
        whatsappNumberPhone: car.owner.phoneNumber.toString(),
        numberPhone: car.owner.phoneNumber.toString(),
        imageUrl: car.owner.avatar,
      ),
    );
  }
}
