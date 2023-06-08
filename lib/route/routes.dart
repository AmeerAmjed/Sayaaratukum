import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:sayaaratukum/binding/auth/login.dart';
import 'package:sayaaratukum/binding/auth/register.dart';
import 'package:sayaaratukum/binding/public/car_details.dart';
import 'package:sayaaratukum/binding/public/main_tab.dart';
import 'package:sayaaratukum/binding/public/search/search_car.dart';
import 'package:sayaaratukum/binding/public/search/search_tool.dart';
import 'package:sayaaratukum/binding/public/store_car_details.dart';
import 'package:sayaaratukum/binding/public/store_tool_details.dart';
import 'package:sayaaratukum/binding/public/tool_details.dart';
import 'package:sayaaratukum/binding/user/add_car.dart';
import 'package:sayaaratukum/binding/user/add_tool.dart';
import 'package:sayaaratukum/binding/user/my_subscribe_store.dart';
import 'package:sayaaratukum/binding/user/profile.dart';
import 'package:sayaaratukum/binding/user/update/email.dart';
import 'package:sayaaratukum/binding/user/update/password.dart';
import 'package:sayaaratukum/binding/user/update/profile.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/screens/add_car/AddCar.dart';
import 'package:sayaaratukum/screens/add_tool/add_tool.dart';
import 'package:sayaaratukum/screens/auth/login/login.dart';
import 'package:sayaaratukum/screens/auth/register/register.dart';
import 'package:sayaaratukum/screens/auth/welcom/welcome.dart';
import 'package:sayaaratukum/screens/details/car/car_details.dart';
import 'package:sayaaratukum/screens/details/store/store_details.dart';
import 'package:sayaaratukum/screens/details/store_tool/store_tool.dart';
import 'package:sayaaratukum/screens/details/tool/tool_details.dart';
import 'package:sayaaratukum/screens/edite/email/email.dart';
import 'package:sayaaratukum/screens/edite/password/password.dart';
import 'package:sayaaratukum/screens/edite/profile/profile.dart';
import 'package:sayaaratukum/screens/main.dart';
import 'package:sayaaratukum/screens/my_%20subscribe_store/my_subscribe_store.dart';
import 'package:sayaaratukum/screens/profile/profile.dart';
import 'package:sayaaratukum/screens/search/car/search_car.dart';
import 'package:sayaaratukum/screens/search/car_by_brand/search_car_by_brand.dart';
import 'package:sayaaratukum/screens/search/tool/search_tool.dart';
import 'package:sayaaratukum/screens/view_all/brand/view_all_brand.dart';

import '../binding/public/search/search_car_by_brand.dart';

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
        name: RouteScreen.searchCar,
        page: () => const SearchCar(),
        binding: SearchCarBinding(),
      ),
      GetPage(
        name: RouteScreen.searchTool,
        page: () => const SearchTool(),
        binding: SearchToolBinding(),
      ),
      GetPage(
        name: RouteScreen.mySubscribeStore,
        page: () => const MySubscribeStore(),
        binding: MySubscribeStoreBinding(),
      ),
      GetPage(
        name: RouteScreen.storeCarDetails,
        page: () => const StoreCarDetails(),
        binding: StoreCarDetailsBinding(),
      ),
      GetPage(
        name: RouteScreen.carDetails,
        page: () => const CarDetails(),
        binding: CarDetailsBinding(),
      ),
      GetPage(
        name: RouteScreen.toolDetails,
        page: () => const ToolDetails(),
        binding: ToolDetailsBinding(),
      ),
      GetPage(
        name: RouteScreen.storeToolDetails,
        page: () => const StoreToolDetails(),
        binding: StoreToolDetailsBinding(),
      ),
      GetPage(
        name: RouteScreen.updateProfile,
        page: () => const UpdateProfile(),
        binding: UpdateProfileBinding(),
      ),
      GetPage(
        name: RouteScreen.updatePassword,
        page: () => const UpdatePassword(),
        binding: UpdatePasswordBinding(),
      ),
      GetPage(
        name: RouteScreen.updateEmail,
        page: () => const UpdateEmail(),
        binding: UpdateEmailBinding(),
      )
    ];
