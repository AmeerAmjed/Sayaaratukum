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
  static const String recommended = "recommended";

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
  static const register = 'register';
  static const createAccount = 'createAccount';
  static const alreadyHaveAccount = 'alreadyHaveAccount';
  static const forgotPassword = 'forgotPassword';
  static const password = 'password';
  static const emailOrNumberPhone = 'emailOrNumberPhone';
  static const phoneNumber = 'phoneNumber';
  static const firstName = 'firstName';
  static const lastName = 'lastName';
  static const email = 'email';

  static const isRequired = 'isRequired';
  static const emailIsInvalid= 'emailIsInvalid';

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
  static const madeTo = 'madeTo';

  static const showMore = 'showMore';
  static const showLess = 'showLess';
  static const addCar = 'addCar';
  static const addTool = 'addTool';

  static const back = 'back';
  static const next = 'next';

  static const publish = 'publish';

  static const typeCar = 'typeCar';
  static const numberRegisterCar = 'numberRegisterCar';
  static const propulsionSystem = 'propulsionSystem';

  static const year = 'year';
  static const fromYear = 'fromYear';
  static const toYear = 'toYear';
  static const yearBrand = 'yearBrand';
  static const recolor = 'recolor';
  static const km = 'km';

  static const yes = 'yes';
  static const no = 'no';

  static const automatic = 'automatic';
  static const manual = 'manual';
  static const shakeCheck = 'shakeCheck';
  static const gearBox = 'typeGearBox';
  static const isDamage = 'isDamage';

  static const governorate = 'governorate';
  static const region = 'region';
  static const nearPoint = 'nearPoint';

  static const engineCapacity = 'engineCapacity';
  static const enginePower = 'enginePower';
  static const drivingMiles = 'drivingMiles';

  static const informationCar = 'informationCar';
  static const locationCar = 'locationCar';
  static const imagesCar = 'imagesCar';
  static const imagesTool = 'imagesTool';
  static const price = 'price';
  static const minPrice = 'minPrice';
  static const maxPrice = 'maxPrice';
  static const addImagesCar = 'addImagesCar';
  static const addImageTool = 'addImageTool';
  static const available = 'available';

  static const failedCreateAccount = 'failedCreateAccount';

  static const statusTool = 'statusTool';

  static const name = 'name';
  static const category = 'category';
  static const description = 'description';
  static const newTool = 'new';
  static const usedTool = 'usedTool';

  static const failedPublishTool = 'failedPublishTool';
  static const success = 'success';
  static const successAddTool = 'successAddTool';
  static const loginToAddFavorites = 'loginToAddFavorites';

  static const cancel = 'cancel';
  static const empty = 'empty';
  static const emptyFavorite = 'emptyFavorite';
  static const areYouSure = 'areYouSure';
  static const messageDeleteAccount = 'messageDeleteAccount';
  static const messageLogout = 'messageLogout';

  static const notAuth = 'notAuth';
  static const successAddFavorite = 'successAddFavorite';
  static const successRemoveFavorite = 'successRemoveFavorite';
  static const failedAddFavorite = 'failedAddFavorite';

  static const check = 'check';
  static const option = 'option';

  static const subscribe = 'subscribe';
  static const mySubscribed = 'mySubscribed';
  static const cars = 'cars';


  static const emptySubscribed = 'emptySubscribed';
  static const noteEmptySubscribed = 'noteEmptySubscribed';


  static const filterBy = 'filterBy';
  static const cleanFilter = 'cleanFilter';

  static const showResult = 'showResult';
  static const noResult = 'noResult';

  static const whatsappNotInstall = 'whatsappNotInstall';
  static const numberPhoneNotAdd = 'numberPhoneNotAdd';
  static const whatsappNumberPhoneNotAdd = 'whatsappNumberPhoneNotAdd';



}