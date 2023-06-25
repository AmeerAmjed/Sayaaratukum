import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/models/owner_car.dart';
import 'package:sayaaratukum/models/store_type.dart';
import 'package:sayaaratukum/util/constant.dart';

import 'model.dart';

class CarModel extends BaseModel {
  final int id;
  final String name;
  final int price;
  final String color;
  final bool isAvailable;
  final String? notes;
  final String? registerNumber;
  final String? isDamage;
  final String? inComingType;
  final int isPublished;
   bool isFavorite;
  bool isLoadingFavorite;
  final String engine;
  final String yearModel;
  final SubModel brand;
  final SubModel modelBrand;
  final SubModel enginePowerType;
  final String ownerType;
  final OwnerCarModel owner;
  final String? city;
  final String? gov;
  final String? closerPoint;
  final String gearbox;
  final String mileage;
  final List<ImageModel> images;

  CarModel({
    this.isLoadingFavorite = false,
    this.notes,
    required this.isAvailable,
    this.closerPoint,
    this.registerNumber,
    this.inComingType,
    required this.id,
    required this.name,
    required this.price,
    required this.color,
    required this.engine,
    required this.yearModel,
    required this.isPublished,
    required this.isFavorite,
    required this.isDamage,
    required this.brand,
    required this.modelBrand,
    required this.enginePowerType,
    required this.ownerType,
    required this.owner,
    required this.city,
    required this.gov,
    required this.gearbox,
    required this.mileage,
    required this.images,
  });

  factory CarModel.fromJson(Map<String, dynamic> json) {
    bool isUserOwner(String type) {
      return type == OwnerType.user.name;
    }

    return CarModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      color: json['color'],
      isAvailable: (json['state'] == "2") ? true : false,
      registerNumber: json['registerNumber'],
      inComingType: json['incoming_type'],
      isFavorite: json['is_favorite'],
      isDamage: json['is_harm'] != null
          ? (json['is_harm'] == 0 ? L10n.no : L10n.year)
          : null,
      engine: json['engine'],
      yearModel: json['year_model'],
      mileage: json['mileage'] ?? "0",
      gearbox: json['gearbox'],
      ownerType: json['carable_type'],
      gov: json['gov'],
      city: json['city'],
      closerPoint: json['location'],
      isPublished: json['is_published'],
      brand: SubModel.fromJson(json['brand']),
      modelBrand: SubModel.fromJson(json['model']),
      enginePowerType: SubModel.fromJson(json['power_type']),
      images: ImageModel.listFromJson(json['images']),
      owner: OwnerCarModel.fromJson(json),
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

class ImageModel extends BaseModel {
  ImageModel({
    required this.id,
    required this.imageUrl,
  });

  final int id;
  final String imageUrl;

  factory ImageModel.fromJson(Map<String, dynamic> data) {
    return ImageModel(
      id: data['id'],
      imageUrl: data['path'],
    );
  }

  static List<ImageModel> listFromJson(list) => List<ImageModel>.from(
        list.map(
          (item) => ImageModel.fromJson(item),
        ),
      ).toList();
}
