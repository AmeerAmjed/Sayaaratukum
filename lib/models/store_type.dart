import 'model.dart';

class SubModel extends BaseModel {
  SubModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory SubModel.fromJson(Map<String, dynamic> data) {
    return SubModel(
      id: data['id'],
      name: data['name'],
    );
  }
}
