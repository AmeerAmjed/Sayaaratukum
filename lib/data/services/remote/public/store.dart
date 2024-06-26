import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/data/services/api.dart';
import 'package:sayaaratukum/data/services/remote/service.dart';

class StoreServices extends BaseService {
  static StoreServices get instance => Get.find();

  Future<Response> getStoresByType(int typeId, {
    required int page,
    required int limit,
  }) async {
    try {
      String urlStores =
      pagination(ApiEndpoint.stores, page: page, limit: limit);
      Response response = await get("$urlStores&type=$typeId&lang=$lang");
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


  Future<Response> searchStores(String nameStore, {
    required int page,
    required int limit,
  }) async {
    try {
      String urlStores =
      pagination(ApiEndpoint.stores, page: page, limit: limit);
      Response response = await get("$urlStores&search=$nameStore&lang=$lang");
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error StoreServices searchStores $e");
      return Future.error(e);
    }
  }

  Future<Response> getStoresById(String id) async {
    try {
      Response response = await get("${ApiEndpoint.stores}/$id?lang=$lang");
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
      Response response =
          await post("${ApiEndpoint.storeSubscription}/$id?lang=$lang", {});
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

  Future<Response> updateProfile(String id, FormData body) async {
    try {
      Response response = await post("/admin/stores/$id?_method=put&lang=$lang", body);
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
