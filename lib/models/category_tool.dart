import 'model.dart';

class CategoryToolModel extends BaseModel {
  int id;
  String name;

  CategoryToolModel({
    required this.id,
    required this.name,
  });

  factory CategoryToolModel.fromJson(Map<String, dynamic> json) {
    return CategoryToolModel(
      id: json['id'],
      name: json['name'],
    );
  }

  static List<CategoryToolModel> listFromJson(list) =>
      List<CategoryToolModel>.from(
        list.map(
          (x) => CategoryToolModel.fromJson(x),
        ),
      ).toList();
}
