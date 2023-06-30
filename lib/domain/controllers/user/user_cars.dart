import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/instance_manager.dart';
import 'package:sayaaratukum/domain/controllers/application.dart';
import 'package:sayaaratukum/domain/controllers/controller.dart';
import 'package:sayaaratukum/domain/controllers/pagination.dart';
import 'package:sayaaratukum/ui/l10n//lang.dart';
import 'package:sayaaratukum/domain/models//car.dart';
import 'package:sayaaratukum/data/services/remote/public/cars.dart';

class UserCarsController extends BaseController
    with StateMixin<List<CarModel>>, PaginationController, ScrollMixin {
  static UserCarsController get instance => Get.find();

  var cars = <CarModel>[].obs.toList(growable: true);
  RxBool isLoadingMore = false.obs;
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
    loadingData();
    getCars();
  }

  Future<void> getCars() async {
    var userId = Application.instance.user!.value!.id;
    try {
      await CarsServices.instance
          .getCarsByUserId(userId, page: page, limit: limitRepositories)
          .then((response) {
        if (response.isOk) {
          List<CarModel> result = CarModel.listFromJson(
            response.body[data],
          );

          // final bool emptyRepositories = response.body?.isEmpty ?? true;
          var responseData = response.body[data];
          final bool emptyRepositories = responseData.isEmpty;
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
      print("getCars ${response.statusCode}");
    }
  }

  Future<void> deleteCar(int id) async {
    try {
      await CarsServices.instance.deleteCarById(id).then((response) {
        if (response.isOk) {
          // final bool emptyRepositories = response.body?.isEmpty ?? true;
          if (response.statusCode == 204) {
            showMessage(L10n.carDeleted.tr);

            print("responseData $response");
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
    print(" loadingggg more");
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
    cars.clear();
    getCars();
  }

  searchByText(String text) {
    if (text.trim().isNotEmpty) init();
  }
}
