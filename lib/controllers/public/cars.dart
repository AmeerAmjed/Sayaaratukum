import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/controllers/pagination.dart';
import 'package:sayaaratukum/models/car.dart';
import 'package:sayaaratukum/services/remote/public/cars.dart';
import 'package:sayaaratukum/util/constant.dart';

class CarsController extends BaseController
    with StateMixin<List<CarModel>>, PaginationController, ScrollMixin {
  static CarsController get instance => Get.find();

  var brands = <CarModel>[].obs.toList(growable: true);
  RxBool isLoadingMore = false.obs;

  @override
  void onInit() {
    super.onInit();
    loading();
    getCars();
  }

  Future<void> getCars() async {
    try {
      await CarsServices.instance
          .getCars(page: page, limit: limitRepositories)
          .then((response) {
        if (response.isOk) {
          List<CarModel> result = CarModel.listFromJson(
            response.body[Constants.bodyData],
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
      print("getAllBrand ${response.statusCode}");
    }
  }

  @override
  Future<void> onEndScroll() async {
    print(" loadingggg more");
    if (!lastPage) {
      page += 1;
      loadingMore(true);
      change(brands, status: RxStatus.loadingMore());
      await getCars();
      Get.back();
    }
  }

  loading() {
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
    getCars();
  }

// navigateToDetails(CarModel tool) {
//   Get.to(() => CarDetails(tool: tool));
// }
}
