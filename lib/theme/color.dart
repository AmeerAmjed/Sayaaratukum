import 'package:flutter/material.dart';

class ColorSystem {

  static const MaterialColor primaryColor = MaterialColor(
    0xFF2b305a,
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




  static const Color iconColorSecondary = TextColor.text3;
  static const Color colorBoarder1 = Color(0xffEBEBEB);
  static const Color colorRed = Color(0xffEB5757);
  static const Color background = Colors.white;
  static const Color backgroundInput = Color(0xffF5F5F5);
  static const Color backgroundColorDanger = Color(0x80fad5d5);
  static const Color colorDanger = Color(0xFFEB5757);



}

class TextColor {
  static const Color text1 = Color(0xFF454545);
  static const Color text2 = Color(0xFF5C5C5C);
  static const Color text3 = Color(0xFF747474);
  static const Color text4 = Color(0xFFBDBDBD);
  static const Color text5 = Color(0xFFE0E0E0);
  static const Color text6 = Color(0xFFEBEBEB);
  static const Color text7 = Color(0xFFF5F5F5);
  static const Color white = Colors.white;
}
