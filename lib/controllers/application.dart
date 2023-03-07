import 'package:get/get.dart';
import 'package:sayaaratukum/models/user.dart';
import 'package:sayaaratukum/services/local/storage.dart';
import 'package:sayaaratukum/util/constant.dart';

class Application extends GetxController with LocalStorage {
  static Application get instance => Get.find();

  RxBool isSkipAuth = false.obs;
  RxBool isLogged = false.obs;
  RxBool isNotificationActive = true.obs;
  Rxn<UserModel?>? user = Rxn<UserModel?>();
  Rxn<String> token = Rxn<String>(null);


  RxString langCode = 'en'.obs;

  String get getLangCode => langCode.value;

  bool get isLogin => token.value != null;

  @override
  void onInit() {
    _init();
    _getUserInfo();
    super.onInit();
  }

  _init() async {
    isSkipAuth.value = getData(Constants.skipAuthKey) ?? false;
    token.value = getData(Constants.tokenKey);
    var lang = await getData(Constants.langCodeKey);
    if (lang != null) langCode.value = lang;

  }


  _getUserInfo() {
    final userInfo = getData(Constants.userKey);
    if (userInfo != null)  user?.value = UserModel.local(userInfo);
  }


  void login(UserModel user, String token) async {
    isLogged.value = true;
    this.token.value = token;
    this.user?.value = user;
    await save<String>(Constants.tokenKey, token);
    await save<UserModel>(Constants.userKey, user);
    update();
  }

  void saveToken(String token) async {
    this.token.value = token;
    await save<String>(Constants.tokenKey, token);
  }

  set setLangCode(String newLangCode) {
    langCode.value = newLangCode;
    update();
    save(Constants.langCodeKey, newLangCode);
  }

  set setNotificationState(bool state) {

    isNotificationActive.value = state;
    update();
    String convertToString(bool value) {
      return value ? '1' : '0';
    }

    save(Constants.notificationKey, convertToString(state));
  }

  void logout({bool needToLogin = false}) async {
    isLogged.value = false;
    token.value = null;
    user?.value = null;
    await removeData(Constants.tokenKey);
    await removeData(Constants.userKey);
    // await resetStateAuthController();
    // needToLogin
    //     ? Get.offAllNamed(RoutePageApp.login)
    //     : Get.offAllNamed(RoutePageApp.chooseAuth);
  }

  bool activeLang(String value) => value == getLangCode;

  bool convertToBool(String value) {
    return value == '1' ? true : false;
  }
}
