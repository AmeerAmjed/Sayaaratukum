import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:sayaaratukum/controllers/controller.dart';

class AddCarController extends BaseController {
  var onPageIndex = 0.obs;

  final int totalPageAddCar = 3;

  bool get isLastPage => onPageIndex.value == totalPageAddCar - 1;
  var pageController = PageController();

  forward() {
    pageController.nextPage(
      duration: 200.milliseconds,
      curve: Curves.linear,
    );
    onPageIndex.value = onPageIndex.value + 1;
    update();
  }

  backward() {
    pageController.previousPage(
      duration: 200.milliseconds,
      curve: Curves.linear,
    );
    onPageIndex.value = onPageIndex.value - 1;
    update();
  }
}
