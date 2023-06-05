import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sayaaratukum/controllers/application.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/controllers/public/brand.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/models/add_car.dart';
import 'package:sayaaratukum/models/brand.dart';
import 'package:sayaaratukum/models/engine_power_type.dart';
import 'package:sayaaratukum/screens/add_car/components/inforamtion_car_form.dart';
import 'package:sayaaratukum/screens/add_car/components/location_car_form.dart';
import 'package:sayaaratukum/services/remote/user/add_car.dart';
import 'package:sayaaratukum/services/remote/user/engine_power_type.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/util/hard_code.dart';

import '../../screens/add_car/components/image_price_form.dart';

class AddCarController extends BaseController {
  var onPageIndex = 0.obs;
  RxBool disableSubmit = false.obs;

  final int totalPageAddCar = 3;
  var brands = <BrandModel>[].obs.toList(growable: true);
  var enginePowers = <EnginePowerModel>[].obs.toList(growable: true);
  var stepForm = const <Widget>[
    InformationCarForm(),
    LocationCarForm(),
    ImageWithPriceForm()
  ];
  final yesNo = <String>["yes", "no"];
  final typeGearBox = <String>["auto", "manual"];

  bool get isLastPage => onPageIndex.value == totalPageAddCar - 1;
  late PageController pageController;

  late TextEditingController numberRegisterCar;
  late TextEditingController yearModel;
  late TextEditingController drivingMiles;
  var provinces = "".obs;
  late TextEditingController region;
  late TextEditingController nearPoint;
  late TextEditingController price;
  late TextEditingController note;
  final GlobalKey<FormFieldState> keyManagerModelBrand =
      GlobalKey<FormFieldState>();

  int idBrandSelected = 0;
  int idModelBrandSelected = 0;
  int idEnginePower = 0;
  var reColor = "".obs;
  var shakeCheck = "".obs;
  var gearBox = "".obs;
  var isDamage = "".obs;
  var madeTo = "".obs;
  var color = "".obs;
  var engineCapacity = 0.obs;
  var imagesCar = <String>[].obs.toList(growable: true);

  @override
  void onInit() {
    brands = BrandController.instance.brands;
    pageController = PageController(initialPage: onPageIndex.value);

    initInput();
    getAllEnginePower();
    super.onInit();
  }

  addCar() async {
    loading(true);
    if (getInfo() != null) {
      try {
        await AddCarService.instance.addCar(getInfo()!).then((response) {
          print("response ${response.statusCode} ${response.body}");
          if (response.isOk) {}
          showMessage("Success add car");
          loading(false);
        });
      } on Response catch (response) {
        print("response ${response.statusCode} ${response.body}");
        showMessage(response.body[message]);
        loading(false);
      }
    }
  }

  AddCarModel? getInfo() {

    var userInfo = Application.instance.user?.value;
    print(" userInfo.role!.title, ${userInfo?.role!.title}");
    if (userInfo != null) {
      return AddCarModel(
        price: price.text,
        color: color.value,
        engineCapacity: 12,
        yearModel: yearModel.text,
        idBrand: idBrandSelected,
        idModelBrand: idModelBrandSelected,
        idEnginePower: idEnginePower,
        userType: userInfo.role!.title,
        userId: userInfo.id,
        city: region.text,
        gov: provinces.value,
        nearPoint: nearPoint.text,
        gearbox: gearBox.value,
        mileage: drivingMiles.text,
        images: imagesCar,
        isDamage: isDamage.value == "yes" ? 1 : 0,
        numberRegisterCar: numberRegisterCar.text,
      );
    }
    return null;
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
    numberRegisterCar = TextEditingController();
    yearModel = TextEditingController();
    drivingMiles = TextEditingController();
    region = TextEditingController();
    nearPoint = TextEditingController();
    price = TextEditingController();
    note = TextEditingController();
  }

  //region Imges Car

  Future<void> selectMultipleImages() async {
    var status = await Permission.photos.request();

    List<XFile>? pickedFiles = await ImagePicker().pickMultiImage();
    if (pickedFiles.isNotEmpty) {
      onAddImage(pickedFiles);
    } else {
      print("No images selecteds");

      // No images selected
    }
    // if (status.isGranted) {
    //   if (pickedFiles != null) {
    //     List<File> selectedImages =
    //         pickedFiles.map((XFile file) => File(file.path)).toList();
    //     print("image file $selectedImages");
    //     imagesCar = selectedImages;
    //     update();
    //     // Use the selectedImages list as needed
    //   } else {
    //     print("No images selecteds");
    //
    //     // No images selected
    //   }
    // } else {
    //   if(status.isDenied){
    //     print("No Permission");
    //   }else{
    //     print(" error No Permission");
    //
    //   }
    //   // status.
    //   // openAppSettings();
    //   // print("No Permission");
    // }
  }

  onAddImage(List<XFile> pickedFiles) {
    List<String> imagesAllCar = [];
    List<String> images = pickedFiles
        .map(
          (XFile file) => File(file.path),
        ).toList()
        .map((e) => e.path).toList();

    imagesCar.addAll(images);
    // imagesAllCar.addAll(imagesCar);
    // imagesCar.clear();
    // imagesCar.addAll(imagesAllCar.sublist(0, 11));
    update();
  }

  onClickDeleteImage(String file) {
    imagesCar.remove(file);
    update();
  }

  //endregion

  onSelectYearModel(int? year) {
    if (year != null) {
      print("year $year");
      yearModel.text = (DateTime.now().year - year).toString();
    }
  }

  onSelectGear(int year) {
  }

  //region Brand,Model Car
  onChangeBrand(String? brand) {
    keyManagerModelBrand.currentState?.reset();
    if (brand != null) {
      brands.firstWhere((element) {
        if (element.title == brand) {
          idBrandSelected = element.id;
          getModelByBrandId();
          update();
          return true;
        }
        return false;
      });
    }
  }

  List<String> getModelByBrandId() {
    return brands
        .map((brand) =>
    brand.id == idBrandSelected
        ? brand.models.map((model) => model.name).toList()
        : [])
        .expand((list) => list)
        .cast<String>()
        .toList();
  }

  onChangeModelBrand(String? modelName) {
    if (modelName != null) {
      BrandModel specificModel =
      brands.firstWhere((itemBrand) => itemBrand.id == idBrandSelected);
      specificModel.models.firstWhere((itemModelBrand) {
        if (itemModelBrand.name == modelName) {
          idModelBrandSelected = itemModelBrand.id;
          return true;
        }
        return false;
      });
    }
  }

  //endregion

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

  onChangeReColor(Object? option) {
    if (option == yesNo.first) {
      reColor.value = yesNo.first;
    } else {
      reColor.value = yesNo.last;
    }
    update();
  }

  onChangeIsDamage(Object? option) {
    if (option == yesNo.first) {
      isDamage.value = yesNo.first;
    } else {
      isDamage.value = yesNo.last;
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
      engineCapacity.value = int.tryParse(size)!;
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

  loading(bool state) {
    disableSubmit.value = state;
    update();
  }

  onChangeColorCar(String? color) {
    if (color != null) {
      this.color.value = color;
    }
  }

  onChangeMadeTo(String? madeTo) {
    if (madeTo != null) {
      for (var map in HardCode.madeTo) {
        if (map.containsValue(madeTo)) {
          String key = map.keys.first;
          this.madeTo.value = key;
          print("made to $key");
        }
      }
    }
  }

  onChangeProvinces(String? provinces) {
    if (provinces != null) {
      this.provinces.value = provinces;
    }
  }

  bool checkValidationForm1() {
    if (idBrandSelected == 0) {
      onError("${L10n.brand.tr} ${L10n.isRequired.tr}");

      return false;
    } else if (idModelBrandSelected == 0) {
      onError("${L10n.model.tr} ${L10n.isRequired.tr}");

      return false;
    } else if (engineCapacity.value == 0) {
      onError("${L10n.engineCapacity.tr} ${L10n.isRequired.tr}");

      return false;
    } else if (idEnginePower == 0) {
      onError("${L10n.enginePower.tr} ${L10n.isRequired.tr}");

      return false;
    } else if (madeTo.value == "") {
      onError("${L10n.madeTo.tr} ${L10n.isRequired.tr}");
      return false;
    } else if (color.value == "") {
      onError("${L10n.color.tr} ${L10n.isRequired.tr}");
      return false;
    }
    // else if (numberRegisterCar.text == "") {
    //   onError("${L10n.numberRegisterCar.tr} ${L10n.isRequired.tr}");
    //   return false;
    // }
    else if (yearModel.text == "") {
      onError("${L10n.year.tr} ${L10n.isRequired.tr}");
      return false;
    } else if (drivingMiles.text == "") {
      onError("${L10n.drivingMiles.tr} ${L10n.isRequired.tr}");
      return false;
    } else if (color.value == "") {
      onError("${L10n.color.tr} ${L10n.isRequired.tr}");
      return false;
    } else if (isDamage.value == "") {
      onError("${L10n.isDamage.tr} ${L10n.isRequired.tr}");
      return false;
    }
    //
    // else if (reColor.value == "") {
    //   onError("${L10n.check.tr} ${L10n.recolor.tr} ${L10n.isRequired.tr}");
    //   return false;
    // }
    // else if (shakeCheck.value == "") {
    //   onError("${L10n.option.tr} ${L10n.shakeCheck.tr} ${L10n.isRequired.tr}");
    //   return false;
    // }
    else if (gearBox.value == "") {
      onError("${L10n.option.tr} ${L10n.gearBox.tr} ${L10n.isRequired.tr}");
      return false;
    }
    return true;
  }

  bool checkValidationForm2() {
    print("provinces.value ${provinces.value}");
    if (provinces.value == "") {
      onError("${L10n.governorate.tr} ${L10n.isRequired.tr}");

      return false;
    }

    return true;
  }

  bool checkValidationForm3() {
    if (price.text == "") {
      onError("${L10n.price.tr} ${L10n.isRequired.tr}");
      return false;
    }
    if (imagesCar.isEmpty) {
      onError("${L10n.imagesCar.tr} ${L10n.isRequired.tr}");
      return false;
    }

    return true;
  }
}
