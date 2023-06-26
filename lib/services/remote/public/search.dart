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

  Future<Response> searchCar(
    Map<String, dynamic> body, {
    required int page,
    required int limit,
  }) async {
    String arg = Uri(queryParameters: body).query;

    try {
      String url = pagination(ApiEndpoint.cars, page: page, limit: limit);
      Response response = await get("$url&$arg");
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error SearchServices searchCar $e");
      return Future.error(e);
    }
  }

  Future<Response> searchTool(
    Map<String, dynamic> body, {
    required int page,
    required int limit,
  }) async {
    String arg = Uri(queryParameters: body).query;

    try {
      String url = pagination(ApiEndpoint.tool, page: page, limit: limit);
      Response response = await get("$url&$arg");
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error SearchServices searchTool $e");
      return Future.error(e);
    }
  }
}
