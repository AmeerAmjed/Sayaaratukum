
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/services/api.dart';
import 'package:sayaaratukum/services/remote/service.dart';

class LoginServices extends BaseService {
  static LoginServices get instance => Get.find();

  Future<Response> login(Map<String, dynamic> body) async {
    try {
      Response response = await post("${ApiEndpoint.login}?lang=$lang", body);
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error LoginService Login $e");
      return Future.error(e);
    }
  }
}
