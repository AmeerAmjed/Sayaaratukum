import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'color.dart';

class LightThemeApp{
  static final light = ThemeData(
    // fontFamily: "MulishRegular",
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
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: ColorSystem.primaryColor,
    primarySwatch: ColorSystem.primaryColor,

  );

  static const Color _background = Color(0xffF2F2F2) ;
}