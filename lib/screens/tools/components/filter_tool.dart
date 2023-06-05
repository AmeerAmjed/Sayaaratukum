import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/controllers/public/filter/filter_car.dart';
import 'package:sayaaratukum/controllers/public/filter/filter_tool.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/add_car/components/radio_group.dart';
import 'package:sayaaratukum/screens/add_car/components/row_two_widget.dart';
import 'package:sayaaratukum/theme/color.dart';
import 'package:sayaaratukum/widgets/buttons.dart';
import 'package:sayaaratukum/widgets/dropdown_list.dart';
import 'package:sayaaratukum/widgets/horizontal_space.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class FilterTool extends GetView<FilterToolController> {
  const FilterTool({Key? key}) : super(key: key);

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
        const VerticalSpace4(),
        GetBuilder<FilterToolController>(builder: (co) {
          return DropdownList(
            label: L10n.category.tr,
            onChanged: controller.onChangeCategory,
            items: co.getCategoryListString(),
            onTap: controller.tryGetCategoriesWhenFailed,
          );
        }),
        const VerticalSpace8(),
        GetBuilder<FilterToolController>(builder: (co) {
          return RadioGroup(
            label: L10n.statusTool.tr,
            spacingTitle: 38,
            titleOption1: L10n.newTool.tr,
            valueOption1: controller.statusTool.first,
            titleOption2: L10n.usedTool.tr,
            valueOption2: controller.statusTool.last,
            value: co.statusSelected.value,
            onChanged: co.onChangeStatus,
          );
        }),
      ],
    );
  }
}
