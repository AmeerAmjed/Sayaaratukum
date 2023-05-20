import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/user/add_tool.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/add_car/components/row_two_widget.dart';
import 'package:sayaaratukum/widgets/appbars.dart';
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
      body: ListView(
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
            );
          }),
        ],
      ),
    );
  }
}
