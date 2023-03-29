import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:sayaaratukum/widgets/custom_snackbar.dart';

abstract class BaseController extends GetxController {
  navigateTo(String toPage) {
    try {
      Get.toNamed(toPage);
    } catch (err) {
      print("error navigateTo $toPage");
    }
  }

  onError(String title, String message,
      {Duration duration = const Duration(seconds: 4)}) {
    customSnackBar(
      title,
      message,
      marginBottom: .0,
      duration: duration,
    );
  }
}
