import 'package:sayaaratukum/domain/models//model.dart';

class ModelsBrandModel extends BaseModel {
  ModelsBrandModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory ModelsBrandModel.fromJson(Map<String, dynamic> data) {
    return ModelsBrandModel(
      id: data['id'],
      name: data['name'],
    );
  }

  static List<ModelsBrandModel> listFromJson(list) =>
      List<ModelsBrandModel>.from(
        list.map(
          (x) => ModelsBrandModel.fromJson(x),
        ),
      ).toList();
}