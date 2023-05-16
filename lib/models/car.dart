import 'package:sayaaratukum/models/store_type.dart';
import 'package:sayaaratukum/models/user.dart';

import 'model.dart';

class CarModel extends BaseModel {
  final int id;
  final String name;
  final int price;
  final String color;
  final String? state;
  final String? notes;
  final String? registerNumber;
  final int isPublished;
  final String engine;
  final String yearModel;
  final SubModel brand;
  final SubModel modelBrand;
  final SubModel enginePowerType;
  final String userType;
  final UserModel user;
  final String city;
  final String gov;
  final String? closerPoint;
  final String gearbox;
  final String mileage;
  final List<String> images;

  CarModel({
    this.notes,
    this.state,
    this.closerPoint,
    this.registerNumber,
    required this.id,
    required this.name,
    required this.price,
    required this.color,
    required this.engine,
    required this.yearModel,
    required this.isPublished,
    required this.brand,
    required this.modelBrand,
    required this.enginePowerType,
    required this.userType,
    required this.user,
    required this.city,
    required this.gov,
    required this.gearbox,
    required this.mileage,
    required this.images,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      color: json['color'],
      state: json['state'],
      registerNumber: json['registerNumber'],
      engine: json['engine'],
      yearModel: json['year_model'],
      mileage: json['mileage'],
      gearbox: json['gearbox'],
      userType: json['carable_type'],
      gov: json['gov'],
      city: json['city'],
      closerPoint: json['location'],
      isPublished: json['is_published'],
      brand: SubModel.fromJson(json['brand']),
      modelBrand: SubModel.fromJson(json['model']),
      enginePowerType: SubModel.fromJson(json['power_type']),
      images: listImagesFromJson(json['images']),
      user: UserModel.fromJson(json['carable']),
    );
  }

  static List<CarModel> listFromJson(list) => List<CarModel>.from(
        list.map(
          (item) => CarModel.fromJson(item),
        ),
      ).toList();

  static List<String> listImagesFromJson(list) => List<String>.from(
        list.map(
          (item) => item['path'],
        ),
      ).cast<String>().toList();
}
