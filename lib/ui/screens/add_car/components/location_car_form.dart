import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:sayaaratukum/domain/controllers/user/add_car.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/util/hard_code.dart';
import 'package:sayaaratukum/ui/widgets//dropdown_list.dart';
import 'package:sayaaratukum/ui/widgets//input.dart';
import 'package:sayaaratukum/ui/widgets//vertical_space.dart';

class LocationCarForm extends GetView<AddCarController> {
  const LocationCarForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const VerticalSpace8(),
        DropdownList(
          label: L10n.governorate.tr,
          onChanged: controller.onChangeProvinces,
          items: HardCode.provinces,
          value: controller.provinces.value.isNotEmpty
              ? controller.provinces.value
              : null,
        ),
        const VerticalSpace8(),
        InputAuth(
          contentPadding: Constants.spacing12,
          controller: controller.region,
          label: L10n.region.tr,
          keyboardType: TextInputType.text,
        ),
        const VerticalSpace8(),
        InputAuth(
          controller: controller.nearPoint,
          label: L10n.nearPoint.tr,
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }
}
