import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/data/services/remote/public/search.dart';
import 'package:sayaaratukum/domain/controllers/controller.dart';
import 'package:sayaaratukum/domain/controllers/pagination.dart';
import 'package:sayaaratukum/domain/controllers/public/filter/filter_car.dart';
import 'package:sayaaratukum/domain/models//car.dart';

class SearchCarsController extends BaseController
    with StateMixin<List<CarModel>>, PaginationController, ScrollMixin {
  static SearchCarsController get instance => Get.find();

  var brands = <CarModel>[].obs.toList(growable: true);
  RxBool isLoadingMore = false.obs;

  Map<String, String> filter = {};

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
    filter = FilterCarController.instance.getValueField();
    loadingData();
    getCars(filter);
  }

  Future<void> getCars(Map<String, String> filter) async {
    getFirstData = false;
    try {
      await SearchServices.instance
          .searchCar(filter, page: page, limit: limitRepositories)
          .then((response) {
        if (response.isOk) {
          List<CarModel> result = CarModel.listFromJson(
            response.body[data],
          );

          final bool emptyRepositories = response.body?.isEmpty ?? true;
          if (!getFirstData && emptyRepositories) {
            change(null, status: RxStatus.empty());
          } else if (getFirstData && emptyRepositories) {
            lastPage = true;
            loadingMore(false);
          } else {
            getFirstData = true;
            brands.addAll(result);
            loadingMore(false);
            change(brands, status: RxStatus.success());
          }
        }
      });
    } on Response catch (response) {
      change(null, status: RxStatus.error());
      print("getCars ${response.statusCode}");
    }
  }

  @override
  Future<void> onEndScroll() async {
    print(" loadingggg more $filter");

    if (!lastPage) {
      page += 1;
      loadingMore(true);
      change(brands, status: RxStatus.loadingMore());
      await getCars(filter);
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

  bool stateLastItem(int index, int length) {
    return index >= length && isLoadingMore.value;
  }

  @override
  Future<void> onTopScroll() async {
    print(" state more");
  }

  Future<void> onRefresh() async {
    getCars(filter);
  }

  searchByText(String text) {
    if (text.trim().isNotEmpty) init();
  }
}
