import 'package:sayaaratukum/util/store_type.dart';

import 'model.dart';

class AdsModel extends BaseModel {
  AdsModel({
    this.text,
    required this.id,
    this.idItem,
    required this.imageUrl,
    this.typeAds,
  });

  final int id;
  final int? idItem;
  final String? text;
  final String imageUrl;
  final TypeAds? typeAds;

  factory AdsModel.fromJson(Map<String, dynamic> json) {
    try {
      return AdsModel(
        id: json['id'],
        idItem: json['adsble']['id'],
        text: json['text'],
        imageUrl: json['image'],
        typeAds: json['adsble_type'].toString().getTypeAds(),
      );
    } catch (e) {
      return AdsModel(
        id: json['id'],
        idItem: null,
        text: json['text'],
        imageUrl: json['image'],
        typeAds: null,
      );
    }
  }

  static List<AdsModel> listFromJson(list) => List<AdsModel>.from(
        list.map(
          (x) => AdsModel.fromJson(x),
        ),
      ).toList();
}
