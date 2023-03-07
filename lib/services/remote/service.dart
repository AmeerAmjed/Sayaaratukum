import 'package:get/get_connect/connect.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/services/api.dart';
import 'package:sayaaratukum/services/local/storage.dart';

abstract class BaseService extends GetConnect with LocalStorage {
  String? token = Application.instance.token.value;

  @override
  void onInit() {
    httpClient.baseUrl = ApiEndpoint.baseUrl;
    httpClient.timeout = const Duration(seconds: 3000);
    httpClient.defaultContentType = "application/json";
    httpClient.addResponseModifier((request, response) async {
      print("Service ${response.body}");
      return response;
    });

    httpClient.addRequestModifier((Request request) {
      request.headers['Authorization'] = "Bearer $token";
      return request;
    });

    super.onInit();
  }
}
