import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sayaaratukum/binding/init.dart';
import 'package:sayaaratukum/binding/public/main_tab.dart';
import 'package:sayaaratukum/domain/controllers/application.dart';
import 'package:sayaaratukum/pusher.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/ui/route/page.dart';
import 'package:sayaaratukum/ui/route/routes.dart';
import 'package:sayaaratukum/ui/theme//dark.dart';
import 'package:sayaaratukum/ui/theme//light.dart';
import 'package:sayaaratukum/util/lang_code.dart';
import 'package:uni_links/uni_links.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  Get.put<Application>(Application(), permanent: true);
  initUniLinks();

  Binding.init();
  await pusherListener();

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
    return GetBuilder<Application>(builder: (cont) {
      var fontFamily = controller.getLangCode == LangCode.ar.name
          ? GoogleFonts.tajawal().fontFamily
          : GoogleFonts.poppins().fontFamily;

      return GetMaterialApp(
        title: L10n.nameApp.tr,
        debugShowCheckedModeBanner: false,
        theme: LightThemeApp().light(fontFamily!),
        darkTheme: DarkThemeApp().dark(fontFamily),
        locale: Locale(controller.getLangCode, ''),
        fallbackLocale: Locale(LangCode.en.name, ''),
        translations: AppTranslations(),
        getPages: routes(),
        defaultTransition: Transition.cupertino,
        initialRoute: (controller.isSkipAuth.value || controller.isLogin)
            ? RouteScreen.mainTab
            : RouteScreen.welcome,
        initialBinding: (controller.isSkipAuth.value || controller.isLogin)
            ? MainTabBinding()
            : MainTabBinding(),
      );
    });
  }
}
