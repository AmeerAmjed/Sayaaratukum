import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/controllers/public/brand.dart';
import 'package:sayaaratukum/models/add_car.dart';
import 'package:sayaaratukum/models/brand.dart';
import 'package:sayaaratukum/models/category_tool.dart';
import 'package:sayaaratukum/services/remote/user/add_car.dart';
import 'package:sayaaratukum/services/remote/user/add_tool.dart';
import 'package:sayaaratukum/util/constant.dart';

class AddToolController extends BaseController {
  var onPageIndex = 0.obs;

  final int totalPageAddCar = 3;
  var brands = <BrandModel>[].obs.toList(growable: true);
  var category = <CategoryToolModel>[].obs.toList(growable: true);

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
  int idCategorySelected = 0;
  int idEnginePower = 0;
  var reColor = "".obs;
  var shakeCheck = "".obs;
  var gearBox = "".obs;
  var color = "".obs;
  var engineCapacity = .0.obs;
  var imagesCar = <String>[].obs.toList(growable: true);

  @override
  void onInit() {
    brands = BrandController.instance.brands;
    pageController = PageController(initialPage: onPageIndex.value);

    initInput();
    getCategories();
    super.onInit();
  }

  addCar() async {
    var info = AddCarModel(
      // name: name.text,
      // idBrand: idBrandSelected,
      // idModelBrand: idModelBrandSelected,
      // idEnginePower: idEnginePower,
      // yearModel
      // price: price.text,
      // color: color,
      name: 'asdfasdfasf',
      price: 0,
      color: 'b',
      engine: 12,
      yearModel: 222,
      idBrand: 1,
      idModelBrand: 195,
      idEnginePower: 2,
      userType: 'user',
      userId: 1,
      city: 'kut',
      gov: 'wasite',
      closerPoint: 'asdfasdf',
      gearbox: 'auto',
      mileage: 22,
      images: imagesCar,
    );

    try {
      await AddCarService.instance.addCar(info).then((response) {
        // print("response ${response.statusCode} ${response.body}");
        // if (response.isOk) {
        //
        // }
      });
    } on Response catch (response) {
      print("response ${response.statusCode} ${response.body}");
    }
  }

  Future<void> getCategories() async {
    try {
      await AddToolService.instance.getCategory().then((response) {
        if (response.isOk) {
          List<CategoryToolModel> resultCategory =
              CategoryToolModel.listFromJson(
            response.body[Constants.bodyData],
          );
          category.addAll(resultCategory);
          update();
        }
      });
    } on Response catch (response) {
      print("getCategory ${response.statusCode}");
    }
  }

  List<String> getCategoryListString() {
    return category.map((item) => item.name).toList();
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
  }

  onAddImage(List<XFile> pickedFiles) {
    List<String> imagesAllCar = [];
    List<String> images = pickedFiles
        .map(
          (XFile file) => File(file.path),
        )
        .toList()
        .map((e) => e.path)
        .toList();

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

  onSelectGear(int year) {}

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
        .map((brand) => brand.id == idBrandSelected
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

  onChangeCategory(String? newCategory) {
    if (newCategory != null) {
      category.firstWhere((item) {
        if (item.name == newCategory) {
          idCategorySelected = item.id;
          return true;
        }
        return false;
      });
    }
  }

  //endregion

  onChangeReColor(Object? option) {
    if (option == yesNo.first) {
      reColor.value = yesNo.first;
    } else {
      reColor.value = yesNo.last;
    }
    update();
  }

  onChangeColorCar(String? color) {
    if (color != null) {
      this.color.value = color;
    }
  }
}
