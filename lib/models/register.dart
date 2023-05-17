import 'package:sayaaratukum/models/model.dart';

class RegisterModel extends BaseModel {
  RegisterModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  final String firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String password;

  static String error(Map<String, dynamic> data) {
    return [
      ...(data['first_name'] != null
          ? List<String>.from(data['first_name'])
          : []),
      ...(data['last_name'] != null
          ? List<String>.from(data['last_name'])
          : []),
      ...(data['phone_number'] != null
          ? List<String>.from(data['phone_number'])
          : []),
      ...(data['email'] != null ? List<String>.from(data['email']) : []),
      ...(data['password'] != null ? List<String>.from(data['password']) : []),
    ].map((str) => '$str\n').join().trimRight();
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': password,
      'phone_number': phoneNumber,
    };
  }
}
