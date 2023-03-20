import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/services/api.dart';
import 'package:sayaaratukum/services/remote/service.dart';

class BrandServices extends BaseService {
  static BrandServices get instance => Get.find();

  Future<Response> getAllBrand({
    required int page,
    required int limit,
  }) async {
    try {
      String urlBrand = pagination(ApiEndpoint.brand, page: page, limit: limit);
      Response response = await get(urlBrand);
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error BrandServices getAllBrand $e");
      return Future.error(e);
    }
  }
}
