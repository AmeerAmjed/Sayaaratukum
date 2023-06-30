import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/domain/controllers/user/add_tool.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/screens/add_car/components/radio_group.dart';
import 'package:sayaaratukum/ui/screens/add_car/components/row_two_widget.dart';
import 'package:sayaaratukum/ui/screens/add_tool/components/image_tool.dart';
import 'package:sayaaratukum/ui/widgets//dropdown_list.dart';
import 'package:sayaaratukum/ui/widgets//input.dart';
import 'package:sayaaratukum/ui/widgets//vertical_space.dart';

class FormAddTool extends GetView<AddToolController> {
  const FormAddTool({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: ListView(
        children: [
          const VerticalSpace8(),
          InputAuth(
            controller: controller.name,
            label: L10n.name.tr,
            keyboardType: TextInputType.name,
          ),
          const VerticalSpace4(),
          RowTwoWidget(
            leftWidget: DropdownList(
              margin: const EdgeInsets.only(
                left: 2,
              ),
              label: L10n.brands.tr,
              onChanged: controller.onChangeBrand,
              value: controller.brandsValue,
              items: controller.brands.map((e) => e.title).toList(),
            ),
            rightWidget: GetBuilder<AddToolController>(builder: (co) {
              return DropdownList(
                keyDropdownList: controller.keyManagerModelBrand,
                label: L10n.model.tr,
                onChanged: controller.onChangeModelBrand,
                value: controller.modelBrandValue,
                items: co.getModelByBrandId(),
                margin: const EdgeInsets.only(
                  right: 2,
                ),
              );
            }),
          ),
          const VerticalSpace4(),
          GestureDetector(
            onTap: controller.tryGetCategoriesWhenFailed,
            child: GetBuilder<AddToolController>(builder: (co) {
              return DropdownList(
                label: L10n.category.tr,
                onChanged: controller.onChangeCategory,
                items: co.getCategoryListString(),
                value: co.categoryValue.value,
                onTap: controller.tryGetCategoriesWhenFailed,
              );
            }),
          ),
          const VerticalSpace8(),
          InputAuth(
            controller: controller.serialNumber,
            label: L10n.serialNumber.tr,
            keyboardType: TextInputType.number,
          ),
          const VerticalSpace8(),
          InputAuth(
            controller: controller.price,
            label: L10n.price.tr,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              // CurrencyInputFormatter()
            ],
            keyboardType: TextInputType.number,
          ),
          const VerticalSpace8(),
          InputAuth(
            controller: controller.description,
            label: L10n.description.tr,
            keyboardType: TextInputType.text,
            maxLines: 3,
          ),
          const VerticalSpace8(),
          const ImageTool(),
          const VerticalSpace8(),
          GetBuilder<AddToolController>(builder: (co) {
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
      ),
    );
  }
}
