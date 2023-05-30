import 'package:sayaaratukum/models/model.dart';
import 'package:sayaaratukum/util/constant.dart';

class OwnerCarModel extends BaseModel {
  final int id;
  final String name;
  final String typeOwner;
  final String phoneNumber;
  final String avatar;

  OwnerCarModel({
    required this.id,
    required this.name,
    required this.typeOwner,
    required this.phoneNumber,
    required this.avatar,
  });

  factory OwnerCarModel.fromJson(Map<String, dynamic> json) {
    var isStoreOwner = json['carable_type'] == OwnerType.store.name;
    return OwnerCarModel(
      id: json['id'],
      name:
          isStoreOwner ? json['carable']['name'] : json['carable']['fullname'],
      typeOwner: json['carable_type'],
      phoneNumber: isStoreOwner
          ? json['carable']['whatsapp_number']
          : (json['carable']['phone_number'] ?? json['carable']['email']),
      avatar:
          isStoreOwner ? json['carable']['image'] : json['carable']['avatar'],
    );
  }
}