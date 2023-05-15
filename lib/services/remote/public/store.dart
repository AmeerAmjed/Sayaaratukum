import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/services/api.dart';
import 'package:sayaaratukum/services/remote/service.dart';

class StoreServices extends BaseService {
  static StoreServices get instance => Get.find();

  Future<Response> getStoresByType({
    required int page,
    required int limit,
  }) async {
    try {
      String urlStores = pagination(ApiEndpoint.stores, page: page, limit: limit);
      Response response = await get(urlStores);
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error StoreServices getStoresByType $e");
      return Future.error(e);
    }
  }
}