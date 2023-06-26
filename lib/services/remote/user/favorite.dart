import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/services/api.dart';
import 'package:sayaaratukum/services/remote/service.dart';

class FavoriteService extends BaseService {
  static FavoriteService get instance => Get.find();

  Future<Response> getAllFavorite() async {
    try {
      Response response = await get("${ApiEndpoint.favorite}?lang=$lang");
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error FavoriteService getAllFavorite $e");
      return Future.error(e);
    }
  }

  Future<Response> toggleFavorite(int id) async {
    var body = {"type": "car", "id": id};

    try {
      Response response = await post("${ApiEndpoint.toggleFavorite}?lang=$lang", body);
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error FavoriteService addRemoveFavorite $e");
      return Future.error(e);
    }
  }
}
