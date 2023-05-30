import 'package:sayaaratukum/models/store_type.dart';
import 'package:sayaaratukum/util/constant.dart';

import 'model.dart';

class StoreToolModel extends BaseModel {
  StoreToolModel({
    required this.cover,
    this.description,
    required this.id,
    required this.name,
    required this.avatar,
    required this.address,
    required this.expiresAt,
    required this.whatsappNumberPhone,
    required this.type,
  });

  final int id;
  final String name;
  final String avatar;
  final String cover;
  final String? description;
  final String address;
  final String? expiresAt;
  final String whatsappNumberPhone;
  final SubModel type;

  factory StoreToolModel.fromJson(Map<String, dynamic> json) {
    return StoreToolModel(
      id: json['id'],
      name: json['name'],
      avatar: json['image'] ?? Constants.websiteLink,
      cover: json['img_cover'] ?? Constants.websiteLink,
      address: json['address'],
      expiresAt: json['expires_at'],
      description: json['description'],
      whatsappNumberPhone: json['whatsapp_number'],
      type: SubModel.fromJson(json['type']),
    );
  }

  static List<StoreToolModel> listFromJson(list) => List<StoreToolModel>.from(
        list.map(
          (x) => StoreToolModel.fromJson(x),
        ),
      ).toList();
}
