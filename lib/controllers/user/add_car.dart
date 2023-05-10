import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/controllers/public/brand.dart';
import 'package:sayaaratukum/models/brand.dart';
import 'package:sayaaratukum/models/engine_power_type.dart';
import 'package:sayaaratukum/services/remote/user/engine_power_type.dart';
import 'package:sayaaratukum/util/constant.dart';

class AddCarController extends BaseController {
  var onPageIndex = 0.obs;

  final int totalPageAddCar = 3;
  var brands = <BrandModel>[].obs.toList(growable: true);
  var enginePowers = <EnginePowerModel>[].obs.toList(growable: true);
  int idBrandSelected = 0;
  int idEnginePower = 0;

  bool get isLastPage => onPageIndex.value == totalPageAddCar - 1;
  var pageController = PageController();

  late TextEditingController yearModel;
  late TextEditingController region;
  late TextEditingController nearPoint;

  var yearBrand = 0.obs;

  var reColor = "".obs;
  var shakeCheck = "".obs;
  var gearBox = "".obs;
  var color = "".obs;

  var engineCapacity = .0.obs;

  final yesNo = <String>["yes", "no"];
  final typeGearBox = <String>["RadioGroup", "no"];

  @override
  void onInit() {
    brands = BrandController.instance.brands;
    initInput();
    getAllEnginePower();
    super.onInit();
  }

  Future<void> getAllEnginePower() async {
    try {
      await EnginePowerTypeServices.instance.getAllType().then((response) {
        if (response.isOk) {
          List<EnginePowerModel> enginePowers = EnginePowerModel.listFromJson(
            response.body[Constants.bodyData],
          );
          print("enginePowers $enginePowers");
          this.enginePowers.addAll(enginePowers);
        }
      });
    } on Response catch (response) {
      // change(null, status: RxStatus.error());
      print("getAllEnginePower ${response.statusCode}");
    }
  }

  initInput() {
    yearModel = TextEditingController();
    region = TextEditingController();
    nearPoint = TextEditingController();
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

  onChangeEngineCapacity(String? size) {
    if (size != null) {
      engineCapacity.value = double.parse(size);
    }
  }

  onChangeEnginePower(String? type) {
    enginePowers.firstWhere((item) {
      if (item.name == type) {
        idEnginePower = item.id;
        return true;
      }
      return false;
    });
  }

  onChangeColorCar(String? color) {
    if (color != null) {
      this.color.value = color;
    }
  }
}
