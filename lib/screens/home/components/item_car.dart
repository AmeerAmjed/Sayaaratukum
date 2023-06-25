import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/models/car.dart';
import 'package:sayaaratukum/util/converter.dart';
import 'package:sayaaratukum/util/price.dart';
import 'package:sayaaratukum/widgets/image_loading.dart';
import 'package:sayaaratukum/widgets/state_car.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class ItemCar extends StatelessWidget {
  const ItemCar({
    Key? key,
    required this.car,
    required this.buttonFavouriteCar,
  }) : super(key: key);

  final CarModel car;
  final GetBuilder<dynamic> buttonFavouriteCar;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.zero,
      // color: ,
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
                    imageUrl: car.images.first.imageUrl,
                  ),
                  buttonFavouriteCar
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
                  Text(
                    "${car.yearModel}, ${convertMetersToKilometers(car.mileage)}",
                    style: Get.textTheme.labelMedium?.copyWith(
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 1,
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
                  if (car.isAvailable) const StateCar()
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
