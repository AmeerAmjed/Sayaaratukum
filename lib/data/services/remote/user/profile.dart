import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/data/services/api.dart';
import 'package:sayaaratukum/data/services/remote/service.dart';

class ProfileService extends BaseService {
  static ProfileService get instance => Get.find();

  Future<Response> getMyProfile() async {
    try {
      Response response = await get("${ApiEndpoint.myProfile}?lang=$lang");
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error ProfileService getMyProfile $e");
      return Future.error(e);
    }
  }

  Future<Response> updateProfile(String firstName, String lastName) async {
    var userInfo = {
      "first_name": firstName,
      "last_name": lastName,
    };
    try {
      Response response = await post("${ApiEndpoint.updateProfile}&lang=$lang", userInfo);
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error ProfileService updateProfile $e");
      return Future.error(e);
    }
  }

  Future<Response> updatePassword(
    String password,
    String passwordConfirmation,
  ) async {
    var passwords = {
      "password": password,
      "password_confirmation": passwordConfirmation,
    };
    try {
      Response response = await put("${ApiEndpoint.updatePassword}?lang=$lang", passwords);
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error ProfileService updatePassword $e");
      return Future.error(e);
    }
  }
  Future<Response> updateEmail(
    String email,
  ) async {
    var emailUser = {
      "email": email,
    };
    try {
      Response response = await put("${ApiEndpoint.updateEmail}?lang=$lang", emailUser);
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error ProfileService updateEmail $e");
      return Future.error(e);
    }
  }

  Future<Response> updatePhoneNumber(
    String phoneNumber,
  ) async {
    var phoneNumberUser = {
      "phone_number": phoneNumber,
    };
    try {
      Response response =
          await put("${ApiEndpoint.updatePhoneNumber}?lang=$lang", phoneNumberUser);
      if (response.status.hasError) {
        return Future.error(response);
      } else {
        return response;
      }
    } catch (e) {
      print("error ProfileService updatePhoneNumber $e");
      return Future.error(e);
    }
  }
}
