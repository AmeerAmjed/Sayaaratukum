import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:sayaaratukum/ui/route/page.dart';
import 'package:sayaaratukum/ui/theme//color.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/ui/widgets//custom_snackbar.dart';

abstract class BaseController extends GetxController with ValidatorInput {

  String message = 'message';
  String data = 'data';
  String statusResponse = 'status';
  String success = 'success';

  navigateTo(String toPage) {
    try {
      Get.toNamed(toPage);
    } catch (err) {
      print("error navigateTo $toPage");
    }
  }

  carDetails(int id) {
    Get.toNamed(
      RouteScreen.carDetails,
      arguments: {
        Constants.idCarKey: id.toString(),
      },
    );
  }

  storeTools(String id) {
    Get.toNamed(
      RouteScreen.storeToolDetails,
      arguments: {
        Constants.idToolStoreKey: id,
      },
    );
  } 
  
  storeCars(String id) {
    Get.toNamed(
      RouteScreen.storeCarDetails,
      arguments: {
        Constants.idStoreKey: id,
      },
    );
  }

  navigateToUpdateStoreProfile(int id) {
    Get.toNamed(
      RouteScreen.updateStoreProfile,
      arguments: {
        Constants.idStoreUpdateStoreProfile: id.toString(),
      },
    );
  }

  toolDetails(int id) {
    Get.toNamed(
      RouteScreen.toolDetails,
      arguments: {
        Constants.idToolKey: id.toString(),
      },
    );
  }

  navToAddTool({int idUpdateTool = 0}) {
    Get.toNamed(
      RouteScreen.addTool,
      arguments: {
        Constants.idUpdateTool: idUpdateTool,
      },
    );
  }

  navToAddCar({int? id = 0}) {
    Get.toNamed(
      RouteScreen.addCar,
      arguments: {
        Constants.idUpdateCarKey: id,
      },
    );
  }

  onError(
    String message, {
    Duration duration = const Duration(seconds: 1),
  }) {
    customSnackBar(
      message,
      marginBottom: .0,
      duration: duration,
      backgroundColor: ColorSystem.colorDanger,
    );
  }

  showMessage(String message, {
    Duration duration = const Duration(seconds: 1),
    Widget? action,
  }) {
    customSnackBar(
      message,
      marginBottom: .0,
      duration: duration,
      backgroundColor: ColorSystem.snackBar,
      mainButton: action,
    );
  }
}

mixin ValidatorInput {
  static const List<String> keyNumberPhoneIraq = ['078', '077', '075', '079'];

  static String? checkValidateIsRequired(String label, String? value) {
    if (value == null || value.isEmpty) {
      return label;
    }
    return null;
  }

}
