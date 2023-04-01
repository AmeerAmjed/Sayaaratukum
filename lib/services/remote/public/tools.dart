import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/services/api.dart';
import 'package:sayaaratukum/services/remote/service.dart';

class ToolsServices extends BaseService {
  static ToolsServices get instance => Get.find();

  Future<Response> getAllTools({
    required int page,
    required int limit,
  }) async {
    try {
      String urlTools = pagination(ApiEndpoint.tool, page: page, limit: limit);
      Response response = await get(urlTools);
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error ToolsServices getAllTools $e");
      return Future.error(e);
    }
  }
}
