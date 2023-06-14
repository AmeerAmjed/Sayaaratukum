import 'package:sayaaratukum/models/model.dart';
import 'package:sayaaratukum/models/role.dart';
import 'package:sayaaratukum/util/constant.dart';

class UserModel extends BaseModel {
  UserModel({
    this.email,
    this.phoneNumber,
    required this.id,
    required this.fullName,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    required this.role,
    required this.roleType,
    required this.myStoreId,
    // required this.isPhoneNumberVerified,
    // required this.isEmailVerified,
    // required this.isActive,
  });

  final int id;
  final int myStoreId;
  final String fullName;
  final String firstName;
  final String? lastName;
  final String? email;
  String? phoneNumber;
  final String avatar;
  final RoleModel? role;
  final String roleType;

  // final bool isPhoneNumberVerified;
  // final bool isEmailVerified;
  // final bool isActive;

  factory UserModel.fromJson(Map<String, dynamic> data) {
    bool isActiveUser(int active) => active == 1;
    var myStoreId = -1;
    print("data $data");
    String getRoleType() {
      if (data['role']['id'] == 2) {
        try {
          if (data['store']["type"]['name'] == "cars") {
            return "cars";
          } else {
            return "tools";
          }
        } catch (e) {
          return "user";
        }
      }
      return "user";
    }

    try {
      myStoreId = data['store']['id'];
    } catch (eer) {}

    return UserModel(
      id: data['id'],
      myStoreId: myStoreId,
      fullName: data['fullname'],
      firstName: data['first_name'],
      lastName: data['last_name'],
      email: data['email'],
      phoneNumber: data['phone_number'],
      avatar: data['avatar'] ?? Constants.websiteLink,
      role: data['role'] != null ? RoleModel.fromJson(data['role']) : null,
      roleType: getRoleType(),
      // isActive: isActiveUser(data['is_actived']),
      // isEmailVerified: data['is_email_verified'],
      // isPhoneNumberVerified: data['is_phone_number_verified'],
    );
  }

  factory UserModel.local(Map<String, dynamic> data) {
    bool isActiveUser(String active) => active == "1";
    return UserModel(
      id: data['id'],
      myStoreId: data['myStoreId'],
      fullName: data['fullName'],
      firstName: data['firstName'],
      lastName: data['lastName'],
      email: data['email'],
      phoneNumber: data['phoneNumber'],
      avatar: data['avatar'],
      role: RoleModel.local(data['role']),
      roleType: data['roleType'],
      // isEmailVerified: data['isEmailVerified'],
      // isPhoneNumberVerified: data['isPhoneNumberVerified'],
      // isActive: isActiveUser(data['isActive']),
    );
  }

  Map<String, dynamic> toJson() {
    // int isActiveUser(bool active) => active ? 1 : 0;
    return {
      'id': id,
      'myStoreId': myStoreId,
      'fullName': fullName,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'avatar': avatar,
      'role': role?.toJson(),
      'roleType': roleType,
      // 'isEmailVerified': isEmailVerified,
      // 'isActive': isActiveUser(isActive),
      // 'isPhoneNumberVerified': isPhoneNumberVerified,
    };
  }
}
