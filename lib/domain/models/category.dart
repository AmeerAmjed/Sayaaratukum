import 'model.dart';

class CategoryModel extends BaseModel {
  CategoryModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
    );
  }
}
