import 'package:sayaaratukum/models/car.dart';

import 'model.dart';

class FavoriteModel extends BaseModel {
  FavoriteModel({
    required this.id,
    required this.product,
    required this.type,
  });

  final int id;
  final CarModel product;
  final String type;

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'],
      product: CarModel.fromJson(json['product']),
      type: json['type'],
    );
  }

  static List<FavoriteModel> listFromJson(list) => List<FavoriteModel>.from(
        list.map(
          (x) => FavoriteModel.fromJson(x),
        ),
      ).toList();
}
