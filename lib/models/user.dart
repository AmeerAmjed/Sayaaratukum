import 'package:sayaaratukum/models/role.dart';

import 'model.dart';

class UserModel extends BaseModel {
  UserModel({
    this.email,
    this.phoneNumber,
    required this.id,
    required this.fullName,
    required this.firstName,
    required this.lastName,
    required this.isPhoneNumberVerified,
    required this.isEmailVerified,
    required this.isActive,
    required this.avatar,
    required this.role,
  });

  final int id;
  final String fullName;
  final String firstName;
  final String lastName;
  final String? email;
  final bool isPhoneNumberVerified;
  final String? phoneNumber;
  final bool isEmailVerified;
  final bool isActive;
  final String avatar;
  final RoleModel role;

  factory UserModel.fromJson(Map<String, dynamic> data) {
    bool isActiveUser(int active) => active == 1;
    return UserModel(
      id: data['id'],
      fullName: data['fullname'],
      firstName: data['first_name'],
      lastName: data['last_name'],
      email: data['email'],
      isEmailVerified: data['is_email_verified'],
      phoneNumber: data['phone_number'],
      isPhoneNumberVerified: data['is_phone_number_verified'],
      avatar: data['avatar'],
      isActive: isActiveUser(data['is_actived']),
      role: RoleModel.fromJson(data['role']),
    );
  }
}
