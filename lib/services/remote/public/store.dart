import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/services/api.dart';
import 'package:sayaaratukum/services/remote/service.dart';

class StoreServices extends BaseService {
  static StoreServices get instance => Get.find();

  Future<Response> getStoresByType(
    int typeId, {
    required int page,
    required int limit,
  }) async {
    try {
      String urlStores =
          pagination(ApiEndpoint.stores, page: page, limit: limit);
      Response response = await get("$urlStores&type=$typeId");
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

  Future<Response> getStoresById(String id) async {
    try {
      Response response = await get("${ApiEndpoint.stores}/$id");
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error StoreServices getStoresById $e");
      return Future.error(e);
    }
  }

  Future<Response> subscription(String id) async {
    try {
      Response response = await post("${ApiEndpoint.storeSubscription}/$id", {});
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error StoreServices subscription $e");
      return Future.error(e);
    }
  }
}
