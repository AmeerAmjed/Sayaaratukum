import 'model.dart';

class RoleModel extends BaseModel {
  RoleModel({
    required this.id,
    required this.title,
  });

  final int id;
  final String title;

  factory RoleModel.fromJson(Map<String, dynamic> data) {
    return RoleModel(
      id: data['id'],
      title: data['name'],
    );
  }

  factory RoleModel.local(Map<String, dynamic> data) {
    return RoleModel(
      id: data['id'],
      title: data['title'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
    };
  }

}
