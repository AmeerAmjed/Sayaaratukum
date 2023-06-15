import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/controllers/user/my_%20subscribe_store.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/models/store.dart';
import 'package:sayaaratukum/models/store_tool.dart';
import 'package:sayaaratukum/services/remote/public/store.dart';
import 'package:sayaaratukum/util/constant.dart';

class InfoStoreToolDetails extends BaseController
    with StateMixin<StoreToolModel> {
  static InfoStoreToolDetails get instance => Get.find();

  RxBool disableSubmit = false.obs;
  var idStore = "0".obs;

  @override
  void onInit() {
    super.onInit();
    loadingData();
    init();
  }

  init() {
    loadingData();
    idStore.value = Get.arguments[Constants.idToolStoreKey] ?? "0";
    getInfoStoreCar(idStore.value);
  }

  Future<void> getInfoStoreCar(String id) async {
    try {
      await StoreServices.instance.getStoresById(id).then((response) {
        if (response.isOk) {
          StoreToolModel result = StoreToolModel.fromJson(
            response.body[data],
          );
          print("response ${response.body[data]} ${response.body}");

          change(result, status: RxStatus.success());
        }
      });
    } on Response catch (response) {
      print("response ${response.body}");
      if (response.statusCode == 404) {
        change(null, status: RxStatus.error(L10n.storeExpires.tr));
      } else {
        change(null, status: RxStatus.error());
      }
    }
  }

  Future<void> subscriptionStore(StoreModel store) async {
    loading(true);
    // try {
    //   await StoreServices.instance
    //       .subscription(store.id.toString())
    //       .then((response) {
    //     if (response.isOk) {
    //       loading(false);
    //       updateMySubscribeStoreController();
    //       store.isSubscribed = !store.isSubscribed;
    //       change(store, status: RxStatus.success());
    //     }
    //   });
    // } on Response catch (response) {
    //   try {
    //     showMessage(response.body['message']);
    //   } catch (e) {}
    //
    //   loading(false);
    // }
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
