import 'model.dart';

class BrandModel extends BaseModel {
  BrandModel({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  final int id;
  final String title;
  final String imageUrl;

  factory BrandModel.fromJson(Map<String, dynamic> data) {
    return BrandModel(
      id: data['id'],
      title: data['name'],
      imageUrl: data['image'],
    );
  }

}
