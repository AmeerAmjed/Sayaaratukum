import 'package:sayaaratukum/models/car.dart';

import 'model.dart';

class FavoriteModel extends BaseModel {
  FavoriteModel({
    required this.id,
    this.product,
    required this.type,
    this.isLoading = false,
  });

  final int id;
  final CarModel? product;
  final String? type;
  bool isLoading;

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    try{
      return FavoriteModel(
        id: json['id'],
        product: json['product'] != null ? CarModel.fromJson(json['product']) : null,
        type: json['type'],
      );
    }catch(e){
      return FavoriteModel(
        id: json['id'],
        product:  null,
        type: null,
      );
    }
  }

  static List<FavoriteModel> listFromJson(List<dynamic> list) {
    final favoriteList = list
        .map((x) => FavoriteModel.fromJson(x))
        .where((favorite) => favorite.product != null)
        .toList();
    return favoriteList;
  }
}
