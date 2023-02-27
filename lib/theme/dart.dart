import 'package:flutter/material.dart';

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
    appBarTheme: const AppBarTheme(
      elevation: .0,
      iconTheme: IconThemeData(
        color: ColorSystem.primaryColor,
      ),
      titleTextStyle: TextStyle(
        color: ColorSystem.primaryColor,
      ),
      backgroundColor: Colors.white,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: ColorSystem.primaryColor,
    primarySwatch: ColorSystem.primaryColor,
  );

  static const Color _background = Color(0xff1f1d2c);
  // static const Color _background = Color(0xff1E1E1E);
}
