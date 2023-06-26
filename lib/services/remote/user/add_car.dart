import 'package:get/get.dart';
import 'package:sayaaratukum/models/add_car.dart';
import 'package:sayaaratukum/services/api.dart';
import 'package:sayaaratukum/services/remote/service.dart';

class AddCarService extends BaseService {
  static AddCarService get instance => Get.find();

  Future<Response> addCar(AddCarModel car) async {
    try {
      Response response = await post(
        "${ApiEndpoint.addCar}?lang=$lang",
        await car.getFormData(),
      );
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error AddCarService addCar $e");
      return Future.error(e);
    }
  }
}
