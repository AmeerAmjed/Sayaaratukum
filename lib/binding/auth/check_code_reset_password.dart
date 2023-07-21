import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/data/services/remote/auth/check_code_reset_password.dart';
import 'package:sayaaratukum/domain/controllers/auth/check_code_reset_password.dart';

class CheckCodResetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CheckCodResetPasswordServices>(() => CheckCodResetPasswordServices());
    Get.lazyPut<CheckCodResetPasswordController>(() => CheckCodResetPasswordController());
  }
}
