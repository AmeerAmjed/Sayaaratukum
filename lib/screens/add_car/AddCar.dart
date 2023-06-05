import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/user/add_car.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/widgets/appbars.dart';
import 'package:sayaaratukum/widgets/buttons.dart';

import 'components/state_page.dart';

class AddCarScreen extends GetView<AddCarController> {
  const AddCarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBars(
        title: L10n.addCar.tr,
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    GetBuilder<AddCarController>(builder: (con) {
                      return ProgressState(
                        myOrderState: con.onPageIndex.value,
                      );
                    }),
                  ]),
                ),
              )
            ];
          },
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: controller.onPageIndex,
                  itemCount: controller.totalPageAddCar,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GetBuilder<AddCarController>(builder: (controller) {
                      return SingleChildScrollView(
                        child:
                            controller.stepForm[controller.onPageIndex.value],
                      );
                    });
                  },
                ),
              ),
              Padding(
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
                            disableWithShowLoading:
                            controller.disableSubmit.value,
                            label: controller.isLastPage
                                ? L10n.publish.tr
                                : L10n.next.tr,
                            fullBackground: true,
                            onPressed: () {
                              if (con.onPageIndex.value == 0) {
                                if (con.checkValidationForm1()) {
                                  controller.forward();
                                }
                              } else if (con.onPageIndex.value == 1) {
                                if (con.checkValidationForm2()) {
                                  controller.forward();
                                }
                              } else if (con.onPageIndex.value == 2) {
                                if (con.checkValidationForm3()) {
                                  controller.addCar();
                                }
                              }
                            },
                            padding: EdgeInsets.zero,
                          ),
                        );
                      })
                    ],
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
