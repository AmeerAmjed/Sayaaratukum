import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:sayaaratukum/binding/auth/login.dart';
import 'package:sayaaratukum/binding/auth/register.dart';
import 'package:sayaaratukum/binding/public/main_tab.dart';
import 'package:sayaaratukum/binding/user/add_car.dart';
import 'package:sayaaratukum/binding/user/add_tool.dart';
import 'package:sayaaratukum/binding/user/my_subscribe_store.dart';
import 'package:sayaaratukum/binding/user/profile.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/screens/add_car/AddCar.dart';
import 'package:sayaaratukum/screens/add_tool/add_tool.dart';
import 'package:sayaaratukum/screens/auth/login/login.dart';
import 'package:sayaaratukum/screens/auth/register/register.dart';
import 'package:sayaaratukum/screens/auth/welcom/welcome.dart';
import 'package:sayaaratukum/screens/main.dart';
import 'package:sayaaratukum/screens/my_%20subscribe_store/my_subscribe_store.dart';
import 'package:sayaaratukum/screens/profile/profile.dart';
import 'package:sayaaratukum/screens/search/car_by_brand/search_car_by_brand.dart';
import 'package:sayaaratukum/screens/view_all/brand/view_all_brand.dart';

import '../binding/public/search_car_by_brand.dart';

List<GetPage> routes() => [
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
      ),
      GetPage(
        name: RouteScreen.register,
        page: () => const Register(),
        binding: RegisterBinding(),
      ),
      GetPage(
        name: RouteScreen.profile,
        page: () => const Profile(),
        binding: ProfileBinding(),
      ),
      GetPage(
        name: RouteScreen.addCar,
        page: () => const AddCarScreen(),
        binding: AddCarBinding(),
      ),
      GetPage(
        name: RouteScreen.addTool,
        page: () => const AddTool(),
        binding: AddToolBinding(),
      ),
      GetPage(
        name: RouteScreen.viewAllBrand,
        page: () => const ViewAllBrand(),
      ),
      GetPage(
        name: RouteScreen.searchCarByBrand,
        page: () => const SearchCarByBrand(),
        binding: SearchCarByBrandIdBinding(),
      ),
      GetPage(
        name: RouteScreen.mySubscribeStore,
        page: () => const MySubscribeStore(),
        binding: MySubscribeStoreBinding(),
      )
    ];
