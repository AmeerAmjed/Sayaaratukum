import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/auth/login.dart';
import 'package:sayaaratukum/services/remote/auth/login.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginServices>(() => LoginServices());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
