import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sayaaratukum/util/constant.dart';

import 'color.dart';

class DarkThemeApp {
  static final dark = ThemeData(
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
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    cardTheme: const CardTheme(
      color: _backgroundCard,
      elevation: .0,
      // margin: EdgeInsets.all(10),
      // shape: ShapeBorder()
    ),
    textTheme: TextTheme(
      labelLarge: const TextStyle(
        color: Colors.black,
        fontSize: Constants.fontSizeSecondary,
        fontWeight: FontWeight.w700,
      ),
      labelMedium: const TextStyle(
        color: Colors.black,
        fontSize: Constants.fontSizePrimary,
        fontWeight: FontWeight.normal,
      ),
      // caption: TextStyle(
      //   color: Colors.grey.shade400,
      //   fontSize: Constants.fontSizeCaption,
      //   fontWeight: FontWeight.normal,
      // ),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: primaryColor,
    primarySwatch: primaryColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: _backgroundBottomNavigationBar,
      unselectedItemColor: _unselectedItemColorBottomNavigationBar,
    ),
  );

  // static const Color _background = Color(0xff292936);
  static const Color _background = Color(0xff1f1d2c);
  static const Color _backgroundCard = Color(0xFF363643);
  static const Color _backgroundBottomNavigationBar = Color(0xff2B293D);
  static const Color _unselectedItemColorBottomNavigationBar =
      Color(0x77747474);

// static const Color _background = Color(0xff1E1E1E);
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

