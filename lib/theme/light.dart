import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sayaaratukum/util/constant.dart';

import 'color.dart';

class LightThemeApp{
  static final light = ThemeData(
    fontFamily: Constants.fontFamily,
      backgroundColor: _background,
      scaffoldBackgroundColor: _background,
      drawerTheme: const DrawerThemeData(
        backgroundColor: _background,
      ),
      errorColor: const Color(0xffEB5757),
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
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: _background,
        unselectedItemColor: Color(0x86747474),
      ),
      textTheme: const TextTheme(
          titleLarge: TextStyle(
            color: textPrimay87,
            fontSize: Constants.fontSizeTitleExtra,
            fontWeight: FontWeight.w700,
          ),
          labelLarge: TextStyle(
            color: Colors.black,
            fontSize: Constants.fontSizeSecondary,
            fontWeight: FontWeight.w700,
          ),
          labelMedium: TextStyle(
            fontFamily: Constants.fontFamily,
            color: Colors.black,
            fontSize: Constants.fontSizePrimary,
            fontWeight: FontWeight.normal,
          ),
          labelSmall: TextStyle(
            color: textPrimay10,
            fontFamily: Constants.fontFamily,
            fontSize: Constants.fontSize10,
            fontWeight: FontWeight.w500,
          ),
          // onPrimary
          displayMedium: TextStyle(
            color: onPrimary,
            fontFamily: Constants.fontFamily,
            fontSize: Constants.fontSize14,
            fontWeight: FontWeight.w500,
          )
          // overline: TextStyle(
          //   color: Colors.grey.shade400,
          //   fontSize: Constants.fontSizeCaption,
          //   fontWeight: FontWeight.normal,
          // ),

          ),
      cardTheme: CardTheme(
        color: Colors.white,
        elevation: .0,
      ));

  static const Color _background = Color(0xffF2F2F2);
  static const Color textPrimay87 = Color(0xde0D0D0D);
  static const Color textPrimay10 = Color(0xde0D0D0D);

  static const Color onPrimary = Color(0xdeffffff);
}