import 'dart:io';

import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/models/add_car.dart';
import 'package:sayaaratukum/services/api.dart';
import 'package:sayaaratukum/services/remote/service.dart';

class CarsServices extends BaseService {
  static CarsServices get instance => Get.find();

  Future<Response> getCars({
    required int page,
    required int limit,
  }) async {
    try {
      String url = pagination(ApiEndpoint.cars, page: page, limit: limit);
      Response response = await get(url);
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error CarsServices getCars $e");
      return Future.error(e);
    }
  }

  Future<Response> getCarsByStore(String idStore, {
    required int page,
    required int limit,
  }) async {
    try {
      String url = pagination(ApiEndpoint.cars, page: page, limit: limit);
      Response response = await get("$url&type=store&creator=$idStore");
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error CarsServices searchCarByBrandId $e");
      return Future.error(e);
    }
  }

  Future<Response> getCarsByUserId(int userId, {
    required int page,
    required int limit,
  }) async {
    try {
      String url = pagination(ApiEndpoint.cars, page: page, limit: limit);
      Response response = await get("$url&type=user&creator=$userId");
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error CarsServices getCarsByUserId $e");
      return Future.error(e);
    }
  }

  Future<Response> getCarsById(String id) async {
    try {
      Response response = await get("${ApiEndpoint.cars}/$id?lang=$lang");
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error CarsServices getCarsById $e");
      return Future.error(e);
    }
  }

  Future<Response> deleteCarById(int id) async {
    try {
      Response response = await delete("${ApiEndpoint.addCar}/$id?lang=$lang");
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error CarsServices deleteCarById $e");
      return Future.error(e);
    }
  }

  Future<Response> updateCar(int id,AddCarModel car) async {
    try {
      Response response = await post(
        "${ApiEndpoint.addCar}/$id?_method=put&lang=$lang",
        car.getBaseInfo(),
      );
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error CarsServices updateCar $e");
      return Future.error(e);
    }
  }

  Future<Response> deleteImageCar(String id) async {
    try {
      Response response =
          await delete("${ApiEndpoint.adminImagesCar}/$id?lang=$lang");
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error CarsServices deleteImageCar $e");
      return Future.error(e);
    }
  }

  Future<Response> addImageCar(int id, String imagePath) async {
    try {
      Response response = await post("${ApiEndpoint.adminImagesCar}?lang=$lang",
          getFormDataAddImage(id, imagePath));
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error CarsServices addImageCar $e");
      return Future.error(e);
    }
  }

  FormData getFormDataAddImage(int id, String imagePath) {
    var data = FormData({
      'car_id': id,
    });

    var imageTool = MapEntry(
      "image",
      MultipartFile(
        File(imagePath),
        filename:
            "${DateTime.now().millisecondsSinceEpoch}.${imagePath.split('.').last}",
      ),
    );

    data.files.add(imageTool);
    return data;
  }
}
