import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/models/engine_power_type.dart';
import 'package:sayaaratukum/services/remote/user/engine_power_type.dart';

class EnginePowersController extends BaseController {
  static EnginePowersController get instance => Get.find();
  var enginePowers = <EnginePowerModel>[].obs.toList(growable: true);

  @override
  void onInit() {
    getEnginePowers();
    super.onInit();
  }

  Future<void> getEnginePowers() async {
    try {
      await EnginePowerTypeServices.instance.getAllType().then((response) {
        if (response.isOk) {
          List<EnginePowerModel> resultCategory =
              EnginePowerModel.listFromJson(response.body[data]);
          // enginePowers.addAll(resultCategory);
          enginePowers.assignAll(resultCategory);
          update();
        }
      });
    } on Response catch (response) {
      print("EnginePowersController getEnginePowers${response.statusCode}");
    }
  }
}
