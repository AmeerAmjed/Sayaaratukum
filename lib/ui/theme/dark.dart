import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sayaaratukum/util/constant.dart';

import 'color.dart';

class DarkThemeApp {
  ThemeData dark(String fontFamily) {
    return ThemeData(
      fontFamily: fontFamily,
      backgroundColor: _background,
      scaffoldBackgroundColor: _background,
      drawerTheme: const DrawerThemeData(
        backgroundColor: _background,
      ),
      cardColor: _backgroundCard,
      errorColor: const Color(0xffEB5757),
      appBarTheme: AppBarTheme(
        elevation: .0,
        scrolledUnderElevation: 1.5,
        iconTheme: const IconThemeData(
          color: onBackground,
        ),
        titleTextStyle: const TextStyle(
          color: onBackground,
          fontSize: 20,
        ),
        backgroundColor: _background,
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: _background,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: primaryColor,
      primarySwatch: primaryColor,
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
            color: textPrimay87,
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
        color: _backgroundBottomNavigationBar,
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

  // static const Color _background = Color(0xff292936);
  static const Color _background = Color(0xff1f1d2c);
  static const Color _backgroundCard = Color(0xFF363643);
  static const Color _backgroundBottomNavigationBar = Color(0xff2B293D);
  static const Color _unselectedItemColorBottomNavigationBar =
      Color(0x77747474);

  static const Color onPrimary = Color(0xdeffffff);

  static const Color textPrimay87 = Color(0xdeffffff);
  static const Color textPrimay10 = Color(0xdeffffff);
  static const Color green = Color(0xde2CB67D);

static const Color onBackground = Color(0xdeffffff);
  static const MaterialColor primaryColor = MaterialColor(
    0xFF4d5c94,
    <int, Color>{
      50: Color(0xFFe9ebf2),
      100: Color(0xFFc7cddf),
      200: Color(0xFFa3adc9),
      300: Color(0xFF818db2),
      400: Color(0xFF6673a2),
      500: Color(0xFF4d5c94),
      600: Color(0xFF46548b),
      700: Color(0xFF3d4a7f),
      800: Color(0xFF364072),
      900: Color(0xFF2b305a),
    },
  );
}

