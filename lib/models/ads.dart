import 'model.dart';

class AdsModel extends BaseModel {
  AdsModel({
    required this.id,
    this.text,
    this.imageUrl,
  });

  final int id;
  final String? text;
  final String? imageUrl;
}
