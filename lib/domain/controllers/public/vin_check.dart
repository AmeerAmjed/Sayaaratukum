import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:sayaaratukum/data/services/remote/public/vin_check.dart';
import 'package:sayaaratukum/domain/controllers/controller.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/widgets//CustomDialog.dart';
import 'package:sayaaratukum/util/hard_code.dart';

class VinCheckController extends BaseController {
  late GlobalKey<FormState> formKey;

  late TextEditingController fullName;
  late TextEditingController phoneNumber;
  late TextEditingController vinNumber;
  late TextEditingController creditNumber;
  late TextEditingController notes;
  var inComing = "".obs;
  var creditType = "".obs;

  RxBool disableSubmit = false.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  init() {
    formKey = GlobalKey<FormState>();
    fullName = TextEditingController();
    phoneNumber = TextEditingController();
    vinNumber = TextEditingController();
    creditNumber = TextEditingController();
    notes = TextEditingController();
  }

  createCheck() async {
    loading(true);
    var userInfo = {
      "name": fullName.text,
      "phone_number": phoneNumber.text,
      "vin_number": vinNumber.text,
      "credit_number": creditNumber.text,
      "credit_type": creditType.value.toLowerCase(),
      "incoming_type": inComing.value,
      "notes": notes.text,
    };
    try {
      await VinCheckServices.instance.addCheck(userInfo).then((response) {
        loading(false);
        var body = response.body;
        if (response.isOk) {
          if (body[statusResponse] == success) {
            showValidateEmail();
          }
        }
      });
    } on Response catch (response) {
      loading(false);
      onError(response.body[message]);
    }
  }

  showValidateEmail() {
    showCustomDialog(
      L10n.vinCheck.tr,
      message: L10n.vinMessage.tr,
      labelButtonAction: L10n.ok.tr,
      onPressedAction: () {
        Get.back();
      },
    );
  }

  onChangeMadeTo(String? madeTo) {
    _resetValidateForm();
    if (madeTo != null) {
      for (var map in HardCode.madeTo) {
        if (map.containsValue(madeTo)) {
          String key = map.keys.first;
          inComing.value = key;
        }
      }
    }
  }

  onChangeCreditType(String? creditType) {
    _resetValidateForm();
    if (creditType != null) {
      HardCode.creditTypes.firstWhere((element) {
        if (element.containsValue(creditType)) {
          String key = element.keys.first;
          this.creditType.value = key;
          return true;
        }
        return false;
      });
      print(creditType);
    }
  }

  _resetValidateForm() {
    formKey.currentState!.validate();
  }

  loading(bool state) {
    disableSubmit.value = state;
    update();
  }

  @override
  void dispose() {
    fullName.dispose();
    phoneNumber.dispose();
    vinNumber.dispose();
    creditNumber.dispose();
    notes.dispose();
    super.dispose();
  }
}
