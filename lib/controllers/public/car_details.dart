import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:sayaaratukum/controllers/controller.dart';

class CarDetailsController extends BaseController {
  var onPageIndex = 0.obs;

  final int totalPageAddCar = 3;

  bool get isLastPage => onPageIndex.value == totalPageAddCar - 1;
  late PageController pageController;

  @override
  void onInit() {
    pageController = PageController(initialPage: onPageIndex.value);

    super.onInit();
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
}
