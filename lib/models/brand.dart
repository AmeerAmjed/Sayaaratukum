import 'package:sayaaratukum/models/models_brand.dart';

import 'model.dart';

class BrandModel extends BaseModel {
  BrandModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.models,
  });

  final int id;
  final String title;
  final String imageUrl;
  final List<ModelsBrandModel> models;

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'],
      title: json['name'],
      imageUrl: json['image'],
      models: ModelsBrandModel.listFromJson(
        json['models'],
      ),
    );
  }

  static List<BrandModel> listFromJson(list) => List<BrandModel>.from(
        list.map(
          (x) => BrandModel.fromJson(x),
        ),
      ).toList();
}
