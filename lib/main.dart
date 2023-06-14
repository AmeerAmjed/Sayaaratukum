import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sayaaratukum/binding/public/main_tab.dart';
import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/route/routes.dart';
import 'package:sayaaratukum/theme/theme.dart';
import 'package:sayaaratukum/util/lang_code.dart';
import 'package:uni_links/uni_links.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put<Application>(Application(), permanent: true);
  initUniLinks();
  runApp(const Root());
}

Future<void> initUniLinks() async {
  try {
    await getInitialUri();
  } on Exception {}

  uriLinkStream.listen((Uri? uri) {
    print("ameer $uri");
    // Use the uri and warn the user, if it is not correct
  }, onError: (err) {
    // Handle exception by warning the user their action did not succeed
  });
}

class Root extends GetView<Application> {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: L10n.nameApp.tr,
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.light,
      // darkTheme: ThemeApp.dark,
      locale: Locale(controller.getLangCode, ''),
      fallbackLocale: Locale(LangCode.en.name, ''),
      translations: AppTranslations(),
      getPages: routes(),
      initialRoute: (controller.isSkipAuth.value || controller.isLogin)
          ? RouteScreen.mainTab
          : RouteScreen.welcome,
      initialBinding: (controller.isSkipAuth.value || controller.isLogin)
          ? MainTabBinding()
          : MainTabBinding(),
    );
  }
}
