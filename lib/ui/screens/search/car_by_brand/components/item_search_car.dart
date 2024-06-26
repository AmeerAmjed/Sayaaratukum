import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/domain/models//car.dart';
import 'package:sayaaratukum/ui/theme//color.dart';
import 'package:sayaaratukum/util/converter.dart';
import 'package:sayaaratukum/util/price.dart';
import 'package:sayaaratukum/ui/widgets//horizontal_space.dart';
import 'package:sayaaratukum/ui/widgets//image_loading.dart';

class ItemSearchCar extends StatelessWidget {
  const ItemSearchCar({
    Key? key,
    required this.car,
    required this.onPressedItem,
    required this.onPressedFavouriteCar,
  }) : super(key: key);

  final CarModel car;
  final VoidCallback onPressedFavouriteCar;
  final VoidCallback onPressedItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.zero,
        margin: EdgeInsets.zero,
        child: InkWell(
          onTap: onPressedItem,
          child: Row(
            children: [
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.all(2),
                    width: 100,
                    height: 100,
                    child: Card(
                      color: Get.theme.scaffoldBackgroundColor,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: ImageLoading(
                        imageUrl: car.images.first.imageUrl,
                      ),
                    ),
                  ),
                  // FavouriteCar(
                  //   onPressed: onPressedFavouriteCar,
                  //   colorBackground: Colors.transparent,
                  // )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
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
                  Text(
                    currency(car.price),
                    style: Get.textTheme.titleMedium,
                    maxLines: 1,
                  ),
                ],
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: ColorSystem.arrow,
                size: 14,
              ),
              const HorizontalSpace12(),
            ],
          ),
        ),
      ),
    );
  }
}
