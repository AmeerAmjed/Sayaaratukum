import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/controllers/main_tab.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/screens/components/drawer.dart';
import 'package:sayaaratukum/screens/components/image_user.dart';
import 'package:sayaaratukum/util/main_tab_page.dart';
import 'package:sayaaratukum/widgets/box.dart';
import 'package:sayaaratukum/widgets/buttons.dart';
import 'package:sayaaratukum/widgets/custom_snackbar_login.dart';

import '../widgets/appbars.dart';

class MainTab extends GetView<MainTabController> {
  const MainTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: controller.scaffoldKey,
      // appBar: AppBar(),
      appBar: AppBars(
        // leadingWidth: 50,
        widget: Container(
          height: 50,
          width: 50,
          child: InkWell(
            onTap: () {
              controller.scaffoldKey.currentState?.openDrawer();
            },
            child: const Box(size: 48.0, child: ImageUser()),
          ),
        ),
        // widgetAction: GetBuilder<Application>(
        //   builder: (c) {
        //     return Application.instance.isLogin
        //         ? Buttons(
        //             height: 35,
        //             width: 150,
        //             label: Application.instance.isStoreTool()
        //                 ? L10n.buyTool.tr
        //                 : L10n.buyYourCar.tr,
        //             onPressed: () {
        //               if (Application.instance.isStoreTool()) {
        //                 Application.instance.navToAddTool();
        //               } else {
        //                 Get.toNamed(RouteScreen.addCar);
        //               }
        //             },
        //           )
        //         : Buttons(
        //             height: 35,
        //       width: 150,
        //       label: L10n.buyYourCar.tr,
        //             onPressed: () {
        //               snackBarToLogin();
        //             },
        //           );
        //   },
        // ),
        actions: const [
          FittedBox(
            child: Box(
              size: 38,
              child: Icon(
                Iconsax.notification,
                size: 18,
              ),
            ),
          )
        ],
      ),
      drawer: DrawerApp(width: size.width ),
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: MainTabPage.home,
        onGenerateRoute: controller.onGenerateRoute,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: controller.changePage,
          currentIndex: controller.currentIndex.value,
          items: [
            // cupertino_icons
            BottomNavigationBarItem(
              icon: const Icon(Iconsax.home),
              activeIcon: const Icon(Iconsax.home_15),
              label: L10n.home.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.hammer),
              activeIcon: const Icon(CupertinoIcons.hammer_fill),
              label: L10n.spareParts.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Iconsax.shop),
              activeIcon: const Icon(Iconsax.shop5),
              label: L10n.stores.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Iconsax.heart),
              activeIcon: const Icon(Iconsax.heart5),
              label: L10n.favorite.tr,
            ),
          ],
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}
