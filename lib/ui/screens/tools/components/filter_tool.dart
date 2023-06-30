import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/domain/controllers/public/filter/filter_car.dart';
import 'package:sayaaratukum/domain/controllers/public/filter/filter_tool.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/screens/add_car/components/radio_group.dart';
import 'package:sayaaratukum/ui/screens/add_car/components/row_two_widget.dart';
import 'package:sayaaratukum/ui/widgets//dropdown_list.dart';
import 'package:sayaaratukum/ui/widgets//error.dart';
import 'package:sayaaratukum/ui/widgets//header_filter_cleaner.dart';
import 'package:sayaaratukum/ui/widgets//input.dart';
import 'package:sayaaratukum/ui/widgets//loading.dart';
import 'package:sayaaratukum/ui/widgets//vertical_space.dart';

class FilterTool extends GetView<FilterToolController> {
  const FilterTool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
        onError: (e) => ErrorScreen(
              textError: e.toString(),
              onPressed: () {
                controller.init();
              },
            ),
        onLoading: const Center(child: Loading()), (state) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HeaderFilterCleaner(
            onPressedClean: controller.cleanFilter,
          ),
          const VerticalSpace8(),
          const VerticalSpace8(),
          InputAuth(
            controller: controller.serialNumber,
            label: L10n.serialNumber.tr,
            keyboardType: TextInputType.number,
          ),
          const VerticalSpace4(),
          RowTwoWidget(
            leftWidget: DropdownList(
              keyDropdownList: controller.brandFormKey,
              margin: const EdgeInsets.only(
                left: 2,
              ),
              label: L10n.brand.tr,
              onChanged: controller.onChangeBrand,
              items: controller.brands.map((e) => e.title).toList(),
              value: controller.idBrandSelected != 0
                  ? controller.brands
                      .where((e) => e.id == controller.idBrandSelected)
                      .first
                      .title
                  : null,
            ),
            rightWidget: GetBuilder<FilterCarController>(builder: (co) {
              return DropdownList(
                keyDropdownList: controller.modelBrandFormKey,
                label: L10n.model.tr,
                onChanged: controller.onChangeModelBrand,
                items: controller.brands
                    .map((brand) => brand.id == controller.idBrandSelected
                        ? brand.models.map((model) => model.name).toList()
                        : [])
                    .expand((list) => list)
                    .cast<String>()
                    .toList(),
                margin: const EdgeInsets.only(
                  right: 2,
                ),
              );
            }),
          ),
          const VerticalSpace4(),
          GetBuilder<FilterToolController>(builder: (co) {
            var idCategory = controller.idCategorySelected.value;
            return DropdownList(
              label: L10n.category.tr,
              keyDropdownList: controller.categoryFormKey,
              onChanged: controller.onChangeCategory,
              items: co.getCategoryListString(),
              onTap: controller.tryGetCategoriesWhenFailed,
              value: controller.idCategorySelected.value != 0
                  ? controller.category
                      .where((e) => e.id == controller.idCategorySelected.value)
                      .first
                      .name
                  : null,
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
    });
  }
}
