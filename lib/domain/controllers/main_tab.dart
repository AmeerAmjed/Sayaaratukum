import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/binding/public/favorite.dart';
import 'package:sayaaratukum/binding/public/home.dart';
import 'package:sayaaratukum/binding/public/stores.dart';
import 'package:sayaaratukum/binding/public/tools.dart';
import 'package:sayaaratukum/domain/controllers/controller.dart';
import 'package:sayaaratukum/ui/screens/favorite/favorite.dart';
import 'package:sayaaratukum/ui/screens/home/home.dart';
import 'package:sayaaratukum/ui/screens/stores/stores.dart';
import 'package:sayaaratukum/ui/screens/tools/tools.dart';
import 'package:sayaaratukum/util/main_tab_page.dart';

class MainTabController extends BaseController {
  static MainTabController get instance => Get.find();

  late GlobalKey<ScaffoldState> scaffoldKey;

  var currentIndex = 0.obs;
  int lastPosition = 0;

  final pages = <String>[
    MainTabPage.home,
    MainTabPage.tools,
    MainTabPage.stores,
    MainTabPage.favorite,
  ];

  @override
  void onInit() {
    super.onInit();
    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  resetRoute() {
    Get.back();
    changePage(0);
  }

  void changePage(int index) {
    currentIndex.value = index;
    if (currentIndex.value != lastPosition) {
      lastPosition = index;
      Get.offNamedUntil(
        pages[index],
        (page) => page.settings.name == MainTabPage.home,
        id: 1,
      );
    }
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == MainTabPage.home) {
      return GetPageRoute(
        settings: settings,
        page: () => const HomeScreen(),
        binding: HomeBinding(),
        transition: Transition.native,
        transitionDuration: const Duration(milliseconds: 0),
      );
    }

    if (settings.name == MainTabPage.tools) {
      return GetPageRoute(
        settings: settings,
        page: () => const ToolsScreen(),
        binding: ToolsBinding(),
        transition: Transition.native,
        transitionDuration: const Duration(milliseconds: 0),
      );
    }
    if (settings.name == MainTabPage.stores) {
      return GetPageRoute(
        settings: settings,
        page: () => const StoresScreen(),
        binding: StoresBinding(),
        transition: Transition.native,
        transitionDuration: const Duration(milliseconds: 0),
      );
    }

    if (settings.name == MainTabPage.favorite) {
      return GetPageRoute(
        settings: settings,
        page: () => const FavoriteScreen(),
        binding: FavoriteBinding(),
        transition: Transition.native,
        transitionDuration: const Duration(milliseconds: 0),
      );
    }

    return null;
  }
}
