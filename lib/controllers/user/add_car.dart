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
  late TextEditingController region;
  late TextEditingController nearPoint;
  late TextEditingController color;
  var yearBrand = 0.obs;

  var reColor = "".obs;
  var shakeCheck = "".obs;
  var gearBox = "".obs;

  final yesNo = <String>["yes", "no"];
  final typeGearBox = <String>["RadioGroup", "no"];

  @override
  void onInit() {
    brands = BrandController.instance.brands;
    initInput();
    super.onInit();
  }

  initInput() {
    yearModel = TextEditingController();
    region = TextEditingController();
    nearPoint = TextEditingController();
    color = TextEditingController();
  }

  onSelectYearModel(int? year) {
    if (year != null) {
      yearModel.text = (DateTime.now().year - year).toString();
    }
  }

  onSelectGear(int year) {
    yearBrand.value = year;
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

  onChangeColorCar(String? color) {
    if (color != null) {

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

  onChangeReColor(Object? option) {
    if (option == yesNo.first) {
      reColor.value = yesNo.first;
    } else {
      reColor.value = yesNo.last;
    }
    update();
  }

  onChangeShakeCheck(Object? option) {
    if (option == yesNo.first) {
      shakeCheck.value = yesNo.first;
    } else {
      shakeCheck.value = yesNo.last;
    }
    update();
  }

  onChangeGearBox(Object? option) {
    if (option == typeGearBox.first) {
      gearBox.value = typeGearBox.first;
    } else {
      gearBox.value = typeGearBox.last;
    }
    update();
  }
}
