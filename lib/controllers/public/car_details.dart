import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/models/car.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/services/remote/public/cars.dart';
import 'package:sayaaratukum/util/constant.dart';

class CarDetailsController extends BaseController with StateMixin<CarModel> {
  var onPageIndex = 0.obs;

  final int totalPageAddCar = 3;

  bool get isLastPage => onPageIndex.value == totalPageAddCar - 1;
  late PageController pageController;
  var idCar = "0".obs;

  @override
  void onInit() {
    idCar.value = Get.arguments[Constants.idCarKey] ?? "0";
    pageController = PageController(initialPage: onPageIndex.value);
    getCarById();
    super.onInit();
  }

  getCarById() async {
    try {
      await CarsServices.instance.getCarsById(idCar.value).then((response) {
        if (response.isOk) {
          CarModel result = CarModel.fromJson(
            response.body[data],
          );
          change(result, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.error(L10n.notFound.tr));
        }
      });
    } on Response catch (response) {
      change(null, status: RxStatus.error(L10n.notFound.tr));
      print("CarsServices getCarById${response.statusCode}");
    }
  }

  forward() {
    pageController.nextPage(
      duration: 500.milliseconds,
      curve: Curves.easeIn,
    );
    onPageIndex.value = onPageIndex.value + 1;
    update();
  }

  backward() {
    pageController.previousPage(
      duration: 500.milliseconds,
      curve: Curves.easeOutSine,
    );
    onPageIndex.value = onPageIndex.value - 1;
    update();
  }

  navToStoreCar(String id) {
    Get.toNamed(
      RouteScreen.storeCarDetails,
      arguments: {
        Constants.idStoreKey: id,
      },
    );
  }
}
