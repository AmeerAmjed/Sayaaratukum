import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/models//register.dart';
import 'package:sayaaratukum/data/services/api.dart';
import 'package:sayaaratukum/data/services/remote/service.dart';

class RegisterServices extends BaseService {
  static RegisterServices get instance => Get.find();

  Future<Response> register(RegisterModel body) async {
    try {
      Response response = await post("${ApiEndpoint.register}?lang=$lang", body.toJson());
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error RegisterServices register $e");
      return Future.error(e);
    }
  }
}
