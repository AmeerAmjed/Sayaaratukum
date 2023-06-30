import 'package:sayaaratukum/domain/models//store_type.dart';
import 'package:sayaaratukum/util/constant.dart';

import 'model.dart';

class StoreModel extends BaseModel {
  StoreModel({
    required this.cover,
    this.description,
    required this.id,
    required this.name,
    required this.avatar,
    required this.address,
    required this.expiresAt,
    required this.isExpires,
    required this.isSubscribed,
    required this.whatsappNumberPhone,
    // required this.owner,
    required this.type,
  });

  final int id;
  final String name;
  final String avatar;
  final String cover;
  final String? description;
  final String address;
  final String? expiresAt;
  final bool isExpires;
  bool isSubscribed;
  final String whatsappNumberPhone;

  // final UserModel owner;
  final SubModel type;

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json['id'],
      name: json['name'],
      avatar: json['image'] ?? Constants.websiteLink,
      cover: json['img_cover'] ?? Constants.websiteLink,
      address: json['address'],
      expiresAt: json['expires_at'],
      isSubscribed: json['is_subscribed'],
      isExpires: json['is_expires'],
      description: json['description'],
      whatsappNumberPhone: json['whatsapp_number'],
      // owner: UserModel.fromJson(json['owner']),
      type: SubModel.fromJson(json['type']),
    );
  }

  static List<StoreModel> listFromJson(list) => List<StoreModel>.from(
    list.map(
          (x) => StoreModel.fromJson(x),
    ),
  ).toList();
}
