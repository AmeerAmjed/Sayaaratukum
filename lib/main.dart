import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sayaaratukum/binding/public/main_tab.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/route/routes.dart';
import 'package:sayaaratukum/screens/auth/welcom/welcome.dart';
import 'package:sayaaratukum/theme/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.light,
      darkTheme: ThemeApp.dark,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', ''),
      translations: AppTranslations(),
      initialBinding: MainTabBinding(),
      getPages: routes(),
      home: const WelcomeScreen(),
    );
  }
}
