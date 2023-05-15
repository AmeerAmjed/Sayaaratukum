import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/controllers/public/brand.dart';
import 'package:sayaaratukum/models/brand.dart';
import 'package:sayaaratukum/models/engine_power_type.dart';
import 'package:sayaaratukum/screens/add_car/components/inforamtion_car_form.dart';
import 'package:sayaaratukum/screens/add_car/components/location_car_form.dart';
import 'package:sayaaratukum/services/remote/user/engine_power_type.dart';
import 'package:sayaaratukum/util/constant.dart';

import '../../screens/add_car/components/image_price_form.dart';

class AddCarController extends BaseController {
  var onPageIndex = 0.obs;

  final int totalPageAddCar = 3;
  var brands = <BrandModel>[].obs.toList(growable: true);
  var enginePowers = <EnginePowerModel>[].obs.toList(growable: true);
  var stepForm = const <Widget>[
    InformationCarForm(),
    LocationCarForm(),
    ImageWithPriceForm()
  ];
  final yesNo = <String>["yes", "no"];
  final typeGearBox = <String>["RadioGroup", "no"];

  bool get isLastPage => onPageIndex.value == totalPageAddCar - 1;
  late PageController pageController;

  late TextEditingController name;
  late TextEditingController yearModel;
  late TextEditingController drivingMiles;
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
  var color = "".obs;
  var engineCapacity = .0.obs;
  var imagesCar = <File>[].obs.toList(growable: true);


  @override
  void onInit() {
    brands = BrandController.instance.brands;
    pageController = PageController(initialPage: onPageIndex.value);

    initInput();
    getAllEnginePower();
    super.onInit();
  }

  addCar() {
    // AddCarModel(
    //   name: name.text,
    //   idBrand: idBrandSelected,
    //   idModelBrand: idModelBrandSelected,
    //   idEnginePower: idEnginePower,
    //   yearModel
    //   price: price.text,
    //   color: color,
    // )
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
    name = TextEditingController();
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
    List<File> imagesAllCar = [];
    List<File> images = pickedFiles
        .map(
          (XFile file) => File(file.path),
        )
        .toList();

    imagesCar.addAll(images);
    imagesAllCar.addAll(imagesCar);
    imagesCar.clear();
    imagesCar.addAll(imagesAllCar.sublist(0, 11));
    update();
  }

  onClickDeleteImage(File file) {
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
