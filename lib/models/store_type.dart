import 'model.dart';

class StoreTypeModel extends BaseModel {
  StoreTypeModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory StoreTypeModel.fromJson(Map<String, dynamic> data) {
    return StoreTypeModel(
      id: data['id'],
      name: data['name'],
    );
  }
}
