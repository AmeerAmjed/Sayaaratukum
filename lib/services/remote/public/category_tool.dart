import 'package:get/get.dart';
import 'package:sayaaratukum/services/api.dart';
import 'package:sayaaratukum/services/remote/service.dart';

class CategoryToolService extends BaseService {
  static CategoryToolService get instance => Get.find();

  Future<Response> getCategories() async {
    try {
      Response response = await get(ApiEndpoint.category);
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error CategoryToolService getCategories $e");
      return Future.error(e);
    }
  }
}
