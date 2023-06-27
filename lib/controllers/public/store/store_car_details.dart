import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/controllers/controller.dart';
import 'package:sayaaratukum/controllers/pagination.dart';
import 'package:sayaaratukum/controllers/public/store/store_car_info_details.dart';
import 'package:sayaaratukum/controllers/user/favorite.dart';
import 'package:sayaaratukum/models/car.dart';
import 'package:sayaaratukum/models/store.dart';
import 'package:sayaaratukum/route/page.dart';
import 'package:sayaaratukum/services/remote/public/cars.dart';
import 'package:sayaaratukum/services/remote/user/favorite.dart';
import 'package:sayaaratukum/util/constant.dart';

class StoreCarDetailsController extends BaseController
    with StateMixin, PaginationController, ScrollMixin {
  static StoreCarDetailsController get instance => Get.find();

  RxStatus combinedStatus = RxStatus.loading();
  RxList<StoreModel> infoStore = <StoreModel>[].obs;
  RxList<CarModel> cars = <CarModel>[].obs;

  RxBool isLoadingMore = false.obs;
  var idStore = "0".obs;

  final int limitRepositories = 20;
  int page = 1;
  bool getFirstData = false;
  bool lastPage = false;

  @override
  void onInit() {
    super.onInit();
    idStore.value = Get.arguments[Constants.idStoreKey] ?? "0";

    loadingData();
    getCars();
  }

  Future<void> getCars() async {
    try {
      await CarsServices.instance
          .getCarsByStore(idStore.value, page: page, limit: limitRepositories)
          .then((response) {
        if (response.isOk) {
          List<CarModel> result = CarModel.listFromJson(
            response.body[Constants.bodyData],
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
      change(null, status: RxStatus.error());
      print("getAllBrand ${response.statusCode}");
    }
  }

  favoriteCar(CarModel car) async {
    changeStateLoadingItem(car.id, true);
    try {
      await FavoriteService.instance.toggleFavorite(car.id).then((response) {
        FavoriteController.instance.init();
        print("response $response");
        if (response.isOk) {
          if (response.status.code == 201) {
            changeStateLoadingItem(car.id, false, stateFav: true);
          } else if (response.status.code == 204) {
            changeStateLoadingItem(car.id, false, stateFav: false);
          }
        }
      });
    } on Response catch (response) {
      changeStateLoadingItem(
        car.id,
        false,
      );
      change(null, status: RxStatus.error());
      // loading(false);
      print("getFavorite ${response.statusCode} ${response.body} ");
    }
  }

  changeStateLoadingItem(int id, bool state, {bool? stateFav}) {
    cars.firstWhere((item) {
      if (item.id == id) {
        item.isLoadingFavorite = state;
        if (stateFav != null) {
          item.isFavorite = stateFav;
        }

        return true;
      }
      return false;
    });
    update();
  }

  @override
  Future<void> onEndScroll() async {
    if (!lastPage) {
      page += 1;
      loadingMore(true);
      change(cars, status: RxStatus.loadingMore());
      await getCars();
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
    getCars();
  }

  Future<void> onRefreshALl() async {
    getCars();
    InfoStoreCarDetails.instance.init();
  }

  navigateToDetails(int id) {
    Get.toNamed(
      RouteScreen.carDetails,
      arguments: {
        Constants.idCarKey: id.toString(),
      },
    );
  }

  @override
  void dispose() {
    idStore.value = "0";
    super.dispose();
  }
}
