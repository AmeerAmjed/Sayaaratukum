import 'package:sayaaratukum/domain/models//models_brand.dart';
import 'package:sayaaratukum/domain/models/translate_with_id.dart';

import 'model.dart';

class BrandModel extends BaseModel {
  BrandModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.models,
  });

  final int id;
  final TranslateWithIdMode title;
  final String imageUrl;
  final List<ModelsBrandModel> models;

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: json['id'],
      title: TranslateWithIdMode.fromJson(json, json['name'], json['id']),
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
