import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:sayaaratukum/l10n/ar.dart';
import 'package:sayaaratukum/l10n/en.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': EnTranslations.map,
        'ar': ArTranslations.map,
      };
}

class L10n {
  static const String viewAll = "viewAll";
  static const String brands = "Brands";
  static const String brand = "brand";

  static const home = 'Home';
  static const spareParts = 'spareParts';
  static const stores = 'store';
  static const favorite = 'favorite';

  static const myProfile = 'myProfile';
  static const setting = 'setting';
  static const privacy = 'privacy';
  static const socialMedia = 'socialMedia';
  static const logout = 'logout';

  static const welcomeTitle = 'welcomeTitle';
  static const welcomeDoc = 'welcomeDoc';
  static const letStart = 'letStart';

  static const skip = 'skip';
  static const login = 'login';
  static const createAccount = 'createAccount';
  static const alreadyHaveAccount = 'alreadyHaveAccount';
  static const forgotPassword = 'forgotPassword';
  static const password = 'password';
  static const emailOrNumberPhone = 'emailOrNumberPhone';
  static const isRequired = 'isRequired';

  static const passwordShort = 'passwordShort';
  static const passwordLong = 'passwordLong';
  static const passwordNotMatch = 'passwordNotMatch';

  static const numberPhoneIsRequired = 'numberPhoneIsRequired';
  static const numberPhoneInvalidLength = 'numberPhoneInvalidLength';
  static const numberPhoneInvalid = 'numberPhoneInvalid';

  static const welcomeBack = 'welcomeBack';
  static const searchCar = 'searchCar';
  static const searchTool = 'searchTool';

  static const showrooms = 'showrooms';

  static const adsDeals = 'adsDeals';

  static const specifications = 'Specifications';
  static const note = 'note';
  static const chatToBuy = 'chatToBuy';

  static const make = 'make';
  static const model = 'model';
  static const status = 'status';
  static const color = 'Color';

  static const showMore = 'showMore';
  static const showLess = 'showLess';
  static const addCar = 'addCar';

  static const back = 'back';
  static const next = 'next';

  static const publish = 'publish';

  static const typeCar = 'typeCar';
  static const propulsionSystem = 'propulsionSystem';

  static const year = 'year';
  static const yearBrand = 'yearBrand';
  static const recolor = 'recolor';

  static const yes = 'yes';
  static const no = 'no';

  static const automatic = 'automatic';
  static const manual = 'manual';
  static const shakeCheck = 'shakeCheck';
  static const gearBox = 'typeGearBox';

  static const governorate = 'governorate';
  static const region = 'region';
  static const nearPoint = 'nearPoint';

  static const engineCapacity = 'engineCapacity';
  static const enginePower = 'enginePower';


}