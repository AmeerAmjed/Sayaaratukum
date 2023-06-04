import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/binding/public/car_details.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/controllers/pagination.dart';
import 'package:sayaaratukum/controllers/user/my_%20subscribe_store.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/models/car.dart';
import 'package:sayaaratukum/models/store.dart';
import 'package:sayaaratukum/screens/details/car/car_details.dart';
import 'package:sayaaratukum/services/remote/public/store.dart';
import 'package:sayaaratukum/util/constant.dart';

class InfoStoreCarDetails extends BaseController
    with StateMixin<StoreModel>, PaginationController {
  static InfoStoreCarDetails get instance => Get.find();

  RxBool disableSubmit = false.obs;
  var idStore = "0".obs;

  @override
  void onInit() {
    super.onInit();
    idStore.value = Get.arguments[Constants.idStoreKey] ?? "0";

    loadingData();
    getInfoStoreCar();
  }

  Future<void> getInfoStoreCar() async {
    try {
      await StoreServices.instance
          .getStoresById(idStore.value)
          .then((response) {
        if (response.isOk) {
          StoreModel result = StoreModel.fromJson(
            response.body[data],
          );
          change(result, status: RxStatus.success());
        }
      });
    } on Response catch (response) {
      if (response.statusCode == 404) {
        change(null, status: RxStatus.error(L10n.storeExpires.tr));
      } else {
        change(null, status: RxStatus.error());
      }
    }
  }

  Future<void> subscriptionStore(StoreModel store) async {
    loading(true);
    try {
      await StoreServices.instance
          .subscription(store.id.toString())
          .then((response) {
        if (response.isOk) {
          loading(false);
          updateMySubscribeStoreController();
          store.isSubscribed = !store.isSubscribed;
          change(store, status: RxStatus.success());
        }
      });
    } on Response catch (response) {
      try {
        showMessage(response.body['message']);
      } catch (e) {}

      loading(false);
    }
  }

  loadingData() {
    change(null, status: RxStatus.loading());
  }

  loading(bool state) {
    disableSubmit.value = state;
    update();
  }


  void updateMySubscribeStoreController() {
    try {
      MySubscribeStoreController.instance.init();
    } catch (error) {}
  }
}
