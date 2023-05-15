import 'dart:io';

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
  List<File> images;

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
}
