import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/user/add_car.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/add_car/components/state_page.dart';
import 'package:sayaaratukum/widgets/appbars.dart';
import 'package:sayaaratukum/widgets/buttons.dart';
import 'package:sayaaratukum/widgets/vertical_space.dart';

class AddCarScreen extends GetView<AddCarController> {
  const AddCarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                GetBuilder<AddCarController>(builder: (con) {
                  return ProgressState(
                    myOrderState: con.onPageIndex.value,
                  );
                }),
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
                          Expanded(
                            child: Center(
                              child: Icon(
                                Icons.confirmation_num_sharp,
                                size: 50,
                              ),
                            ),
                          ),
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
