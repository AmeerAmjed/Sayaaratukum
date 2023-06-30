import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sayaaratukum/util/constant.dart';

import 'color.dart';

class LightThemeApp {
  ThemeData light(String fontFamily) {
    return ThemeData(
      fontFamily: fontFamily,
      backgroundColor: _background,
      scaffoldBackgroundColor: _background,
      drawerTheme: const DrawerThemeData(
        backgroundColor: _background,
      ),
      errorColor: const Color(0xffEB5757),
      appBarTheme: AppBarTheme(
        elevation: .0,
        scrolledUnderElevation: 1.5,
        iconTheme: const IconThemeData(
          color: ColorSystem.primaryColor,
        ),
        titleTextStyle: const TextStyle(
          color: ColorSystem.primaryColor,
          fontSize: 20,
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
      secondaryHeaderColor: ColorSystem.primaryColor.shade200,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: _background,
        unselectedItemColor: Color(0x86747474),
      ),
      textTheme: TextTheme(
          titleLarge: TextStyle(
            fontFamily: fontFamily,
            color: textPrimay87,
            fontSize: Constants.fontSize38,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: TextStyle(
            fontFamily: fontFamily,
            color: green,
            fontSize: Constants.fontSize18,
            fontWeight: FontWeight.bold,
          ),
          labelLarge: TextStyle(
            fontFamily: fontFamily,
            color: textPrimay87,
            fontSize: Constants.fontSize16,
            fontWeight: FontWeight.w700,
          ),
          labelMedium: TextStyle(
            fontFamily: fontFamily,
            color: Colors.black,
            fontSize: Constants.fontSize14,
            fontWeight: FontWeight.normal,
          ),
          labelSmall: TextStyle(
            color: textPrimay10,
            fontFamily: fontFamily,
            fontSize: Constants.fontSize10,
            fontWeight: FontWeight.normal,
          ),

          // onPrimary
          displayMedium: TextStyle(
            color: onPrimary,
            fontFamily: fontFamily,
            fontSize: Constants.fontSize14,
            fontWeight: FontWeight.w500,
          )
          // overline: TextStyle(
          //   color: Colors.grey.shade400,
          //   fontSize: Constants.fontSizeCaption,
          //   fontWeight: FontWeight.normal,
          // ),

          ),
      cardTheme: const CardTheme(
        color: Colors.white,
        elevation: .0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4.0),
          ),
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        modalBackgroundColor: onPrimary,
        backgroundColor: onPrimary,
      ),
    );
  }

  static const Color _background = Color(0xffF2F2F2);
  static const Color textPrimay87 = Color(0xde0D0D0D);
  static const Color textPrimay10 = Color(0xde0D0D0D);

  static const Color onPrimary = Color(0xdeffffff);
  static const Color green = Color(0xde2CB67D);
}