import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/binding/public/car_details.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/controllers/pagination.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/models/car.dart';
import 'package:sayaaratukum/models/store.dart';
import 'package:sayaaratukum/screens/details/car/car_details.dart';
import 'package:sayaaratukum/services/remote/public/store.dart';
import 'package:sayaaratukum/util/constant.dart';

class InfoStoreCarDetails extends BaseController
    with StateMixin<StoreModel>, PaginationController {
  static InfoStoreCarDetails get instance => Get.find();

  RxBool isLoadingMore = false.obs;
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

  loadingData() {
    change(null, status: RxStatus.loading());
  }

  navigateToDetails(CarModel car) {
    Get.to(
      () => CarDetails(car: car),
      binding: CarDetailsBinding(),
    );
  }
}
