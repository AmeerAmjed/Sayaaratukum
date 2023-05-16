import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/models/car.dart';
import 'package:sayaaratukum/screens/home/widget/cars.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/util/price.dart';
import 'package:sayaaratukum/widgets/image_loading.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class ItemCar extends StatelessWidget {
  const ItemCar({
    Key? key,
    required this.car,
  }) : super(key: key);

  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.zero,
      color: Colors.white,
      child: Container(
        height: 280,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  ImageLoading(
                    imageUrl: car.images[0],
                  ),
                  FavouriteCar(
                    onPressed: () {},
                  )
                ],
              ),
            ),
            const VerticalSpace12(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    car.name,
                    style: Get.textTheme.labelMedium?.copyWith(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                    maxLines: 1,
                  ),
                  Container(
                    color: Colors.white10,
                    child: Text(
                      "${car.yearModel}, ${car.mileage}",
                      style: Get.textTheme.labelMedium?.copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            const VerticalSpace8(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    currency(car.price),
                    style: Get.textTheme.titleMedium,
                    maxLines: 1,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      color: Get.theme.backgroundColor,
                      borderRadius: BorderRadius.circular(
                        Constants.radiusSmall,
                      ),
                    ),
                    child: Text(
                      L10n.available.tr,
                      style: Get.textTheme.labelMedium?.copyWith(
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            ),
            const VerticalSpace16(),
          ],
        ),
      ),
    );
  }
}
