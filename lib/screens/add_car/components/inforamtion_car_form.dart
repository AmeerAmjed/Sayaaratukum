import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/controllers/user/add_car.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/add_car/components/radio_group.dart';
import 'package:sayaaratukum/screens/add_car/components/row_two_widget.dart';
import 'package:sayaaratukum/screens/add_car/components/year_brand.dart';
import 'package:sayaaratukum/util/hard_code.dart';
import 'package:sayaaratukum/widgets/dropdown_list.dart';
import 'package:sayaaratukum/widgets/input.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class InformationCarForm extends GetView<AddCarController> {
  const InformationCarForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> yearItems = List<Widget>.generate(50, (int index) {
      final int year = DateTime.now().year - index;
      return Text(
        year.toString(),
        style: const TextStyle(fontSize: 20.0),
      );
    });
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const VerticalSpace8(),
        RowTwoWidget(
          leftWidget: DropdownList(
            margin: const EdgeInsets.only(
              left: 2,
            ),
            label: L10n.brands.tr,
            onChanged: controller.onChangeBrand,
            value: controller.isUpdated.value
                ? controller.brands
                    .where((e) => e.id == controller.idBrandSelected)
                    .first
                    .title
                : null,
            items: controller.brands.map((e) => e.title).toList(),
          ),
          rightWidget: GetBuilder<AddCarController>(builder: (co) {
            return DropdownList(
              keyDropdownList: controller.keyManagerModelBrand,
              label: L10n.model.tr,
              onChanged: controller.onChangeModelBrand,
              items: co.getModelByBrandId(),
              value: controller.modelCar,
              margin: const EdgeInsets.only(
                right: 2,
              ),
            );
          }),
        ),
        RowTwoWidget(
          leftWidget: DropdownList(
            label: L10n.engineCapacity.tr,
            margin: const EdgeInsets.only(
              left: 2,
            ),
            onChanged: controller.onChangeEngineCapacity,
            items: HardCode.engineSizes,
            value: controller.engineCapacity.value != 0
                ? controller.engineCapacity.value.toString()
                : null,
          ),
          rightWidget: GetBuilder<AddCarController>(builder: (con) {
            return DropdownList(
              label: L10n.enginePower.tr,
              margin: const EdgeInsets.only(
                right: 2,
              ),
              onChanged: controller.onChangeEnginePower,
              items: con.enginePowers.map((e) => e.name).toList(),
              value: controller.idEnginePower != 0
                  ? con.enginePowers
                      .where((e) => e.id == controller.idEnginePower)
                      .first
                      .name
                  : null,
            );
          }),
        ),
        const VerticalSpace4(),
        DropdownList(
          label: L10n.madeTo.tr,
          onChanged: controller.onChangeMadeTo,
          items: HardCode.madeTo.map((map) => map.values.first).toList(),
          value: controller.madeTo.value.isEmpty
              ? null
              : getValueHardCodeMadeToByKey(controller.madeTo.value),
        ),
        const VerticalSpace8(),
        DropdownList(
          label: L10n.color.tr,
          onChanged: controller.onChangeColorCar,
          items: HardCode.carColors,
          value: controller.color.value.isEmpty ? null : controller.color.value,
        ),
        const VerticalSpace8(),
        InputAuth(
          controller: controller.numberRegisterCar,
          label: L10n.numberRegisterCar.tr,
          keyboardType: TextInputType.text,
        ),
        // RowTwoWidget(
        //   leftWidget: DropdownList(
        //     margin: const EdgeInsets.only(
        //       left: 16,
        //     ),
        //     label: L10n.typeCar.tr,
        //     onChanged: controller.onChangeBrand,
        //     items: controller.brands
        //         .map((e) => e.title)
        //         .toList(),
        //   ),
        //   rightWidget:
        //   GetBuilder<AddCarController>(builder: (co) {
        //     return DropdownList(
        //       label: L10n.propulsionSystem.tr,
        //       onChanged: (value) {},
        //       items: co.getModelByBrandId(),
        //       margin: const EdgeInsets.only(
        //         right: 16,
        //       ),
        //     );
        //   }),
        // )
        const VerticalSpace8(),
        InputAuth(
          readOnly: true,
          label: L10n.year.tr,
          controller: controller.yearModel,
          validator: (value) => ValidatorInput.checkValidateIsRequired(
            L10n.yearBrand.tr,
            value,
          ),
          onTap: () async {
            yearBrand(
              context,
              controller.onSelectYearModel,
              yearItems,
            );
          },
        ),
        const VerticalSpace8(),
        InputAuth(
          label: L10n.drivingMiles.tr,
          controller: controller.drivingMiles,
          validator: (value) => ValidatorInput.checkValidateIsRequired(
            L10n.drivingMiles.tr,
            value,
          ),
          keyboardType: TextInputType.number,
        ),
        const VerticalSpace8(),
        GetBuilder<AddCarController>(builder: (co) {
          return RadioGroup(
            label: L10n.gearBox.tr,
            spacingTitle: 38,
            titleOption1: L10n.automatic.tr,
            valueOption1: controller.typeGearBox.first,
            titleOption2: L10n.manual.tr,
            valueOption2: controller.typeGearBox.last,
            value: controller.gearBox.value,
            onChanged: controller.onChangeGearBox,
          );
        }),
        GetBuilder<AddCarController>(builder: (co) {
          return RadioGroup(
            label: L10n.isDamage.tr,
            spacingTitle: 10,
            titleOption1: L10n.yes.tr,
            valueOption1: controller.yesNo.first,
            titleOption2: L10n.no.tr,
            valueOption2: controller.yesNo.last,
            value: controller.isDamage.value,
            onChanged: controller.onChangeIsDamage,
          );
        }),
        // GetBuilder<AddCarController>(builder: (co) {
        //   return RadioGroup(
        //     label: L10n.shakeCheck.tr,
        //     spacingTitle: 10,
        //     titleOption1: L10n.yes.tr,
        //     valueOption1: controller.yesNo.first,
        //     titleOption2: L10n.no.tr,
        //     valueOption2: controller.yesNo.last,
        //     value: controller.shakeCheck.value,
        //     onChanged: controller.onChangeShakeCheck,
        //   );
        // }),
        // GetBuilder<AddCarController>(builder: (co) {
        //   return RadioGroup(
        //     label: L10n.recolor.tr,
        //     spacingTitle: 48,
        //     titleOption1: L10n.yes.tr,
        //     valueOption1: controller.yesNo.first,
        //     titleOption2: L10n.no.tr,
        //     valueOption2: controller.yesNo.last,
        //     value: controller.reColor.value,
        //     onChanged: controller.onChangeReColor,
        //   );
        // }),
      ],
    );
  }
}
