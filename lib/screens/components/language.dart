import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/util/lang_code.dart';
import 'package:sayaaratukum/widgets/bottom_sheet.dart';
import 'package:sayaaratukum/widgets/button_action_bottom_sheet.dart';

language() {
  bottomSheet(
    height: 200,
    widget: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonActionBottomSheet(
          title: L10n.english.tr,
          textIcon: LangCode.en.name.capitalize,
          onPressed: () {
            Application.instance.setLangCode = LangCode.en;
            Get.back();
          },
          paddingVertical: 4,
        ),
        ButtonActionBottomSheet(
          title: L10n.arabic.tr,
          textIcon: LangCode.ar.name.capitalize,
          onPressed: () {
            Application.instance.setLangCode = LangCode.ar;
            Get.back();
          },
          paddingVertical: 4,
        ),
      ],
    ),
  );
}
