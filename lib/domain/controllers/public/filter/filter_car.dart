import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sayaaratukum/domain/controllers/controller.dart';
import 'package:sayaaratukum/domain/controllers/pagination.dart';
import 'package:sayaaratukum/domain/controllers/public/brand.dart';
import 'package:sayaaratukum/domain/controllers/public/engine_powers.dart';
import 'package:sayaaratukum/domain/models//brand.dart';
import 'package:sayaaratukum/domain/models//car.dart';
import 'package:sayaaratukum/domain/models//engine_power_type.dart';
import 'package:sayaaratukum/domain/models/translate_with_id.dart';
import 'package:sayaaratukum/util/error_handler.dart';

class FilterCarController extends BaseController
    with StateMixin<List<CarModel>>, PaginationController, ScrollMixin {
  static FilterCarController get instance => Get.find();

  var cars = <CarModel>[].obs.toList(growable: true);
  RxBool isLoadingMore = false.obs;

  var brands = <BrandModel>[].obs.toList(growable: true);
  var enginePowers = <EnginePowerModel>[].obs.toList(growable: true);

  Map<String, String> filterCarField = {};

  late GlobalKey<FormFieldState> brandFormKey;
  late GlobalKey<FormFieldState> modelBrandFormKey;
  late GlobalKey<FormFieldState> enginePowerKey;
  late GlobalKey<FormFieldState> engineCapacityKey;

  late TextEditingController minPrice;
  late TextEditingController maxPrice;

  late TextEditingController fromYear;
  late TextEditingController toYear;

  int idBrandSelected = 0;
  int idModelBrandSelected = 0;

  int idEnginePower = 0;
  double engineCapacity = 0;

  late TextEditingController search;
  RxBool isTextEmpty = true.obs;

  final int limitRepositories = 20;
  int page = 1;
  bool getFirstData = false;
  bool lastPage = false;

  @override
  void onInit() {
    brands = BrandController.instance.brands;
    brandFormKey = GlobalKey<FormFieldState>();
    modelBrandFormKey = GlobalKey<FormFieldState>();

    enginePowerKey = GlobalKey<FormFieldState>();
    engineCapacityKey = GlobalKey<FormFieldState>();

    super.onInit();
    init();
  }

  init() {
    minPrice = TextEditingController();
    maxPrice = TextEditingController();

    fromYear = TextEditingController();
    toYear = TextEditingController();

    search = TextEditingController();

    getAllEnginePower();

  }

  Map<String, String> getValueField() {
    filterCarField = {};
    filterCarField
        .addAllIf(idBrandSelected != 0, {"brand": "$idBrandSelected"});
    filterCarField.addAllIf(
        idModelBrandSelected != 0, {"model": "$idModelBrandSelected"});

    filterCarField.addAllIf(fromYear.text != "", {"min_year": fromYear.text});
    filterCarField.addAllIf(toYear.text != "", {"max_year": toYear.text});
    filterCarField.addAllIf(search.text != "", {"search": search.text});

    return filterCarField;
  }

  Future<void> getAllEnginePower() async {
    final enginePowersController = EnginePowersController.instance;

    ever(EnginePowersController.instance.enginePowers.obs, (newEnginePowers) {
      enginePowers = newEnginePowers;
    });

    enginePowers = enginePowersController.enginePowers;
  }

  Future<void> searchCar() async {
    try {
      // await SearchServices.instance
      //     .searchCarByBrandId(idBrand, page: page, limit: limitRepositories)
      //     .then((response) {
      //   if (response.isOk) {
      //     List<CarModel> result = CarModel.listFromJson(
      //       response.body[data],
      //     );
      //
      //     var responseData = response.body[data];
      //     final bool emptyRepositories =
      //     (responseData == null || responseData.isEmpty);
      //     if (!getFirstData && emptyRepositories) {
      //       change(null, status: RxStatus.empty());
      //     } else if (getFirstData && emptyRepositories) {
      //       lastPage = true;
      //       loadingMore(false);
      //     } else {
      //       getFirstData = true;
      //       cars.addAll(result);
      //       loadingMore(false);
      //       change(cars, status: RxStatus.success());
      //     }
      //   }
      // });
    } on Response catch (response) {
      RequestResult result = errorHandler(response);
      change(null, status: RxStatus.error(result.message));
      print("searchCarByBrandId ${response.statusCode}");
    }
  }

  @override
  Future<void> onEndScroll() async {
    if (!lastPage) {
      page += 1;
      loadingMore(true);
      change(cars, status: RxStatus.loadingMore());
      await searchCar();
      // Get.back();
    }
  }

  loadingData() {
    change(null, status: RxStatus.loading());
  }

  loadingMore(bool state) {
    isLoadingMore.value = state;
    update();
  }

  @override
  Future<void> onTopScroll() async {}

  //region Brand,Model Car
  onChangeBrand(TranslateWithIdMode? brand) {
    modelBrandFormKey.currentState?.reset();
    if (brand != null) {
      print("brand ${brand.id}  ${brand.defaultValue}");
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

  onChangeEnginePower(String? type) {
    enginePowers.firstWhere((item) {
      if (item.name == type) {
        idEnginePower = item.id;
        return true;
      }
      return false;
    });
  }

  //region Brand,Model Car

  onSelectFromYear(int? year) {
    if (year != null) {
      fromYear.text = (DateTime.now().year - year).toString();
    }
  }

  onSelectToYear(int? year) {
    if (year != null) {
      toYear.text = (DateTime.now().year - year).toString();
    }
  }

  //endregion
  onChangeEngineCapacity(String? size) {
    if (size != null) {
      engineCapacity = double.parse(size);
    }
  }

  cleanFilter() {
    print("clean all");
    brandFormKey.currentState?.reset();
    modelBrandFormKey.currentState?.reset();
    enginePowerKey.currentState?.reset();
    engineCapacityKey.currentState?.reset();

    minPrice.clear();
    maxPrice.clear();

    fromYear.clear();
    toYear.clear();

    _cleanField();
  }

  _cleanField() {
    idBrandSelected = 0;
    idModelBrandSelected = 0;

    idEnginePower = 0;
    engineCapacity = 0;
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
    super.dispose();
  }
}
