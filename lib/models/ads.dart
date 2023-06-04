import 'package:sayaaratukum/util/store_type.dart';

import 'model.dart';

class AdsModel extends BaseModel {
  AdsModel({
    this.text,
    required this.id,
    required this.idItem,
    required this.imageUrl,
    required this.typeAds,
  });

  final int id;
  final int idItem;
  final String? text;
  final String imageUrl;
  final TypeAds typeAds;

  factory AdsModel.fromJson(Map<String, dynamic> json) {
    return AdsModel(
      id: json['id'],
      idItem: json['adsble']['id'],
      text: json['text'],
      imageUrl: json['image'],
      typeAds: json['adsble_type'].toString().getTypeAds(),
    );
  }

  static List<AdsModel> listFromJson(list) => List<AdsModel>.from(
        list.map(
          (x) => AdsModel.fromJson(x),
        ),
      ).toList();
}
