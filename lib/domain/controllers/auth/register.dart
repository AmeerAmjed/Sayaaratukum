import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sayaaratukum/data/services/local/storage.dart';
import 'package:sayaaratukum/data/services/remote/auth/register.dart';
import 'package:sayaaratukum/domain/controllers/application.dart';
import 'package:sayaaratukum/domain/models//register.dart';
import 'package:sayaaratukum/domain/models//user.dart';

import 'auth.dart';

class RegisterController extends AuthController with LocalStorage {
  var imagePath = ''.obs;
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController phoneNumber;
  late TextEditingController password;
  late GlobalKey<FormState> formKey;

  RxBool visibilityPassword = true.obs;
  RxBool disableSubmit = false.obs;

  @override
  void onInit() {
    super.onInit();
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    phoneNumber = TextEditingController();
    password = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  void imageAvatar() async {
    imagePath.value = "";
    await ImagePicker().pickImage(source: ImageSource.gallery).then((image) {
      if (image != null) {
        imagePath.value = File(image.path).path;
      }
    });
    update();
  }

  Future<void> register() async {
    loading(true);
    try {
      await RegisterServices.instance.register(getUserInfo()).then((response) {
        loading(false);
        if (response.isOk) {
          var user = UserModel.fromJson(response.body['data']);
          var token = response.body['access_token'];
          Application.instance.login(user, token);
          if (!user.isEmailVerified && user.email != null) {
            showValidateEmail();
          } else {
            navToMainScreen();
          }
        } else {
          print(" body ${response.body} ${response.statusCode}");
          getError(response);
        }
      });
    } on Response catch (response) {
      loading(false);
      getError(response);
    }
  }

  getError(response) {
    try {
      var error = RegisterModel.error(response.body['errors']);
      onError(error);
      print("error register $error");
    } catch (e) {
      print("error register $e");
    }
  }

  toggle() {
    visibilityPassword.value = !visibilityPassword.value;
  }

  RegisterModel getUserInfo() {
    return RegisterModel(
      firstName: firstName.text,
      lastName: lastName.text,
      email: email.text,
      phoneNumber: phoneNumber.text,
      password: password.text,
    );
  }

  loading(bool state) {
    disableSubmit.value = state;
    update();
  }

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    phoneNumber.dispose();
    password.dispose();
    super.dispose();
  }
}
