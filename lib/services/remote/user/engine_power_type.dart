import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/services/api.dart';
import 'package:sayaaratukum/services/remote/service.dart';

class EnginePowerTypeServices extends BaseService {
  static EnginePowerTypeServices get instance => Get.find();

  Future<Response> getAllType() async {
    try {
      Response response = await get(ApiEndpoint.enginePowerType);
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error EnginePowerTypeServices getAllType $e");
      return Future.error(e);
    }
  }
}
