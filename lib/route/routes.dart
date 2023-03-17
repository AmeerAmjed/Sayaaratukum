import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/screens/auth/welcom/welcome.dart';

List<GetPage> routes() => [
      GetPage(
        name: RouteScreen.welcome,
        page: () => const WelcomeScreen(),
      )
    ];
