import 'package:sayaaratukum/models/model.dart';
import 'package:sayaaratukum/models/role.dart';


class UserModel extends BaseModel {
  UserModel({
    this.email,
    this.phoneNumber,
    required this.id,
    required this.fullName,
    required this.firstName,
    required this.lastName,
    // required this.isPhoneNumberVerified,
    // required this.isEmailVerified,
    // required this.isActive,
    required this.avatar,
    required this.role,
  });

  final int id;
  final String fullName;
  final String firstName;
  final String? lastName;
  final String? email;
  // final bool isPhoneNumberVerified;
  final String? phoneNumber;
  // final bool isEmailVerified;

  // final bool isActive;
  final String avatar;
  final RoleModel? role;

  factory UserModel.fromJson(Map<String, dynamic> data) {
    bool isActiveUser(int active) => active == 1;
    return UserModel(
      id: data['id'],
      fullName: data['fullname'],
      firstName: data['first_name'],
      lastName: data['last_name'],
      email: data['email'],
      // isEmailVerified: data['is_email_verified'],
      phoneNumber: data['phone_number'],
      // isPhoneNumberVerified: data['is_phone_number_verified'],
      avatar: data['avatar'],
      // isActive: isActiveUser(data['is_actived']),
      role: data['role'] != null ? RoleModel.fromJson(data['role']) : null,
    );
  }

  factory UserModel.local(Map<String, dynamic> data) {
    bool isActiveUser(String active) => active == "1";
    return UserModel(
      id: data['id'],
      fullName: data['fullName'],
      firstName: data['firstName'],
      lastName: data['lastName'],
      email: data['email'],
      // isEmailVerified: data['isEmailVerified'],
      phoneNumber: data['phoneNumber'],
      // isPhoneNumberVerified: data['isPhoneNumberVerified'],
      avatar: data['avatar'],
      // isActive: isActiveUser(data['isActive']),
      role: RoleModel.local(data['role']),
    );
  }

  Map<String, dynamic> toJson() {
    int isActiveUser(bool active) => active ? 1 : 0;
    return {
      'id': id,
      'fullName': fullName,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      // 'isEmailVerified': isEmailVerified,
      'phoneNumber': phoneNumber,
      // 'isPhoneNumberVerified': isPhoneNumberVerified,
      'avatar': avatar,
      // 'isActive': isActiveUser(isActive),
      'role': role?.toJson()
    };
  }
}
