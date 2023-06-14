import 'package:get/get.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/controllers/user/favorite.dart';
import 'package:sayaaratukum/models/tool.dart';
import 'package:sayaaratukum/models/user.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/services/local/storage.dart';
import 'package:sayaaratukum/util/constant.dart';

class Application extends BaseController with LocalStorage {
  static Application get instance => Get.find();

  RxBool isSkipAuth = false.obs;
  RxBool isLogged = false.obs;
  RxBool isNotificationActive = true.obs;
  Rxn<UserModel?>? user = Rxn<UserModel?>();
  Rxn<ToolModel?>? tool = Rxn<ToolModel?>();

  Rxn<String> token = Rxn<String>(null);

  RxString langCode = 'en'.obs;

  String get getLangCode => langCode.value;

  bool get isLogin => token.value != null;

  bool get isSkip => isSkipAuth.value;

  bool get isUserStore => Application.instance.user?.value?.role?.id == 2;

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
    if (userInfo != null) user?.value = UserModel.local(userInfo);
  }

  bool isStoreTool() {
    if (user?.value?.role?.title == "store") {
      if (user?.value?.roleType == "tools") {
        return true;
      }
    }
    return false;
  }

  bool isOwnerStoreTool(int storeId) {
    if (user?.value != null) {
      if (isUserStore) {
        if (user!.value!.myStoreId == storeId) {
          return true;
        }
      }
    }
    return false;
  }

  void login(UserModel user, String token) async {
    isLogged.value = true;
    this.token.value = token;
    this.user?.value = user;
    await save<String>(Constants.tokenKey, token);
    await save<UserModel>(Constants.userKey, user);
    await resetStateAuthController();
    update();
  }

  updateUserInfo(UserModel user) async {
    this.user?.value = user;
    await save<UserModel>(Constants.userKey, user);
    update();
  }

  void skipAuth() async {
    isSkipAuth.value = true;
    await save<bool>(Constants.skipAuthKey, true);
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
    Get.offAllNamed(RouteScreen.login);
    await resetStateAuthController();
    // needToLogin
    //     ? Get.offAllNamed(RoutePageApp.login)
    //     : Get.offAllNamed(RoutePageApp.chooseAuth);
  }

  resetStateAuthController() async {
    try {
      FavoriteController.instance.init();
    } catch (err) {
      print("error resetStateAuthController init FavoriteController $err");
    }
  }

  bool activeLang(String value) => value == getLangCode;

  bool convertToBool(String value) {
    return value == '1' ? true : false;
  }
}
