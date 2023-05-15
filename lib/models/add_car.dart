import 'dart:io';

import 'package:get/get.dart';

import 'model.dart';

class AddCarModel extends BaseModel {
  String name;
  double price;
  String color;
  int engine;
  int yearModel;
  int idBrand;
  int idModelBrand;
  int idEnginePower;
  String userType;
  int userId;
  String city;
  String gov;
  String closerPoint;
  String gearbox;
  int mileage;
  List<String> images;

  AddCarModel({
    required this.name,
    required this.price,
    required this.color,
    required this.engine,
    required this.yearModel,
    required this.idBrand,
    required this.idModelBrand,
    required this.idEnginePower,
    required this.userType,
    required this.userId,
    required this.city,
    required this.gov,
    required this.closerPoint,
    required this.gearbox,
    required this.mileage,
    required this.images,
  });

  Future<FormData> getFormData() async {
    var data = FormData({
      'name': name,
      'price': price.toString(),
      'color': color,
      'engine': engine.toString(),
      'year_model': yearModel.toString(),
      'brand_id': idBrand.toString(),
      'brand_model_id': idModelBrand.toString(),
      'engine_power_id': idEnginePower.toString(),
      'carable_type': userType,
      'carable_id': userId.toString(),
      'city': city,
      'gov': gov,
      'closerPoint': closerPoint,
      'gearbox': gearbox,
      'mileage': mileage.toString(),
    });

    for (var i = 0; i < images.length; i++) {
      var image = MapEntry(
        "images[$i]",
        MultipartFile(
          File(images[i]),
          filename:
              "${DateTime.now().millisecondsSinceEpoch}.${images[i].split('.').last}",
        ),
      );

      data.files.add(image);
    }

    return data;
  }
}
