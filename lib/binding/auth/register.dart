import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/auth/login.dart';
import 'package:sayaaratukum/controllers/auth/register.dart';
import 'package:sayaaratukum/services/remote/auth/login.dart';
import 'package:sayaaratukum/services/remote/auth/register.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterServices>(() => RegisterServices());
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
