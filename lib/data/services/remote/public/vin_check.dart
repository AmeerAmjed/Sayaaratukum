import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/data/services/api.dart';
import 'package:sayaaratukum/data/services/remote/service.dart';

class VinCheckServices extends BaseService {
  static VinCheckServices get instance => Get.find();

  Future<Response> addCheck(Map<String, String> body) async {
    try {
      Response response = await post("${ApiEndpoint.vinCheck}?lang=$lang", body);
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error VinCheckServices addCheck $e");
      return Future.error(e);
    }
  }
}
