import 'package:sayaaratukum/util/exta/string.dart';
import 'package:sayaaratukum/util/store_type.dart';

import 'model.dart';

class AdsModel extends BaseModel {
  AdsModel({
    this.text,
    required this.id,
    required this.imageUrl,
    required this.type,
  });

  final int id;
  final String? text;
  final String imageUrl;
  final StoreType type;

  factory AdsModel.fromJson(Map<String, dynamic> json) {
    return AdsModel(
      id: json['id'],
      text: json['text'] ,
      imageUrl: json['image'],
      type: json['adsble_type'].toString().toStoreType(),
    );
  }

  static List<AdsModel> listFromJson(list) => List<AdsModel>.from(
        list.map(
          (x) => AdsModel.fromJson(x),
        ),
      ).toList();
}
