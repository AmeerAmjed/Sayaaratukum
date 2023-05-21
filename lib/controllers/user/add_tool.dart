import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/controllers/public/brand.dart';
import 'package:sayaaratukum/controllers/public/category_tool.dart';
import 'package:sayaaratukum/l10n/lang.dart';
import 'package:sayaaratukum/models/add_tool.dart';
import 'package:sayaaratukum/models/brand.dart';
import 'package:sayaaratukum/models/category_tool.dart';
import 'package:sayaaratukum/services/remote/user/add_tool.dart';
import 'package:sayaaratukum/util/constant.dart';

class AddToolController extends BaseController {
  var brands = <BrandModel>[].obs.toList(growable: true);
  var category = <CategoryToolModel>[].obs.toList(growable: true);
  final statusTool = <String>["new", "used"];

  late GlobalKey<FormState> formKey;
  late GlobalKey<FormFieldState> keyManagerModelBrand;
  late TextEditingController name;
  late TextEditingController color;
  late TextEditingController price;
  late TextEditingController description;

  int idBrandSelected = 0;
  int idModelBrandSelected = 0;
  int idCategorySelected = 0;
  var statusSelected = "".obs;
  var imagesTool = "".obs;

  @override
  void onInit() {
    brands = BrandController.instance.brands;
    initInput();
    getCategories();
    super.onInit();
  }

  initInput() {
    formKey = GlobalKey<FormState>();
    keyManagerModelBrand = GlobalKey<FormFieldState>();
    name = TextEditingController();
    color = TextEditingController();
    price = TextEditingController();
    description = TextEditingController();
  }

  addTool() async {
    loading(true);

    try {
      await AddToolService.instance.add(getFormData()).then((response) {
        loading(false);

        print("response ${response.statusCode} ${response.body}");
        if (response.isOk) {
          showMessage(L10n.success.tr, L10n.successAddTool.tr);
        }
      });
    } on Response catch (response) {
      loading(false);

      onError(L10n.failedPublishTool.tr, response.body[message]);
      print("response ${response.statusCode} ${response.body}");
    }
  }

  FormAddToolModel getFormData() {
    return FormAddToolModel(
      idStore: 1,
      name: name.text,
      idBrand: idBrandSelected,
      idModelBrand: idModelBrandSelected,
      idCategory: idCategorySelected,
      color: color.text,
      price: int.parse(price.text),
      description: description.text == "" ? null : description.text,
      image: imagesTool.value,
      status: statusSelected.value,
    );
  }

  getCategories() {
    category.addAll(CategoryToolController.instance.category);
  }

  tryGetCategoriesWhenFailed() {
    if (category == []) {
      CategoryToolController.instance.getCategories().then((value) {
        getCategories();
      });
    }
  }

  List<String> getCategoryListString() {
    return category.map((item) => item.name).toList();
  }

  Future<void> selectToolImage() async {
    imagesTool.value = "";
    await ImagePicker().pickImage(source: ImageSource.gallery).then((image) {
      if (image != null) {
        imagesTool.value = File(image.path).path;
      }
    });
    update();
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

  onChangeStatus(Object? option) {
    if (option == statusTool.first) {
      statusSelected.value = statusTool.first;
    } else {
      statusSelected.value = statusTool.last;
    }
    update();
  }

  bool checkValidationForm() {
    if (name.text == "") {
      onError(
          L10n.failedPublishTool.tr, "${L10n.name.tr} ${L10n.isRequired.tr}");

      return false;
    } else if (idBrandSelected == 0) {
      onError(
          L10n.failedPublishTool.tr, "${L10n.brand.tr} ${L10n.isRequired.tr}");

      return false;
    } else if (idModelBrandSelected == 0) {
      onError(
          L10n.failedPublishTool.tr, "${L10n.model.tr} ${L10n.isRequired.tr}");

      return false;
    } else if (idCategorySelected == 0) {
      onError(L10n.failedPublishTool.tr,
          "${L10n.category.tr} ${L10n.isRequired.tr}");

      return false;
    } else if (price.text == "") {
      onError(
          L10n.failedPublishTool.tr, "${L10n.price.tr} ${L10n.isRequired.tr}");

      return false;
    } else if (imagesTool.value == "") {
      onError(L10n.failedPublishTool.tr,
          "${L10n.imagesTool.tr} ${L10n.isRequired.tr}");

      return false;
    } else if (statusSelected.value == "") {
      onError(L10n.failedPublishTool.tr,
          "${L10n.statusTool.tr} ${L10n.isRequired.tr}");

      return false;
    }
    return true;
  }
}
