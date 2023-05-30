import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/controllers/public/filter/filter_car.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/add_car/components/row_two_widget.dart';
import 'package:sayaaratukum/screens/add_car/components/year_brand.dart';
import 'package:sayaaratukum/theme/color.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/util/currency_input_formatter.dart';
import 'package:sayaaratukum/util/hard_code.dart';
import 'package:sayaaratukum/widgets/buttons.dart';
import 'package:sayaaratukum/widgets/dropdown_list.dart';
import 'package:sayaaratukum/widgets/horizontal_space.dart';
import 'package:sayaaratukum/widgets/input.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';
import 'package:sayaaratukum/widgets/years.dart';

class FilterCar extends GetView<FilterCarController> {
  const FilterCar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HorizontalSpace16(),
            Text(
              L10n.filterBy.tr,
              style: Get.textTheme.labelLarge,
            ),
            const Spacer(),
            Buttons(
              height: 40,
              width: 150,
              iconSize: 16,
              colorOnButton: ColorSystem.colorOptional,
              background: Colors.transparent,
              label: L10n.cleanFilter.tr,
              iconRow: Iconsax.filter_remove,
              onPressed: controller.cleanFilter,
            )
          ],
        ),
        const VerticalSpace8(),
        RowTwoWidget(
          leftWidget: DropdownList(
            keyDropdownList: controller.brandFormKey,
            margin: const EdgeInsets.only(
              left: 16,
            ),
            label: L10n.brand.tr,
            onChanged: controller.onChangeBrand,
            items: controller.brands.map((e) => e.title).toList(),
          ),
          rightWidget: GetBuilder<FilterCarController>(builder: (co) {
            return DropdownList(
              keyDropdownList: controller.modelBrandFormKey,
              label: L10n.model.tr,
              onChanged: controller.onChangeModelBrand,
              items: co.getModelByBrandId(),
              margin: const EdgeInsets.only(
                right: 16,
              ),
            );
          }),
        ),
        RowTwoWidget(
          leftWidget: GetBuilder<FilterCarController>(builder: (con) {
            return DropdownList(
              keyDropdownList: controller.enginePowerKey,
              label: L10n.enginePower.tr,
              margin: const EdgeInsets.only(
                left: Constants.spacing16,
              ),
              onChanged: controller.onChangeEnginePower,
              items: con.enginePowers.map((e) => e.name).toList(),
            );
          }),
          rightWidget: DropdownList(
            keyDropdownList: controller.engineCapacityKey,
            label: L10n.engineCapacity.tr,
            margin: const EdgeInsets.only(
              right: Constants.spacing16,
            ),
            onChanged: controller.onChangeEngineCapacity,
            items: HardCode.engineSizes.map((e) => e.toString()).toList()
              ..sort(),
          ),
        ),
        RowTwoWidget(
          leftWidget: InputAuth(
            controller: controller.minPrice,
            label: L10n.minPrice.tr,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CurrencyInputFormatter()
            ],
            keyboardType: TextInputType.number,
            margin: const EdgeInsets.only(
              left: 16,
            ),
            // prefixIcon: Iconsax.icon,
            // suffixIcon: IconButton(
            //   onPressed: () {
            //     print(" object ");
            //   },
            //   icon: Icon(Iconsax.icon),
            // ),
          ),
          rightWidget: InputAuth(
            controller: controller.maxPrice,
            label: L10n.maxPrice.tr,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CurrencyInputFormatter()
            ],
            keyboardType: TextInputType.number,
            margin: const EdgeInsets.only(
              right: 16,
            ),
          ),
        ),
        RowTwoWidget(
          leftWidget: InputAuth(
            readOnly: true,
            label: L10n.fromYear.tr,
            controller: controller.fromYear,
            onTap: () async {
              yearBrand(
                context,
                controller.onSelectFromYear,
                yearItems,
              );
            },
            margin: const EdgeInsets.only(
              left: 16,
            ),
          ),
          rightWidget: InputAuth(
            readOnly: true,
            label: L10n.toYear.tr,
            controller: controller.toYear,
            onTap: () async {
              yearBrand(
                context,
                controller.onSelectToYear,
                yearItems,
              );
            },
            margin: const EdgeInsets.only(
              right: 16,
            ),
          ),
        ),
        const VerticalSpace4(),
        DropdownList(
          label: L10n.governorate.tr,
          onChanged: controller.onChangeBrand,
          items: HardCode.provinces,
        ),
      ],
    );
  }
}
