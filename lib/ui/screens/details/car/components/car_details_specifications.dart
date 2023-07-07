import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/domain/models//car.dart';
import 'package:sayaaratukum/ui/screens/details/tool/components/title_with_description.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/util/converter.dart';

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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TitleWithDescription(
                        title: L10n.brand.tr,
                        description: car.brand.name,
                      ),
                      TitleWithDescription(
                        title: L10n.enginePower.tr,
                        description: car.enginePowerType.name,
                      ),
                      TitleWithDescription(
                        title: L10n.color.tr,
                        description: car.color.tr,
                      ),
                      TitleWithDescription(
                        title: L10n.gearBox.tr,
                        description: car.gearbox.tr,
                      ),
                      if (car.isDamage != null)
                        TitleWithDescription(
                          title: L10n.isDamage.tr,
                          description: car.isDamage!.tr,
                        ),
                      if (car.registerNumber != null)
                        TitleWithDescription(
                          title: L10n.numberRegisterCar.tr,
                          description: car.registerNumber ?? "",
                        ),
                    ],
                  ),
                ),
              ),
              // Spacer(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TitleWithDescription(
                      title: L10n.model.tr,
                      description: car.modelBrand.name,
                    ),
                    TitleWithDescription(
                      title: L10n.engineCapacity.tr,
                      description: car.engine + L10n.cc.tr,
                    ),
                    TitleWithDescription(
                      title: L10n.year.tr,
                      description: car.yearModel,
                    ),
                    TitleWithDescription(
                      title: L10n.drivingMiles.tr,
                      description: convertMetersToKilometers(car.mileage),
                    ),
                    if (car.inComingType != null)
                      TitleWithDescription(
                        title: L10n.madeTo.tr,
                        description: car.inComingType ?? "",
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
