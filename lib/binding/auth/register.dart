import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/data/services/remote/auth/register.dart';
import 'package:sayaaratukum/domain/controllers/auth/register.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterServices>(() => RegisterServices());
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}
