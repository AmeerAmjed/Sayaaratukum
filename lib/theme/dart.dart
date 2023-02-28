import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sayaaratukum/util/constant.dart';

import 'color.dart';

class DarkThemeApp {
  static final dark = ThemeData(
    fontFamily: "MulishRegular",
    backgroundColor: _background,
    scaffoldBackgroundColor: _background,
    drawerTheme: const DrawerThemeData(
      width: double.infinity,
      backgroundColor: Colors.black,
    ),
    appBarTheme: AppBarTheme(
      elevation: .0,
      iconTheme: const IconThemeData(
        color: ColorSystem.primaryColor,
      ),
      titleTextStyle: const TextStyle(
        color: ColorSystem.primaryColor,
      ),
      backgroundColor: _background,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: _background,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    cardTheme: const CardTheme(
      color: _backgroundCard,
      elevation: .0,
      // margin: EdgeInsets.all(10),
      // shape: ShapeBorder()
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: ColorSystem.primaryColor,
    primarySwatch: ColorSystem.primaryColor,
  );

  // static const Color _background = Color(0xff292936);
  static const Color _background = Color(0xff1f1d2c);
  static const Color _backgroundCard = Color(0xFF363643);
  // static const Color _background = Color(0xff1E1E1E);
}
