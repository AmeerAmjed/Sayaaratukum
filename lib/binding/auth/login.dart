import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/auth/login.dart';
import 'package:sayaaratukum/data/services/remote/auth/login.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginServices>(() => LoginServices());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
