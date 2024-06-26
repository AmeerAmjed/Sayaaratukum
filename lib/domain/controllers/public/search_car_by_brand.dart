import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sayaaratukum/binding/public/car_details.dart';
import 'package:sayaaratukum/domain/controllers/controller.dart';
import 'package:sayaaratukum/domain/controllers/pagination.dart';
import 'package:sayaaratukum/domain/models//car.dart';
import 'package:sayaaratukum/ui/screens/details/car/car_details.dart';
import 'package:sayaaratukum/data/services/remote/public/search.dart';
import 'package:sayaaratukum/util/constant.dart';
import 'package:sayaaratukum/util/error_handler.dart';

class SearchCarByBrandController extends BaseController
    with StateMixin<List<CarModel>>, PaginationController, ScrollMixin {
  static SearchCarByBrandController get instance => Get.find();

  var cars = <CarModel>[].obs.toList(growable: true);
  RxBool isLoadingMore = false.obs;
  var idBrand = "";
  String? nameBrand;

  final int limitRepositories = 20;
  int page = 1;
  bool getFirstData = false;
  bool lastPage = false;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  init() {
    String? id = Get.parameters[Constants.brandIdKey];
    nameBrand = Get.parameters[Constants.nameBrandKey];
    if (id != null) {
      searchCarByBrandId(id);
    } else {}
    loadingData();
  }

  Future<void> searchCarByBrandId(String idBrand) async {
    this.idBrand = idBrand;
    try {
      await SearchServices.instance
          .searchCarByBrandId(idBrand, page: page, limit: limitRepositories)
          .then((response) {
        if (response.isOk) {
          List<CarModel> result = CarModel.listFromJson(
            response.body[data],
          );

          var responseData = response.body[data];
          final bool emptyRepositories =
              (responseData == null || responseData.isEmpty);
          if (!getFirstData && emptyRepositories) {
            change(null, status: RxStatus.empty());
          } else if (getFirstData && emptyRepositories) {
            lastPage = true;
            loadingMore(false);
          } else {
            getFirstData = true;
            cars.addAll(result);
            loadingMore(false);
            change(cars, status: RxStatus.success());
          }
        }
      });
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
      await searchCarByBrandId(idBrand);
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
}
