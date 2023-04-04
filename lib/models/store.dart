import 'package:sayaaratukum/models/store_type.dart';
import 'package:sayaaratukum/models/user.dart';

import 'model.dart';

class StoreModel extends BaseModel {
  StoreModel({
    this.cover,
    this.description,
    required this.id,
    required this.name,
    required this.avatar,
    required this.address,
    required this.expiresAt,
    required this.whatsappNumberPhone,
    required this.owner,
    required this.type,
  });

  final int id;
  final String name;
  final String avatar;
  final String? cover;
  final String? description;
  final String address;
  final String? expiresAt;
  final String whatsappNumberPhone;
  final UserModel owner;
  final StoreTypeModel type;

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json['id'],
      name: json['name'],
      avatar: json['image'],
      cover: json['img_cover'],
      address: json['address'],
      expiresAt: json['expires_at'],
      description: json['description'],
      whatsappNumberPhone: json['whatsapp_number'],
      owner: UserModel.fromJson(json['owner']),
      type: StoreTypeModel.fromJson(json['type']),
    );
  }

  static List<StoreModel> listFromJson(list) => List<StoreModel>.from(
    list.map(
          (x) => StoreModel.fromJson(x),
    ),
  ).toList();
}
