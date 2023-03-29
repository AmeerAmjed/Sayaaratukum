import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:sayaaratukum/binding/public/login.dart';
import 'package:sayaaratukum/binding/public/main_tab.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/screens/auth/login/login.dart';
import 'package:sayaaratukum/screens/auth/welcom/welcome.dart';
import 'package:sayaaratukum/screens/main.dart';

List<GetPage> routes() =>
    [
      GetPage(
        name: RouteScreen.welcome,
        page: () => const WelcomeScreen(),
      ),
      GetPage(
        name: RouteScreen.mainTab,
        page: () => const MainTab(),
        binding: MainTabBinding(),
      ),
      GetPage(
        name: RouteScreen.login,
        page: () => const Login(),
        binding: LoginBinding(),
      )
    ];
