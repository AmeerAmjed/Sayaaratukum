import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/screens/home/home.dart';
import 'package:sayaaratukum/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeApp.light,
      darkTheme: ThemeApp.dark,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', ''),
      translations: AppTranslations(),
      home: const HomeScreen(),
    );
  }
}
