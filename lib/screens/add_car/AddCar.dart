import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/controllers/user/add_car.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/add_car/components/radio_group.dart';
import 'package:sayaaratukum/screens/add_car/components/row_two_widget.dart';
import 'package:sayaaratukum/screens/add_car/components/year_brand.dart';
import 'package:sayaaratukum/widgets/appbars.dart';
import 'package:sayaaratukum/widgets/buttons.dart';
import 'package:sayaaratukum/widgets/dropdown_list.dart';
import 'package:sayaaratukum/widgets/input.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class AddCarScreen extends GetView<AddCarController> {
  const AddCarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime yesterday = DateTime.now().subtract(Duration(days: 1));
    final List<Widget> yearItems = List<Widget>.generate(50, (int index) {
      final int year = DateTime.now().year - index;
      return Text(
        year.toString(),
        style: TextStyle(fontSize: 20.0),
      );
    });
    int selectedYear = DateTime.now().year;
    return Scaffold(
      appBar: AppBars(
        title: L10n.addCar.tr,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const VerticalSpace24(),
                // GetBuilder<AddCarController>(builder: (con) {
                //   return ProgressState(
                //     myOrderState: con.onPageIndex.value,
                //   );
                // }),
                const VerticalSpace24(),
                Expanded(
                  flex: 2,
                  child: PageView.builder(
                    controller: controller.pageController,
                    onPageChanged: controller.onPageIndex,
                    itemCount: controller.totalPageAddCar,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          InputAuth(
                            controller: TextEditingController(),
                            label: "Asdasd",
                            keyboardType: TextInputType.text,
                          ),
                          const VerticalSpace8(),
                          RowTwoWidget(
                            leftWidget: DropdownList(
                              margin: const EdgeInsets.only(
                                left: 16,
                              ),
                              label: L10n.brand.tr,
                              onChanged: controller.onChangeBrand,
                              items: controller.brands
                                  .map((e) => e.title)
                                  .toList(),
                            ),
                            rightWidget:
                            GetBuilder<AddCarController>(builder: (co) {
                              return DropdownList(
                                label: L10n.model.tr,
                                onChanged: (value) {},
                                items: co.getModelByBrandId(),
                                margin: const EdgeInsets.only(
                                  right: 16,
                                ),
                              );
                            }),
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
                            validator: (value) =>
                                ValidatorInput.checkValidateIsRequired(
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
                          GetBuilder<AddCarController>(builder: (co) {
                            return RadioGroup(
                              label: L10n.recolor.tr,
                              spacingTitle: 48,
                              titleOption1: L10n.yes.tr,
                              valueOption1: controller.yesNo.first,
                              titleOption2: L10n.no.tr,
                              valueOption2: controller.yesNo.last,
                              value: controller.reColor.value,
                              onChanged: controller.onChangeReColor,
                            );
                          }),
                          GetBuilder<AddCarController>(builder: (co) {
                            return RadioGroup(
                              label: L10n.shakeCheck.tr,
                              spacingTitle: 10,
                              titleOption1: L10n.yes.tr,
                              valueOption1: controller.yesNo.first,
                              titleOption2: L10n.no.tr,
                              valueOption2: controller.yesNo.last,
                              value: controller.shakeCheck.value,
                              onChanged: controller.onChangeShakeCheck,
                            );
                          }),
                          GetBuilder<AddCarController>(builder: (co) {
                            return RadioGroup(
                              label: L10n.gearBox.tr,
                              spacingTitle:38,
                              titleOption1: L10n.automatic.tr,
                              valueOption1: controller.typeGearBox.first,
                              titleOption2: L10n.manual.tr,
                              valueOption2: controller.typeGearBox.last,
                              value: controller.gearBox.value,
                              onChanged: controller.onChangeGearBox,
                            );
                          })
                        ],
                      );
                    },
                  ),
                ),

                const SizedBox(height: 48),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Text(
                    "sdasdasdasd",
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.black.withOpacity(.7),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Spacer()
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GetBuilder<AddCarController>(builder: (con) {
                  return Row(
                    children: [
                      if (con.onPageIndex.value != 0)
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 8.0,
                          ),
                          child: Buttons(
                            label: L10n.back.tr,
                            fullBackground: false,
                            width: 100,
                            colorOnButton: Get.textTheme.labelMedium?.color,
                            onPressed: controller.backward,
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      // const Space(width: 32.0),
                      Obx(() {
                        return Expanded(
                          flex: 2,
                          child: Buttons(
                            label: controller.isLastPage
                                ? L10n.publish.tr
                                : L10n.next.tr,
                            fullBackground: true,
                            onPressed: controller.forward,
                            padding: EdgeInsets.zero,
                          ),
                        );
                      })
                    ],
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
