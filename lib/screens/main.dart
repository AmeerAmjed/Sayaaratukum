import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayaaratukum/controllers/main_tab.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/util/main_tab_page.dart';

class MainTab extends GetView<MainTabController> {
  const MainTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            BottomNavigationBarItem(
              icon: const Icon(
                Iconsax.home,
              ),
              label: L10n.home.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.grid_view_outlined),
              label: L10n.spareParts.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Iconsax.pen_tool,
              ),
              label: L10n.stores.tr,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Iconsax.favorite_chart),
              label: L10n.stores.tr,
            ),
          ],
          type: BottomNavigationBarType.fixed,
          iconSize: 28.0,
          unselectedItemColor: const Color(0xff747474),
        ),
      ),
      // appBar:
    );
  }
}
