import 'package:sayaaratukum/domain/models//model.dart';
import 'package:sayaaratukum/domain/models/translate_with_id.dart';

class ModelsBrandModel extends BaseModel {
  ModelsBrandModel({
    required this.id,
    required this.name,
  });

  final int id;
  final TranslateWithIdMode name;

  factory ModelsBrandModel.fromJson(Map<String, dynamic> data) {
    return ModelsBrandModel(
      id: data['id'],
      name: TranslateWithIdMode.fromJson(data, data['name'], data['id']),
    );
  }

  static List<ModelsBrandModel> listFromJson(list) =>
      List<ModelsBrandModel>.from(
        list.map(
          (x) => ModelsBrandModel.fromJson(x),
        ),
      ).toList();
}