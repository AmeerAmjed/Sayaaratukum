import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/models/car.dart';
import 'package:sayaaratukum/screens/tool_details/components/title_with_description.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class CarDetailsSpecifications extends StatelessWidget {
  const CarDetailsSpecifications({
    Key? key,
    required this.car,
  }) : super(key: key);
  final CarModel car;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(
            Constants.spacing8,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  // color: Colors.deepOrange,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TitleWithDescription(
                        title: L10n.brand.tr,
                        description: car.brand.name,
                      ),
                      const VerticalSpace8(),
                      TitleWithDescription(
                        title: L10n.enginePower.tr,
                        description: car.enginePowerType.name,
                      ),
                      const VerticalSpace8(),
                      TitleWithDescription(
                        title: L10n.color.tr,
                        description: car.color,
                      ),
                      const VerticalSpace8(),
                      TitleWithDescription(
                        title: L10n.gearBox.tr,
                        description: car.gearbox,
                      ),
                    ],
                  ),
                ),
              ),
              // Spacer(),
              Expanded(
                child: Container(
                  // color: Colors.deepOrange,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TitleWithDescription(
                        title: L10n.model.tr,
                        description: car.modelBrand.name,
                      ),
                      const VerticalSpace8(),
                      TitleWithDescription(
                        title: L10n.engineCapacity.tr,
                        description: car.engine,
                      ),
                      const VerticalSpace8(),
                      TitleWithDescription(
                        title: L10n.year.tr,
                        description: car.yearModel,
                      ),
                      const VerticalSpace8(),
                      TitleWithDescription(
                        title: L10n.drivingMiles.tr,
                        description: car.mileage,
                      ),
                    ],
                  ),
                ),
              )
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     TitleWithDescription(
              //       title: L10n.brand.tr,
              //       description: car.brand.name,
              //     ),
              //     TitleWithDescription(
              //       title: L10n.model.tr,
              //       description: car.modelBrand.name,
              //     )
              //   ],
              // ),
              // const VerticalSpace16(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     TitleWithDescription(
              //       title: L10n.brand.tr,
              //       description: car.enginePowerType.name,
              //     ),
              //     TitleWithDescription(
              //       title: L10n.model.tr,
              //       description: car.engine + "L",
              //     )
              //   ],
              // ),
              // const VerticalSpace16(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Expanded(
              //       child: TitleWithDescription(
              //         title: L10n.color.tr,
              //         description: car.color,
              //       ),
              //     ),
              //     TitleWithDescription(
              //       title: L10n.recolor.tr,
              //       description: car.color,
              //     )
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
