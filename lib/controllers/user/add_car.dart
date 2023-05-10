import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/controllers/public/brand.dart';
import 'package:sayaaratukum/models/brand.dart';

class AddCarController extends BaseController {
  var onPageIndex = 0.obs;

  final int totalPageAddCar = 3;
  var brands = <BrandModel>[].obs.toList(growable: true);
  int idBrandSelected = 0;

  bool get isLastPage => onPageIndex.value == totalPageAddCar - 1;
  var pageController = PageController();

  late TextEditingController yearModel;

  @override
  void onInit() {
    brands = BrandController.instance.brands;
    initInput();
    super.onInit();
  }

  initInput() {
    yearModel = TextEditingController();
  }

  onSelectYearModel(int? year) {
    if (year != null) {
      yearModel.text = (DateTime.now().year - year).toString();
    }
  }

  onChangeBrand(String? brand) {
    if (brand != null) {
      brands.firstWhere((element) {
        if (element.title == brand) {
          idBrandSelected = element.id;
          update();
          return true;
        }
        return false;
      });
    }
  }

  List<String> getModelByBrandId() {
    return brands
        .map((brand) => brand.id == idBrandSelected
            ? brand.models.map((model) => model.name).toList()
            : [])
        .expand((list) => list)
        .cast<String>()
        .toList();
  }

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
