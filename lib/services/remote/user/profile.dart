import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/services/api.dart';
import 'package:sayaaratukum/services/remote/service.dart';

class ProfileService extends BaseService {
  static ProfileService get instance => Get.find();

  Future<Response> updateProfile(String firstName, String lastName) async {
    var userInfo = {
      "first_name": firstName,
      "last_name": lastName,
    };
    try {
      Response response = await post(ApiEndpoint.updateProfile, userInfo);
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error ProfileService updateProfile $e");
      return Future.error(e);
    }
  }
}
