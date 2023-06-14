import 'package:get/get.dart';
import 'package:sayaaratukum/models/add_tool.dart';
import 'package:sayaaratukum/services/api.dart';
import 'package:sayaaratukum/services/remote/service.dart';

class AddToolService extends BaseService {
  static AddToolService get instance => Get.find();

  Future<Response> add(FormAddToolModel tool) async {
    try {
      Response response = await post(
        ApiEndpoint.addTool,
        await tool.getFormData(),
      );
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error AddToolService add $e");
      return Future.error(e);
    }
  }

  Future<Response> update(int id, FormAddToolModel tool) async {
    try {
      Response response = await post(
        "${ApiEndpoint.addTool}/$id?_method=put",
        await tool.getFormDataToUpdate(),
      );
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error AddToolService update $e");
      return Future.error(e);
    }
  }
}
