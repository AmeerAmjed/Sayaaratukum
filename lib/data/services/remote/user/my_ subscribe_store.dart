import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/data/services/api.dart';
import 'package:sayaaratukum/data/services/remote/service.dart';

class MySubscribeStoreServices extends BaseService {
  static MySubscribeStoreServices get instance => Get.find();

  Future<Response> getMySubscribe(
    int typeId, {
    required int page,
    required int limit,
  }) async {
    try {
      // String urlStores =
      //     pagination(ApiEndpoint.storesSubscribed, page: page, limit: limit);
      // Response response = await get("$urlStores&type=$typeId");
      Response response = await get("${ApiEndpoint.mySubscribeStore}?lang=$lang");

      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error MySubscribeStoreServices getMySubscribe $e");
      return Future.error(e);
    }
  }
}
