import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:sayaaratukum/controllers/user/add_car.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/util/hard_code.dart';
import 'package:sayaaratukum/widgets/dropdown_list.dart';
import 'package:sayaaratukum/widgets/input.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

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
          onChanged: controller.onChangeBrand,
          items: HardCode.provinces,
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
          controller: controller.region,
          label: L10n.nearPoint.tr,
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }
}
