import 'dart:io';

import 'package:get/get.dart';

import 'model.dart';

class AddCarModel extends BaseModel {
  int idBrand;
  int idModelBrand;
  int idEnginePower;
  int engineCapacity;
  String? inComingType;
  String? numberRegisterCar;
  String yearModel;
  String mileage;
  String color;
  String gearbox;
  int? isDamage;

  String userType;
  int userId;

  String gov;
  String? city;
  String? nearPoint;

  List<String> images;
  String price;
  String? note;
  int state;

  AddCarModel({
    required this.price,
    required this.color,
    required this.engineCapacity,
    required this.yearModel,
    required this.idBrand,
    required this.idModelBrand,
    required this.idEnginePower,
    required this.userType,
    required this.userId,
    required this.city,
    required this.gov,
    required this.nearPoint,
    required this.gearbox,
    required this.mileage,
    required this.images,
    this.isDamage,
    this.numberRegisterCar,
    this.inComingType,
    this.state = 2,
  });

  Future<FormData> getFormData() async {
    var data = FormData({
      'price': price.toString(),
      'color': color,
      'engine': engineCapacity.toString(),
      'year_model': yearModel.toString(),
      'brand_id': idBrand.toString(),
      'brand_model_id': idModelBrand.toString(),
      'engine_power_id': idEnginePower.toString(),
      'carable_type': userType,
      'carable_id': userId.toString(),
      'city': city,
      'gov': gov,
      'closerPoint': nearPoint,
      'gearbox': gearbox,
      'mileage': mileage.toString(),
      'is_harm': isDamage.toString(),
      'inComingType': inComingType,
      'state': state,
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
