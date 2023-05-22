import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/user/add_tool.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/add_car/components/radio_group.dart';
import 'package:sayaaratukum/screens/add_car/components/row_two_widget.dart';
import 'package:sayaaratukum/screens/add_tool/components/image_tool.dart';
import 'package:sayaaratukum/widgets/appbars.dart';
import 'package:sayaaratukum/widgets/buttons.dart';
import 'package:sayaaratukum/widgets/dropdown_list.dart';
import 'package:sayaaratukum/widgets/input.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class AddTool extends GetView<AddToolController> {
  const AddTool({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        title: L10n.addTool.tr,
      ),
      body: Form(
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
                  left: 16,
                ),
                label: L10n.brand.tr,
                onChanged: controller.onChangeBrand,
                items: controller.brands.map((e) => e.title).toList(),
              ),
              rightWidget: GetBuilder<AddToolController>(builder: (co) {
                return DropdownList(
                  keyDropdownList: controller.keyManagerModelBrand,
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
            GetBuilder<AddToolController>(builder: (co) {
              return DropdownList(
                label: L10n.category.tr,
                onChanged: controller.onChangeCategory,
                items: co.getCategoryListString(),
                onTap: controller.tryGetCategoriesWhenFailed,
              );
            }),
            // const VerticalSpace8(),
            // InputAuth(
            //   controller: controller.color,
            //   label: L10n.color.tr,
            //   keyboardType: TextInputType.text,
            // ),
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
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: GetBuilder<AddToolController>(
          builder: (_) => Buttons(
            label: L10n.publish.tr,
            fullBackground: true,
            width: double.infinity,
            onPressed: () {
              if (controller.checkValidationForm()) {
                controller.addTool();
              }
            },
            disableWithShowLoading: controller.disableSubmit.value,
          ),
        ),
      ),
    );
  }
}
