import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:get/get_connect/http/src/multipart/multipart_file.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:get/instance_manager.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sayaaratukum/domain/controllers/application.dart';
import 'package:sayaaratukum/domain/controllers/controller.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/domain/models//store.dart';
import 'package:sayaaratukum/data/services/remote/public/store.dart';
import 'package:sayaaratukum/util/constant.dart';

class UpdateStoreProfileController extends BaseController
    with StateMixin<StoreModel> {
  static UpdateStoreProfileController get instance => Get.find();

  var idStore = "0";
  var idTypeStore = "0";

  late GlobalKey<FormState> formKey;
  late TextEditingController name;
  late TextEditingController location;
  late TextEditingController bio;
  late TextEditingController whatsappNumber;

  RxBool disableSubmit = false.obs;

  var imageCoverPathFile = "".obs;
  var imageAvatarPathFile = "".obs;

  FormData field = FormData({});

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() {
    idStore = Get.arguments[Constants.idStoreUpdateStoreProfile] ?? "0";
    getStoreProfile(idStore);

    formKey = GlobalKey<FormState>();
    name = TextEditingController();
    location = TextEditingController();
    bio = TextEditingController();
    whatsappNumber = TextEditingController();
  }

  Future<void> getStoreProfile(String id) async {
    try {
      await StoreServices.instance.getStoresById(id).then((response) {
        if (response.isOk) {
          StoreModel result = StoreModel.fromJson(
            response.body[data],
          );
          idTypeStore = result.type.id.toString();
          updateInfoStore(result);
          change(result, status: RxStatus.success());
        }
      });
    } on Response catch (response) {
      if (response.statusCode == 404) {
        change(null, status: RxStatus.error(L10n.storeExpires.tr));
      } else {
        change(null, status: RxStatus.error());
      }
    }
  }

  updateInfoStore(StoreModel store) {
    name = TextEditingController(text: store.name);
    location = TextEditingController(text: store.address);
    bio = TextEditingController(text: store.description ?? "");
    whatsappNumber = TextEditingController(text: store.whatsappNumberPhone);
  }

  Future<void> updateProfile() async {
    loading(true);

    try {
      await StoreServices.instance
          .updateProfile(idStore, getValueField())
          .then((response) {
        loading(false);
        var body = response.body;
        if (response.isOk) {
          if (body[statusResponse] == success) {
            showMessage(L10n.successfullyUpdateProfile.tr);
          }
        }
      });
    } on Response catch (response) {
      loading(false);
      onError(response.body[message]);
    }
  }

  loading(bool state) {
    disableSubmit.value = state;
    update();
  }

  FormData getValueField() {
    field.fields.clear();

    field = FormData({
      "name": name.text,
      "address": location.text,
      "whatsapp_number": whatsappNumber.text,
      "description": bio.text,
      "section_id": idTypeStore,
      "user_id": Application.instance.user!.value!.id.toString()
    });

    if (imageCoverPathFile.value != "") {
      var imageCover = MapEntry(
        "img_cover",
        MultipartFile(
          File(imageCoverPathFile.value),
          filename:
              "${DateTime.now().millisecondsSinceEpoch}.${imageCoverPathFile.value.split('.').last}",
        ),
      );

      field.files.add(imageCover);
    }

    if (imageAvatarPathFile.value != "") {
      var imageAvatar = MapEntry(
        "image",
        MultipartFile(
          File(imageAvatarPathFile.value),
          filename:
              "${DateTime.now().millisecondsSinceEpoch}.${imageAvatarPathFile.value.split('.').last}",
        ),
      );

      field.files.add(imageAvatar);
    }

    return field;
  }

  Future<dynamic> onClickChangeImageAvatar() async {
    imageAvatarPathFile.value = "";
    print("object");
    await selectImage().then((image) {
      if (image != null) {
        imageAvatarPathFile.value = File(image.path).path;
      }
    });
    update();
  }

  onClickChangeImageCover() async {
    imageCoverPathFile.value = "";
    print("object");
    await selectImage().then((image) {
      if (image != null) {
        imageCoverPathFile.value = File(image.path).path;
      }
    });
    update();
  }

  Future<XFile?> selectImage() async {
    return await ImagePicker().pickImage(source: ImageSource.gallery);
  }

  @override
  void dispose() {
    name.dispose();
    location.dispose();
    bio.dispose();
    whatsappNumber.dispose();

    super.dispose();
  }
}
