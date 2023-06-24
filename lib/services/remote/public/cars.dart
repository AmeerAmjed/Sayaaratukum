import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/services/api.dart';
import 'package:sayaaratukum/services/remote/service.dart';

class CarsServices extends BaseService {
  static CarsServices get instance => Get.find();

  Future<Response> getCars({
    required int page,
    required int limit,
  }) async {
    try {
      String url = pagination(ApiEndpoint.cars, page: page, limit: limit);
      Response response = await get(url);
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error CarsServices getCars $e");
      return Future.error(e);
    }
  }

  Future<Response> getCarsByStore(
    String idStore, {
    required int page,
    required int limit,
  }) async {
    try {
      String url = pagination(ApiEndpoint.cars, page: page, limit: limit);
      Response response = await get("$url&type=store&creator=$idStore");
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error CarsServices searchCarByBrandId $e");
      return Future.error(e);
    }
  }

  Future<Response> getCarsByUserId(
    int userId, {
    required int page,
    required int limit,
  }) async {
    try {
      String url = pagination(ApiEndpoint.cars, page: page, limit: limit);
      Response response = await get("$url&type=user&creator=$userId");
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error CarsServices getCarsByUserId $e");
      return Future.error(e);
    }
  }

  Future<Response> getCarsById(String id) async {
    try {
      Response response = await get("${ApiEndpoint.cars}/$id");
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error CarsServices getCarsById $e");
      return Future.error(e);
    }
  }
}
