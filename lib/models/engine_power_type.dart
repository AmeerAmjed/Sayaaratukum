import 'model.dart';

class EnginePowerModel extends BaseModel {
  EnginePowerModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory EnginePowerModel.fromJson(Map<String, dynamic> json) {
    return EnginePowerModel(
      id: json['id'],
      name: json['name'],
    );
  }

  static List<EnginePowerModel> listFromJson(list) =>
      List<EnginePowerModel>.from(
        list.map(
          (x) => EnginePowerModel.fromJson(x),
        ),
      ).toList();
}
