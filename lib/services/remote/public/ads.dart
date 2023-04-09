import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/services/api.dart';
import 'package:sayaaratukum/services/remote/service.dart';

class AdsServices extends BaseService {
  static AdsServices get instance => Get.find();

  Future<Response> getAds({
    required int page,
    required int limit,
  }) async {
    try {
      String url = pagination(ApiEndpoint.ads, page: page, limit: limit);
      Response response = await get(url);
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error AdsServices getAllTools $e");
      return Future.error(e);
    }
  }
}
