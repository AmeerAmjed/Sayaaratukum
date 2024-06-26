import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:sayaaratukum/binding/auth/check_code_reset_password.dart';
import 'package:sayaaratukum/binding/auth/login.dart';
import 'package:sayaaratukum/binding/auth/register.dart';
import 'package:sayaaratukum/binding/public/car_details.dart';
import 'package:sayaaratukum/binding/public/main_tab.dart';
import 'package:sayaaratukum/binding/public/search/search_car.dart';
import 'package:sayaaratukum/binding/public/search/search_car_by_brand.dart';
import 'package:sayaaratukum/binding/public/search/search_stores.dart';
import 'package:sayaaratukum/binding/public/search/search_tool.dart';
import 'package:sayaaratukum/binding/public/store_car_details.dart';
import 'package:sayaaratukum/binding/public/store_tool_details.dart';
import 'package:sayaaratukum/binding/public/tool_details.dart';
import 'package:sayaaratukum/binding/public/vin_check.dart';
import 'package:sayaaratukum/binding/user/add_car.dart';
import 'package:sayaaratukum/binding/user/add_tool.dart';
import 'package:sayaaratukum/binding/user/my_subscribe_store.dart';
import 'package:sayaaratukum/binding/user/profile.dart';
import 'package:sayaaratukum/binding/user/update/email.dart';
import 'package:sayaaratukum/binding/user/update/password.dart';
import 'package:sayaaratukum/binding/user/update/phone_number.dart';
import 'package:sayaaratukum/binding/user/update/profile.dart';
import 'package:sayaaratukum/binding/user/update/store.dart';
import 'package:sayaaratukum/binding/user/user_cars.dart';
import 'package:sayaaratukum/ui/route/page.dart';
import 'package:sayaaratukum/ui/screens/add_car/AddCar.dart';
import 'package:sayaaratukum/ui/screens/add_tool/add_tool.dart';
import 'package:sayaaratukum/ui/screens/auth/check_code_reset_password/check_code_reset_password.dart';
import 'package:sayaaratukum/ui/screens/auth/login/login.dart';
import 'package:sayaaratukum/ui/screens/auth/register/register.dart';
import 'package:sayaaratukum/ui/screens/auth/welcom/welcome.dart';
import 'package:sayaaratukum/ui/screens/details/car/car_details.dart';
import 'package:sayaaratukum/ui/screens/details/store/store_details.dart';
import 'package:sayaaratukum/ui/screens/details/store_tool/store_tool.dart';
import 'package:sayaaratukum/ui/screens/details/tool/tool_details.dart';
import 'package:sayaaratukum/ui/screens/details/user_cars/user_cars.dart';
import 'package:sayaaratukum/ui/screens/edite/email/email.dart';
import 'package:sayaaratukum/ui/screens/edite/password/password.dart';
import 'package:sayaaratukum/ui/screens/edite/phone_number/phone_number.dart';
import 'package:sayaaratukum/ui/screens/edite/profile/profile.dart';
import 'package:sayaaratukum/ui/screens/edite/store/store.dart';
import 'package:sayaaratukum/ui/screens/main.dart';
import 'package:sayaaratukum/ui/screens/my_%20subscribe_store/my_subscribe_store.dart';
import 'package:sayaaratukum/ui/screens/notification/notification.dart';
import 'package:sayaaratukum/ui/screens/profile/profile.dart';
import 'package:sayaaratukum/ui/screens/search/car/search_car.dart';
import 'package:sayaaratukum/ui/screens/search/car_by_brand/search_car_by_brand.dart';
import 'package:sayaaratukum/ui/screens/search/stores/search_store.dart';
import 'package:sayaaratukum/ui/screens/search/tool/search_tool.dart';
import 'package:sayaaratukum/ui/screens/view_all/brand/view_all_brand.dart';
import 'package:sayaaratukum/ui/screens/vin_check/vin_ceck.dart';


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
      ),
      GetPage(
        name: RouteScreen.updatePhoneNumber,
        page: () => const UpdatePhoneNumber(),
        binding: UpdatePhoneNumberBinding(),
      ),
      GetPage(
        name: RouteScreen.updateStoreProfile,
        page: () => const UpdateStoreProfile(),
        binding: UpdateStoreProfileBinding(),
      ),
      GetPage(
        name: RouteScreen.notification,
        page: () => const Notification(),
      ),
      GetPage(
        name: RouteScreen.userCars,
        page: () => const UserCars(),
        binding: UserCarsBinding(),
      ),
      GetPage(
        name: RouteScreen.vinCheck,
        page: () => const VinCheck(),
        binding: VinCheckBinding(),
      ),
      GetPage(
        name: RouteScreen.checkOTPResetPassword,
        page: () => const CheckCodResetPassword(),
        binding: CheckCodResetPasswordBinding(),
      ),
      GetPage(
        name: RouteScreen.searchStore,
        page: () => const SearchStores(),
        binding: SearchStoresBinding(),
      )
    ];
