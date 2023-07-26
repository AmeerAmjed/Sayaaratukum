import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sayaaratukum/domain/controllers/controller.dart';
import 'package:sayaaratukum/domain/controllers/public/brand.dart';
import 'package:sayaaratukum/domain/controllers/public/category_tool.dart';
import 'package:sayaaratukum/domain/models//brand.dart';
import 'package:sayaaratukum/domain/models//category_tool.dart';
import 'package:sayaaratukum/domain/models//engine_power_type.dart';
import 'package:sayaaratukum/domain/models//tool.dart';
import 'package:sayaaratukum/domain/models/translate.dart';
import 'package:sayaaratukum/domain/models/translate_with_id.dart';

class FilterToolController extends BaseController with StateMixin {
  static FilterToolController get instance => Get.find();

  var cars = <ToolModel>[].obs.toList(growable: true);
  var category = <CategoryToolModel>[].obs.toList(growable: true);
  final statusTool = <String>["new", "used"];

  RxBool isLoadingMore = false.obs;

  var brands = <BrandModel>[].obs.toList(growable: true);
  var enginePowers = <EnginePowerModel>[].obs.toList(growable: true);

  Map<String, String> filterCarField = {};

  late GlobalKey<FormFieldState> brandFormKey;
  late GlobalKey<FormFieldState> modelBrandFormKey;
  late GlobalKey<FormFieldState> categoryFormKey;

  late TextEditingController minPrice;
  late TextEditingController maxPrice;
  late TextEditingController serialNumber;

  int idBrandSelected = 0;
  int idModelBrandSelected = 0;
  var statusSelected = "".obs;

  var idCategorySelected = 0.obs;

  late TextEditingController search;
  RxBool isTextEmpty = true.obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() {
    minPrice = TextEditingController();
    maxPrice = TextEditingController();
    serialNumber = TextEditingController();

    search = TextEditingController();
    change(null, status: RxStatus.success());

    brands = BrandController.instance.brands;
    brandFormKey = GlobalKey<FormFieldState>();
    modelBrandFormKey = GlobalKey<FormFieldState>();
    categoryFormKey = GlobalKey<FormFieldState>();
    getCategories();
  }

  getCategories() async {
    change(null, status: RxStatus.loading());

    var categoryTool = CategoryToolController.instance.category;
    if (categoryTool.isEmpty) {
      await CategoryToolController.instance.getCategoriesNow().then((result) {
        change(null, status: RxStatus.success());

        category.addAll(result);
        update();
      });
    } else {
      change(null, status: RxStatus.success());

      category.addAll(categoryTool);
      update();
    }
  }

  Map<String, String> getValueField() {
    print(" statusSelected.value ${statusSelected.value}");
    filterCarField = {};
    filterCarField
        .addAllIf(idBrandSelected != 0, {"brand": "$idBrandSelected"});
    filterCarField.addAllIf(
        idModelBrandSelected != 0, {"model": "$idModelBrandSelected"});
    filterCarField
        .addAllIf(statusSelected.value != "", {"status": statusSelected.value});

    filterCarField.addAllIf(search.text != "", {"search": search.text});
    filterCarField.addAllIf(
        serialNumber.text != "", {"serial_number": serialNumber.text});

    return filterCarField;
  }


  //region Brand,Model Car
  onChangeBrand(TranslateWithIdMode? brand) {
    modelBrandFormKey.currentState?.reset();
    if (brand != null) {
      idBrandSelected = brand.id;
      getModelByBrandId();
      update();
    }
  }

  List<TranslateWithIdMode> getModelByBrandId() {
    return brands
        .map((brand) => brand.id == idBrandSelected
        ? brand.models.map((model) => model.name).toList()
        : [])
        .expand((list) => list)
        .cast<TranslateWithIdMode>()
        .toList();
  }

  onChangeModelBrand(TranslateWithIdMode? model) {
    if (model != null) {
      idModelBrandSelected = model.id;
    }
  }

//endregion

  tryGetCategoriesWhenFailed() {
    if (category == []) {
      getCategories();
    }
  }

  List<String> getCategoryListString() {
    return category.map((item) => item.name).toList();
  }

  onChangeCategory(String? newCategory) {
    if (newCategory != null) {
      category.firstWhere((item) {
        if (item.name == newCategory) {
          idCategorySelected.value = item.id;
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

  cleanFilter() {
    print("clean all");
    brandFormKey.currentState?.reset();
    modelBrandFormKey.currentState?.reset();
    categoryFormKey.currentState?.reset();

    minPrice.clear();
    serialNumber.clear();
    maxPrice.clear();

    _cleanField();
  }

  _cleanField() {
    idBrandSelected = 0;
    idModelBrandSelected = 0;
    statusSelected.value = "";
    idCategorySelected.value = 0;
    update();
  }

  //region search box

  searchByText(String text) {
    if (text.trim().isNotEmpty) ;
  }

  void onTextChanged(String text) {
    isTextEmpty.value = text.isEmpty;
    update();
  }

  void clearSearch() {
    search.clear();
    search.text = "";
    isTextEmpty.value = true;
    update();
  }

  //endregion

  @override
  void dispose() {
    search.dispose();
    serialNumber.dispose();
    minPrice.dispose();
    maxPrice.dispose();
    super.dispose();
  }
}
