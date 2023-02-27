import 'package:flutter/material.dart';
import 'package:sayaaratukum/theme/color.dart';
import 'package:sayaaratukum/theme/dart.dart';
import 'package:sayaaratukum/theme/light.dart';
import 'package:sayaaratukum/util/constant.dart';

class ThemeApp {
  static final dark = DarkThemeApp.dark;
  static final light = LightThemeApp.light;

  static const TextStyle titleTextStyle = TextStyle(
    color: TextColor.text1,
    fontSize: Constant.fontSizeTitleExtra,
    fontWeight: FontWeight.bold,
  );

  // static const TextStyle titleTextStyle = TextStyle(
  //   color: Colors.white,
  //   fontSize: Constant.fontSizeTitle,
  //   fontWeight: FontWeight.w700,
  // );

  static const TextStyle appbarTextStyle = TextStyle(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle cardTitleTextStyle = TextStyle(
    fontSize: Constant.fontSizePrimary,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle captionTextStyle = TextStyle(
    fontSize: Constant.fontSizeCaption,
    fontWeight: FontWeight.w400,
  );
  static const TextStyle captionBoldTextStyle = TextStyle(
    fontSize: Constant.fontSizeCaption,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle secondaryTextStyle = TextStyle(
    fontSize: Constant.fontSizeSecondary,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle secondaryBoldTextStyle = TextStyle(
    fontSize: Constant.fontSizeSecondary,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle secondaryXTextStyle = TextStyle(
    fontSize: Constant.fontSizeSecondaryX,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle primaryTextStyle = TextStyle(
    fontSize: Constant.fontSizePrimary,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle primaryXTextStyle = TextStyle(
    fontSize: Constant.fontSizePrimaryX,
    color: TextColor.text1,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle readMoreTextStyle = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    color: ColorSystem.primaryColor,
  );
}
