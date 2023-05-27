import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/services/api.dart';
import 'package:sayaaratukum/services/remote/service.dart';

class SearchServices extends BaseService {
  static SearchServices get instance => Get.find();

  Future<Response> searchCarByBrandId(
    String idBrand, {
    required int page,
    required int limit,
  }) async {
    try {
      String url = pagination(ApiEndpoint.cars, page: page, limit: limit);
      Response response = await get("$url&brand=$idBrand");
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error SearchServices searchCarByBrandId $e");
      return Future.error(e);
    }
  }
}
