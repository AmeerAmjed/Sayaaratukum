
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/data/services/api.dart';
import 'package:sayaaratukum/data/services/remote/service.dart';

class CheckCodResetPasswordServices extends BaseService {
  static CheckCodResetPasswordServices get instance => Get.find();

  Future<Response> checkOTP(Map<String, dynamic> body) async {
    try {
      Response response = await post("${ApiEndpoint.checkCode}?lang=$lang", body);
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error LoginService checkOTP $e");
      return Future.error(e);
    }
  }



}
